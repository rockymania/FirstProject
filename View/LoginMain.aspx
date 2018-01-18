<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginMain.aspx.cs" Inherits="View_LoginMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        div.button1{
            text-align:left;
            width:471px;
            height:20px;
            font-size:20px;
        }
         div.button2{
            text-align:left;
            width:280px;
            height:20px;
            font-size:20px;
            
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="button1">
            <asp:Label ID="Account_Label" runat="server" Text="Account:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="Input_Acc" runat="server" ></asp:TextBox>
        </div>
        <br />
        <div class="button2">
            <asp:Label ID="Password_Label" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="Input_Pass" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
