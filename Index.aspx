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
    <title>�n�J�b��</title>
</head>
<body style="width: 1121px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
        �п�J�b��:<asp:TextBox ID="Account_Text" runat="server" ToolTip="�b��" ></asp:TextBox>
        <br />
        <br />
        �п�J�K�X:<asp:TextBox ID="PassWord_Text" runat="server" ToolTip="�K�X"></asp:TextBox>
        <br />
            <asp:Panel ID="Panel2" runat="server">
                �ЦA���T�w�K�X:<asp:TextBox ID="CheckPassword_Text" runat="server" ToolTip="�K�X"></asp:TextBox>
                <br />
                �п�J���U�H�c:<asp:TextBox ID="CreateMail" runat="server" ToolTip="�H�c"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="Yellow" ControlToValidate="CreateMail" ErrorMessage="�п�J���T���H�c" ForeColor="#CC0000" SkinID="CreateMail" ValidateRequestMode="Disabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </asp:Panel>
        <br />
        </asp:Panel>

        <asp:Button ID="Button1" runat="server" Text="�e�X" OnClick="Button1_Click" Width="50px" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="�M��" />
        <br />
         <br />
        <asp:Panel ID="Panel3" runat="server">
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="�Х߷s��"/>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel4" runat="server">
            <asp:Button ID="Button4" runat="server" Text="���Ш�" OnClick="Button4_Click" CausesValidation="False" UseSubmitBehavior="False" />
        </asp:Panel>
    </form>
</body>
</html>
