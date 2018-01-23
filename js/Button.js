$("#region_West").html("<div> <a>測試</a> </div>");

function OpenMoneyControl() {
    var aUrl = "../ControlMoney/View/Control_Main.aspx";
    location.replace(aUrl);
    window.opener.location.reload();
    window.close();
}