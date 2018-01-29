<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_ProductButtonList.aspx.cs" Inherits="View_V_ProductButtonList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        .ButtonList 
        {
            width:100%;
            height:50px;

            padding:5px 5px 5px 5px;
        }

        

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>   
                 <a href="V_Test.aspx" target="View"> <input type ="button" value ="飲料銷售" class ="ButtonList""/> </a> 
            </div> <br />

            <div>  
                 <a href="V_ProductData.aspx" target="View"> <input type ="button" value ="餐點銷售" class="ButtonList"" /></a>
            </div><br />

            <div>
                <a href="V_Test.aspx" target="View"> <input type ="button" value ="出缺席" class="ButtonList"" /></a>
            </div><br />

            <div>
                <a href="V_Test.aspx" target="View"> <input type ="button" value ="客訴明細" class="ButtonList"" /></a>
            </div><br />

            <div> </div>
        </div>
    </form>
</body>
</html>
