local function normalize_typography(s)
        s = s:gsub("\xe2\x80\x98", "'")
        s = s:gsub("\xe2\x80\x99", "'")
        s = s:gsub("\xe2\x80\x9c", '"')
        s = s:gsub("\xe2\x80\x9d", '"')
        s = s:gsub("\xe2\x80\x93", " - ")
        s = s:gsub("\xe2\x80\x94", " - ")
        s = s:gsub("\xe2\x80\xa6", "...")
        s = s:gsub("%s%s+", " ")
        return s
    end
return function (instance)
    local doc = Document:new(instance)
    if not doc:IsDocReady() then return end
    if not instance.ui then error("No ReaderUI instance running") end
    local search = instance.ui.search
    local has_pages = instance.ui.document.info.has_pages
    local existing = {}
    if instance.ui.annotation and instance.ui.annotation.annotations then
        for _, ann in ipairs(instance.ui.annotation.annotations) do
            if ann.text then existing[ann.text] = true end
        end
    end
    table.sort(instance.targets.data, function(a, b)
        local pa = tonumber(tostring(a.page or ""):match("^(%d+)")) or 0
        local pb = tonumber(tostring(b.page or ""):match("^(%d+)")) or 0
        return pa < pb
    end)
    local n_existing = 0
    for _ in pairs(existing) do
        n_existing = n_existing + 1
    end
    local ctx = {
        file_path = instance.file_path,
        targets = instance.targets,
        finished = false,
    }
    ctx.popup = useRecreateStatusPopup(ctx)
    local used_xpointers = {}
    local first_xp_start, first_xp_end
    for idx, target in ipairs(instance.targets.data) do
        if target.status ~= ITargetStatus.SELECTED then goto continue end
        if (idx % 3 == 0) or (idx == #instance.targets.data) then
            useRecreateStatusPopup(ctx)
            UIManager:forceRePaint()
        end
        if existing[target.highlight] then
            instance.targets.data[idx].status = ITargetStatus.SKIPPED
            goto continue
        end
        if target.page and has_pages then
            instance.ui.paging:gotoPage(tonumber(target.page))
        end
        local query = #target.highlight > 150 and target.highlight:sub(1, 150) or target.highlight
        local res = search:searchFromCurrent(query, 0, false, true)
        local query_norm = normalize_typography(query)
        if (not res or #res == 0) and query_norm ~= query then
            log("[RETRY normalized]")
            res = search:searchFromCurrent(query_norm, 0, false, true)
        end
        if not res or #res == 0 then
            local base = query_norm
            for _, len in ipairs({ 80, 50 }) do
                if #base > len then
                    res = search:searchFromCurrent(base:sub(1, len), 0, false, true)
                    if res and #res > 0 then break end
                end
            end
        end
        if not res or #res == 0 then
            log("[RETRY backward]")
            local base = query_norm
            res = search:searchFromCurrent(base, 1, false, true)
            if (not res or #res == 0) and #base > 80 then
                res = search:searchFromCurrent(base:sub(1, 80), 1, false, true)
            end
            if (not res or #res == 0) and #base > 50 then
                res = search:searchFromCurrent(base:sub(1, 50), 1, false, true)
            end
        end
        if not res or #res == 0 then
            local first = query_norm:sub(1, 1)
            if first == '"' or first == "'" then
                local inner = query_norm:sub(2):gsub('["\']%s*[.,]?%s*$', ""):match("^%s*(.-)%s*$")
                if inner and #inner >= 20 then
                    log("[RETRY no-outer-quote]")
                    res = search:searchFromCurrent(inner, 0, false, true)
                    if (not res or #res == 0) and #inner > 80 then
                        res = search:searchFromCurrent(inner:sub(1, 80), 0, false, true)
                    end
                    if (not res or #res == 0) and #inner > 50 then
                        res = search:searchFromCurrent(inner:sub(1, 50), 0, false, true)
                    end
                end
            end
        end
        if not res or #res == 0 then
            local note_flag = target.note and " [had note]" or ""
            log(string.format("[FAIL%s] no match in document for: %s", note_flag, target.highlight))
            instance.targets.data[idx].status = ITargetStatus.FAILED
            goto continue
        end
        local xpointer_start = res[1].start
        local xpointer_end = res[1]["end"]
        local xp_key = xpointer_start .. "|" .. xpointer_end
        if used_xpointers[xp_key] then
            log(string.format("[SKIP dup xpointer] %s", target.highlight))
            instance.targets.data[idx].status = ITargetStatus.SKIPPED
            goto continue
        end
        used_xpointers[xp_key] = true
        if not first_xp_start then
            first_xp_start = xpointer_start
            first_xp_end   = xpointer_end
        end
        doc:CreateHighlightFromXPointer(xpointer_start, xpointer_end, target.highlight, target.note)
        instance.targets.data[idx].status = ITargetStatus.RESOLVED
        ::continue::
    end
    local failed = {}
    for _, t in ipairs(instance.targets.data) do
        if t.status == ITargetStatus.FAILED then failed[#failed + 1] = t end
    end
    ctx.finished = true
    useRecreateStatusPopup(ctx)
    UIManager:forceRePaint()
end
