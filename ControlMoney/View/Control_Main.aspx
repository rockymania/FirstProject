<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Control_Main.aspx.cs" Inherits="ControlMoney_View_Control_Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Control_Main</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $("#TopTitle").toggle();
            });
        });
        $(document).ready(function () {
            $("button").click(function () {
                $("p").toggle();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="TopTitle">
            <a href="../../Model/UploadData.aspx">新增紀錄</a>
            <a href="Control_LookData.aspx">觀看紀錄</a><a>檢查類別</a><a>修改紀錄</a><a>離開</a>
        </div>       
    </form>
     <button>縮放</button>
</body>
</html>
