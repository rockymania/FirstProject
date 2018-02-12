$("#region_West").html("<div> <a href='../View/Contorl_FrontPage.aspx'>測試</a> </div>" +
    "<div> <a href='../View/InitPage.aspx'> 112</a> </div>"
);
$("#Money_Conttol_List").html("<div> <a href= \"../View/V_UploadData.aspx\">新增紀錄</a>"
    + "<a href= \"../View/V_Control_LookData.aspx\">觀看紀錄</a>"
    + " </div>"
);


function OpenMoneyControl() {
    var aUrl = "../ControlMoney/View/Control_Main.aspx";
    location.replace(aUrl);
    window.opener.location.reload();
    window.close();
}

function OpenMoneyControlData() {
    //var aUrl = "../ControlMoney/View/Control_Main.aspx";
    //location.replace(aUrl);
    //window.opener.location.reload();
    //window.close();
    alert("2");
}

function OpenUrl(iUrl) {
    location.replace(iUrl);
    window.opener.location.reload();
    window.close();
}