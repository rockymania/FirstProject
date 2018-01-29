<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_ProductMain.aspx.cs" Inherits="View_V_ProductMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script type="text/javascript" src ="../js/ProductDataButton.js"></script>

        <frameset cols="15%,85%">
        <frame src="V_ProductButtonList.aspx" name ="Select"></frame>
        <frame src="V_ProductData.aspx" name ="View"></frame>

        </frameset>


</head>




<body>
    <form id="form1" runat="server">
        <div>




        </div>
    </form>
</body>
</html>
