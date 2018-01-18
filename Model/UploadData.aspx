<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadData.aspx.cs" Inherits="Model_UploadData" async ="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            品項:<asp:DropDownList ID="DropDownList1" runat="server" Width="50px">
                <asp:ListItem Value="0">食</asp:ListItem>
                <asp:ListItem Value="1">衣</asp:ListItem>
                <asp:ListItem Value="2">住</asp:ListItem>
                <asp:ListItem Value="3">行</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            價錢:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            時間:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            是否上傳照片:<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Height="47px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="56px">
                <asp:ListItem Value="0">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="1">否</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="下載圖片" />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <asp:FileUpload ID="UploadPic" runat="server" />
                <br />
                <br />
                <asp:Button ID="ConfirmUpload" runat="server" CausesValidation="False" OnClick="ConfirmUpload_Click" Text="確定上傳" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
