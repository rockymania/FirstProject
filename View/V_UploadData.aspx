<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_UploadData.aspx.cs" Inherits="View_V_UploadData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增資料</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/trontastic/jquery-ui.css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/layout.css"  />
    <script>
          $(function () {
              $("#datepicker").datepicker();
          });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Money_Conttol_List" class="ontopDiv"></div>
        <div>
            品項:<asp:DropDownList ID="DropDownList1" runat="server" Width="50px">
                <asp:ListItem Value="0">食</asp:ListItem>
                <asp:ListItem Value="1">衣</asp:ListItem>
                <asp:ListItem Value="2">住</asp:ListItem>
                <asp:ListItem Value="3">行</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            價錢:<asp:TextBox ID="TextBox1" runat="server" onkeypress="return IsIntText();"></asp:TextBox>
            <br />
            <br />
            時間:<asp:TextBox ID="datepicker" runat="server"></asp:TextBox>
            <br />
            <br />
           
            <br />
            <asp:Button ID="Confirm1" runat="server" OnClick="Confirm1_Click" Text="確定上傳" />
            <button type="submit"  onclick="javascript:UploadData()"></button>
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
    <script>
        function UploadData() {
            //擷取資料
            var aKind = 1;
            var aDropDownList = document.getElementById('DropDownList1').value;
            var aMoney = document.getElementById('TextBox1').value;
            var aTime = document.getElementById('datepicker').value;
            //檢查帳號密碼是否為空
            if (aMoney == null || aMoney == "") { alert('請輸入金錢'); return; }
            else if (aTime == null || aTime == "") { alert('請輸入時間'); return; }

            var aPlayerID = '<%=Session["Account"]%>';

            $.get("../Model/M_UploadData.aspx",
                {
                    Kind: aKind,
                    PlayerID: aPlayerID,
                    List: aDropDownList,
                    Time: aTime,
                    Money: aMoney,
                },
                function (result) {
                    console.log(result);
                    if (result == "99")
                        alert('參數錯誤');
                    else if (result == "1")
                        alert('查無帳號或密碼錯誤');
                    else if (result == "2")
                        alert('查無帳號或密碼錯誤');
                    else if (result == "0") {
                        alert('成功');
                    }
                }
            );
        }
        function IsIntText() {
            if (event.keyCode < 48 || event.keyCode > 57) {
                if (event.keyCode >= 45 && event.keyCode <= 46) {
                }
                else {
                    event.keyCode = "";
                }
            }
        }
    </script>


</body>
    <script type="text/javascript" src="../js/Button.js" ></script>
</html>
