﻿$("#MeunButton").html(
    "<ul class ='DropMenu'>" + 
    "<!--這是一個段落-->" +
    "<li><a href='V_ImageMain.aspx'>關於我們</a>" + 
    "</li> " + 
    "<!--這是一個段落-->" +
    "<li><a href='#'>商品種類</a>" +
    "<ul>" +
    "<li><a href='V_DrinkMenu.aspx'>飲料商品</a>" +
    "</li>" +
    "<li><a href='V_FoodMenu.aspx'>餐點商品</a>" +
    "</li>" +
    "</ul>" +
    "</li>" +
    "<!--這是一個段落-->" +
    "<li><a href='#'>客戶服務</a>" +
    "<ul>" +
    "<li><a href='V_MessageBoard.aspx'>留言板</a>" +
    "</li>" +
    "</ul>" +
    "</li>" +
    "<!--這是一個段落-->" +
    "</ul >"
);

$(function () {
    $(window).load(function () {
        $(window).bind('scroll resize', function () {
            var $this = $(this);
            var $this_Top = $this.scrollTop();

            if ($this_Top > 0)
                $("#MenuButton").stop().animate({ top: "0px" });
        }).scroll();
    });
});

$(function () {
    　$(window).load(function () {
        　　$(window).bind('scroll resize', function () {
            　　var $this = $(this);
            　　var $this_Top = $this.scrollTop();

            　　//當高度小於100時，關閉區塊 
            　　if ($this_Top < 100) {
                  $('#MenuButton').stop().animate({ top: "-65px" });
            　　　}
            　　　　if ($this_Top > 100) {
                    $('#MenuButton').stop().animate({ top: "0px" });
            }
        　　}).scroll();
    　});
});