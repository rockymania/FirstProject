<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_FoodMenu.aspx.cs" Inherits="View_V_FoodMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script>
    <script type="text/javascript" src ="../js/ProductDataButton.js"></script>
    <script>


    </script>

</head>
<body>
    <form id="form1" runat="server">
        <p id="Title" style="position:absolute;left:600px;top:0px; overflow-x:hidden">食物菜單 </p>
        <div id="UserView">
            
        </div>
    </form>
</body>
</html>

<script>
    $(document).ready(function SetFoodViewData() {
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
                        var vAddStr = GetStr(jData[i]["Name"], jData[i]["PicName"], jData[i]["Introduction"], jData[i]["Pice"], i);
                        //用JS動態加入HTML
                        document.all["UserView"].insertAdjacentHTML("BeforeEnd", vAddStr);
                    }
                },
            }
        );

        function GetStr(Name,PicName,Introduction,Price,Index )
        {
            var vLeftBase = 30 + ((Index % 5) * 250);
            var vTopBase = 50 + (Math.floor(Index / 5) * 400);

            var vReStr = "<div style =\"position:absolute; left:" + vLeftBase.toString() + "px;top:" + vTopBase.toString() +
                "px; \"> <image src=\"../Image/" + PicName + ".jpg\" border= \"1\" alt = \"找不到圖片\" title=\"" + Introduction +
                "\" width= \"240px\" height= \"240px\" ></image><br /> <table border=\"1\" style=\"width: 240px; height: 100px; \">" +
                " <tr><td>" + Introduction + "</td></tr></table ></div >";

            return vReStr;
        }
    });

</script>
