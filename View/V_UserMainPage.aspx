<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_UserMainPage.aspx.cs" Inherits="View_V_UserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>使用者頁面</title>

        <frameset cols="15%,85%">
        <frame src="V_UserButtonList.aspx "noresize name ="UserSelect"></frame>
        <frame src="V_DrinkMenu.aspx" noresize  name ="UserView"></frame>

        </frameset>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
