<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_MainPage.aspx.cs" Inherits="View_V_MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script type="text/javascript" src ="../js/Button.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>登入成功。這個是主頁</h1>
            <p>
                <asp:ImageButton OnClick="Control_Money_Click" ID="Control_Money" runat="server" ImageUrl="~/Image/C.jpg"  Width="120" Height="120"/>
            </p>
            <a href="javascript:GotoContolMoney(0)">新增資料</a>
        </div>
    </form>
    <script>
        function GotoContolMoney(kind) {
                OpenMoneyControl();
        }
    </script>
</body>
</html>
