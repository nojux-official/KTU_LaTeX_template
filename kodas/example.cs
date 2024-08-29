static void equilateralTriangle(byte[] t, (int x, int y) start, (int x, int y) end,
 int pic_height, int l)
{
    int width = Math.Abs(end.x - start.x);
    int height = Math.Abs(end.y - start.y);


    int side = width / 3;// width/3 is the length of the triangle's side
    int triangleHeight = (int)(side * Math.Sqrt(3) / 2);
    int padY = (height / 3 - triangleHeight) / 2;//to fix triangle positioning

    //triangle's vertices
    var v0 = (x: start.x + side, y: start.y + padY + side);
    var v1 = (x: start.x + side * 2, y: start.y + padY + side);
    var v2 = (x: start.x + width / 2, y: start.y + padY + side + triangleHeight);

    triangle(t, v0, v1, v2, pic_height, l);
}
