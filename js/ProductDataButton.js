function GetProductStr(Name, PicName, Introduction, Price, Index) {
    var vLeftBase = 30 + ((Index % 5) * 250);
    var vTopBase = 50 + (Math.floor(Index / 5) * 400);

    vReStr = "<div class=Item> <image src=../Image/" + PicName + ".jpg border= 1 alt = 找不到圖片 width= 240px height= 240px></image > "+
        "<table border=1 style=\"width: 240px; height: 100px; \"><tr><td>" + Introduction + "</td></tr></table ></div>";
            

    return vReStr;
}