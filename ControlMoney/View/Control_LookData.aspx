<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Control_LookData.aspx.cs" Inherits="ControlMoney_View_Control_LookData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RowID" DataSourceID="Money_Control">
                <Columns>
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" />
                    <asp:BoundField DataField="Kind" HeaderText="Kind" ReadOnly="True" SortExpression="Kind" />
                    <asp:BoundField DataField="DataTime" HeaderText="DataTime" SortExpression="DataTime" />
                    <asp:BoundField DataField="CostMoney" HeaderText="CostMoney" SortExpression="CostMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Money_Control" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="
SELECT RowID, PlayerID, (CASE WHEN Kind = '0' THEN N'食' WHEN Kind = '1' THEN N'衣' WHEN Kind = '2' THEN N'住' WHEN Kind = '3' THEN N'行' ELSE '0' END) AS Kind, DataTime, CostMoney FROM Money_Control">
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="編輯或移除資料" />
            <br />
            <br />
            <br />
            <hr />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="RowID" DataSourceID="TopMoney">
                <Columns>
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" />
                    <asp:BoundField DataField="Kind" HeaderText="Kind" SortExpression="Kind" ReadOnly="True" />
                    <asp:BoundField DataField="DataTime" HeaderText="DataTime" SortExpression="DataTime" />
                    <asp:BoundField DataField="CostMoney" HeaderText="CostMoney" SortExpression="CostMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TopMoney" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="SELECT TOP (3) RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney FROM Money_Control ORDER BY CostMoney DESC"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="KindTop">
                <Columns>
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" ReadOnly="True" SortExpression="PlayerID" />
                    <asp:BoundField DataField="Kind" HeaderText="Kind" ReadOnly="True" SortExpression="Kind" />
                    <asp:BoundField DataField="DataTime" HeaderText="DataTime" ReadOnly="True" SortExpression="DataTime" />
                    <asp:BoundField DataField="CostMoney" HeaderText="CostMoney" ReadOnly="True" SortExpression="CostMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="KindTop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="select RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney from (Select Top 1 * from Money_Control WHERE Kind =0 ORDER BY CostMoney desc)a
UNION
select RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney from (Select Top 1 * from Money_Control WHERE Kind =1 ORDER BY CostMoney desc)b
UNION
select RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney from (Select Top 1 * from Money_Control WHERE Kind =2 ORDER BY CostMoney desc)c
UNION
select RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney from (Select Top 1 * from Money_Control WHERE Kind =3 ORDER BY CostMoney desc)d
ORDER BY CostMoney desc"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="TotalKindMoney">
                <Columns>
                    <asp:BoundField DataField="Kind" HeaderText="種類" ReadOnly="True" SortExpression="Kind" />
                    <asp:BoundField DataField="TotalMoney" HeaderText="全部花費" ReadOnly="True" SortExpression="TotalMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TotalKindMoney" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="SELECT (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind ,Sum(CostMoney) AS TotalMoney FROM Money_Control
GROUP BY Kind ORDER by TotalMoney desc"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
