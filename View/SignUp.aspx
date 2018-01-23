<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="View_SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
       #Panel1
        {
            position:absolute;
            top:5%;
            left:40%;
        }
        
        #SubmitButton 
        {
            position:absolute;
            
        }

        #ClearButton 
        {
            position:absolute;
            left:55%;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Panel ID="Panel1" runat="server" Height="242px" Width="206px">
            <asp:Label ID="MailTitle" runat="server" Text="請輸入註冊信箱"></asp:Label>
            <br />
            <asp:TextBox ID="MailText" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="PasswordTitle" runat="server" Text="請輸入密碼"></asp:Label>
            <br />
            <asp:TextBox ID="PasswordText" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="AgianPasswordTitle" runat="server" Text="請再次輸入密碼"></asp:Label>
            <br />
            <asp:TextBox ID="AgianPasswordText" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="確認" />
            <asp:Button ID="ClearButton" runat="server" Text="清除" OnClick="ClearButton_Click" />
            <br />
            <br />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
