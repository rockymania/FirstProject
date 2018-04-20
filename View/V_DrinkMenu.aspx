<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_DrinkMenu.aspx.cs" Inherits="View_V_DrinkMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>飲料頁面</title>
    <link rel="stylesheet" type="text/css" href="../../CSS/Product.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script>
    <script type ="text/javascript" src="../js/ProductDataButton.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id ="UserView">
            <div style="width:1000px; text-align:center;margin:10px; padding:10px; font-weight:bolder;font-size:60px;">飲料菜單</div>
            <div id="MeunButton"></div>
        </div>
        <div id="Loading" style="display:none" > <img src="../Image/Loading.gif"/> <br />Loading</div>
    </form>

    <script type="text/javascript" src="../../js/MenuButton.js"></script>
</body>
</html>

<script>
    $(document).ready(function () {
        $.ajax
            (
            {
                    url: "../Model/M_DrinkMenu.aspx",
                    type: "GET",
                    dataType: "JSON",
                    
                    success: function (JData)
                    {
                        var vCount = JData.length;
                        var vContent = "";

                        for (var i = 0; i < vCount; i++)
                        {
                            var vAddStr = GetProductStr(JData[i]["Name"], JData[i]["PicName"], JData[i]["Introduction"], JData[i]["Price"], i);

                            vContent += vAddStr;

                            document.all["UserView"].insertAdjacentHTML("BeforeEnd", vAddStr);
                            
                        }

                        //$("#UserView").html(vContent);
                    },
                    beforeSend: function ()
                    {
                        $("#Loading").show();
                    },
                    complete: function ()
                    {
                        $("#Loading").hide();
                    },
                    error: function ()
                    {
                        alert("有錯誤喔");
                    }
            }
        )
    });


</script>