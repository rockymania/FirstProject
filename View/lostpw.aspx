<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lostpw.aspx.cs" Inherits="View_lostpw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 忘記密碼</h3>
            <p>請輸入註冊時的信箱:<asp:TextBox ID="TextBox1" runat="server" Width="383px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="請輸入正確信箱格式" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="請輸入信箱" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="請輸入隨機驗證碼:"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="請輸入驗證碼" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </p>
            <p style="margin-left: 320px">
                <asp:Button ID="SendLost" runat="server" OnClick="SendLost_Click" Text="送出" />
            </p>
        </div>
    &nbsp;
        <asp:Label ID="GetPW" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
