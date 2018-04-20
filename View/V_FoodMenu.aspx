<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_FoodMenu.aspx.cs" Inherits="View_V_FoodMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../CSS/Product.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script>
    <script type="text/javascript" src ="../js/ProductDataButton.js"></script>
    
</head>

<body>
    <form id="form1" runat="server">
        
        <div id="UserView">
            <div style="width:1000px; text-align:center;margin:10px; padding:10px; font-weight:bolder;font-size:60px;">餐點菜單</div>
            <div id="MeunButton"></div>
        </div>
        
        <div id="Loading" style="display:none"> <img src="../Image/Loading.gif" /> <br /> Loading </div>
    </form>
    <script type="text/javascript" src="../../js/MenuButton.js"></script>
</body>
</html>

<script>
    $(document).ready(function () {
        $.ajax
            (
            {
                url: "../Model/M_FoodMenu.aspx",
                type: "GET",
                dataType: "JSON",
                success: function (jData) {

                    var vCount = jData.length;
                    
                    for (var i = 0; i < vCount; i++)
                    {
                        var vAddStr = GetProductStr(jData[i]["Name"], jData[i]["PicName"], jData[i]["Introduction"], jData[i]["Price"], i);
                        //用JS動態加入HTML
                        document.all["UserView"].insertAdjacentHTML("BeforeEnd", vAddStr);
                    }
                },
                //讓loading圖出來
                beforeSend: function ()
                {
                    $("#Loading").show();
                },
                //讓loading圖消失
                complete: function ()
                {
                    $("#Loading").hide();
                }
            }
        );
    });
</script>
