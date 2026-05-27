
## Installation

Copy the fonts to user fonts directory. On Linux, this is `~/.local/share/fonts/`. On Windows, this is `C:\Users\<username>\AppData\Local\Microsoft\Windows\Fonts`. On MacOS, this is `~/Library/Fonts/`.

On debian-based Linux distributions:

<code>

mkdir -p ~/.local/share/fonts/

cp *.ttf ~/.local/share/fonts/

apt install fontconfig

fc-cache -f -v

</code>