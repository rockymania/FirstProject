﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_MessageBoard.aspx.cs" Inherits="View_V_MessageBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style>
    #TitleLabel 
    {
        font-size:40px;
        right:50%;

        position:absolute;
    }
    div
    {
        position:absolute;
        right:48%;
        bottom:65%;
    }

</style>

</head>

<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <label id="TitleLabel">留言板</label>
        <p></p>
        <p></p>
        <div>

        <p><label>*姓名</label><input id="NameInput"/></p>
        <p><label>*電話</label><input id="PhoneInput" /></p>
        <p><label>*信箱</label><input id="MailInput"</p>

        </div>
        <p><label style="position:absolute;right:52%;bottom:62%;">留言內容</label></p>
        <textarea style="width:600px;height:300px;position:absolute;right:33%;bottom:20%;">輸入你想要寫的內容...</textarea>
        <p></p>
        <p></p>
        <button type="button" style="position:absolute;bottom:10%;width:70px;height:35px;right:54%">送出</button>
        <button type="button" style="position:absolute;bottom:10%;width:70px;height:35px;right:49%">返回</button>

        
    </form>
</body>
</html>
