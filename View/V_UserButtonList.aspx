<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_UserButtonList.aspx.cs" Inherits="View_V_UserButtonList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        .Button_List 
        {
            width:200px;
            height:70px;
            margin:5px;/*間距*/
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

       <div>
           <a href="V_DrinkMenu.aspx" target="UserView"> <input type="button" value="飲料菜單" class="Button_List" /> </a>
       </div> 
       <div>
           <a href="V_FoodMenu.aspx" target="UserView"> <input type="button" value="餐點菜單" class="Button_List" /> </a>
       </div> 
       <div>
           <a href="V_MessageBoard.aspx" target="UserView"> <input type="button" value="意見留言板" class="Button_List"/> </a>
       </div> 

    </form>
</body>
</html>

