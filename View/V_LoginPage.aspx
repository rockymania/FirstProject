<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_LoginPage.aspx.cs" Inherits="View_V_LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登入畫面</title>
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
         th.login{
             position:absolute;
         }
         td.hide{
             border:0px;
         }
        .auto-style1 {
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
     <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table class="BOX" border="1">
            <tr>
            <th class="acc" style="left: 500px"> <asp:Label ID="Account_Label" runat="server" Text="Account:"></asp:Label></th>
            <td> <asp:TextBox ID="Input_Acc" runat="server" ></asp:TextBox> 
                </td>
            </tr>
            <tr>
            <th class="acc" style="left: 500px"> <asp:Label ID="Password_Label" runat="server" Text="Password:"></asp:Label></th>
            <td > <asp:TextBox ID="Input_Pass" runat="server" TextMode="Password" ></asp:TextBox> 
                </td>
            </tr>
            <tr>
            <th> <asp:Button ID="Reset_Btn" runat="server" Text="重置" BackColor="Red" OnClick="Reset_Btn_Click" style="height: 21px" CausesValidation="False"/></th>
            <td class="auto-style3"> <a href="javascript:Login()" aria-orientation="vertical" >登入</a> </td> 
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
				<a href="SignUp.aspx">註冊帳號</a> , <a href="V_lostpw.aspx?lost=1">忘記密碼？</a><br />
				</td>
            </tr>
        </table>
        
    </form>
    <script>
        function Login() {
            //擷取資料
            var aAccValue = document.getElementById('Input_Acc').value; 
            var aPassValue = document.getElementById('Input_Pass').value;
            //檢查帳號密碼是否為空
            if (aAccValue == null || aAccValue == "")
            { alert('請輸入帳號'); return; }
            else if (aPassValue == null || aPassValue == "")
            { alert('請輸入密碼'); return; }
            //準備登入
            $.get("../Model/M_Login.aspx",
                {
                    Acc: aAccValue,
                    Pass: aPassValue,
                },
                function (result) {
                    if (result == "99")
                        alert('參數錯誤');
                    else if (result == "1")
                        alert('查無帳號或密碼錯誤');
                    else if (result == "2")
                        alert('查無帳號或密碼錯誤');
                    else if (result == "0") {
                        var aUrl = "V_MainPage.aspx?";
                        location.replace(aUrl);
                        window.opener.location.reload();
                        window.close();
                    }
                }
            );
        }
    </script>


    </body>
</html>
