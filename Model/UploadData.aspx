<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadData.aspx.cs" Inherits="Model_UploadData" async ="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/trontastic/jquery-ui.css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     <script>
      $(function () {
          $("#datepicker").datepicker();
      });
  </script>
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
            時間:<asp:TextBox ID="datepicker" runat="server"></asp:TextBox>
            <br />
            <br />
           
            <br />
            <asp:Button ID="Confirm1" runat="server" OnClick="Confirm1_Click" Text="確定上傳" />
            <br />
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <asp:FileUpload ID="UploadPic" runat="server" />
                <br />
                <br />
                <asp:Button ID="ConfirmUpload" runat="server" CausesValidation="False" OnClick="ConfirmUpload_Click" Text="確定上傳" />
            </asp:Panel>

             <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Height="47px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="56px" Visible="False">
                <asp:ListItem Value="0">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="1">否</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </form>
</body>
</html>
