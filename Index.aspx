<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=Big5"/>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <title>登入帳號</title>
</head>
<body style="width: 1121px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
        請輸入帳號:<asp:TextBox ID="Account_Text" runat="server" ToolTip="帳號" ></asp:TextBox>
        <br />
        <br />
        請輸入密碼:<asp:TextBox ID="PassWord_Text" runat="server" ToolTip="密碼"></asp:TextBox>
        <br />
            <asp:Panel ID="Panel2" runat="server">
                請再次確定密碼:<asp:TextBox ID="CheckPassword_Text" runat="server" ToolTip="密碼"></asp:TextBox>
                <br />
                請輸入註冊信箱:<asp:TextBox ID="CreateMail" runat="server" ToolTip="信箱"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="Yellow" ControlToValidate="CreateMail" ErrorMessage="請輸入正確的信箱" ForeColor="#CC0000" SkinID="CreateMail" ValidateRequestMode="Disabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </asp:Panel>
        <br />
        </asp:Panel>

        <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" Width="50px" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="清除" />
        <br />
         <br />
        <asp:Panel ID="Panel3" runat="server">
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="創立新角"/>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel4" runat="server">
            <asp:Button ID="Button4" runat="server" Text="放棄創角" OnClick="Button4_Click" CausesValidation="False" UseSubmitBehavior="False" />
        </asp:Panel>
    </form>
</body>
</html>
