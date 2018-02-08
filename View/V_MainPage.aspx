<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_MainPage.aspx.cs" Inherits="View_V_MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script type="text/javascript" src ="../js/Button.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>登入成功。這個是主頁</h1>
            <p>
                <img usemap="#Money" alt="image" data-sizes="auto" src="../Image/C.jpg" style="width:150px;height:150px;"title="Money_Control" />
            </p>
            <map name="Money">
                  <area shape="rect" coords="0,0,150,150" alt="Sun" href="V_Control_Main.aspx"/>
            </map>
             <p>
                <img usemap="#Money2" alt="image" data-sizes="auto" src="../Image/B.jpg" style="width:150px;height:150px;"title="Money_Control" />
            </p>

        </div>
    </form>

</body>
</html>
