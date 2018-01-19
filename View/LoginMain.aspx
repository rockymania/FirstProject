<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginMain.aspx.cs" Inherits="View_LoginMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        div.button1{
            text-align:left;
            font-size:20px;
        }
         div.button2{
            text-align:left;
            width:280px;
            height:20px;
            font-size:20px;
        }
         div.Move{
             padding:0px 0px 0px 50px;
         }
         th.acc{
             font-size:20px;
         }
    </style>
    <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
</head>
<body>
    <form id="form1" runat="server">
        <table class="BOX" border ="5">
            <tr>
            <th class="acc" style="left: 500px"> <asp:Label ID="Account_Label" runat="server" Text="Account:"></asp:Label></th>
            <th> <asp:TextBox ID="Input_Acc" runat="server" ></asp:TextBox> </th>
            </tr>
            <tr>
            <th class="acc" style="left: 500px"> <asp:Label ID="Password_Label" runat="server" Text="Password:"></asp:Label></th>
            <th> <asp:TextBox ID="Input_Pass" runat="server" ></asp:TextBox> </th>
            </tr>
            <tr>
                <th>
                    <a href="javascript:Test()" >登入</a>
                </th>
            </tr>
        </table>
    </form>
    <script>
        function Test()
        {
            alert("0!!");
        }
    </script>
</body>
</html>
