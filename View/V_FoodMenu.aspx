<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_FoodMenu.aspx.cs" Inherits="View_V_FoodMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script>
    <script type="text/javascript" src ="../js/ProductDataButton.js"></script>
    <style>
        #Loading 
        {
            position:absolute;
            width:50px;
            top:50%;
            right:50%;
        }

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <p id="Title" style="position:absolute;left:600px;top:0px; overflow-x:hidden">食物菜單 </p>
        <div id="UserView"></div>
        <div id="Loading" style="display:none"> <img src="../Image/Loading.gif" /> <br /> Loading </div>
    </form>
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
