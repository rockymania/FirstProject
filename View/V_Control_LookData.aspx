<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_Control_LookData.aspx.cs" Inherits="View_V_Control_LookData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../CSS/layout.css?2008"  />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Money_Conttol_List" class="ontopDiv"></div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RowID" DataSourceID="Money_Control">
                <Columns>
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" />
                    <asp:BoundField DataField="Kind" HeaderText="Kind" ReadOnly="True" SortExpression="Kind" />
                    <asp:BoundField DataField="DataTime" HeaderText="DataTime" SortExpression="DataTime" />
                    <asp:BoundField DataField="CostMoney" HeaderText="CostMoney" SortExpression="CostMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Money_Control" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" 
                SelectCommand="SELECT RowID, PlayerID, (CASE WHEN Kind = '0' THEN N'食' WHEN Kind = '1' THEN N'衣' WHEN Kind = '2' THEN N'住' WHEN Kind = '3' THEN N'行' ELSE '0' END) AS Kind, DataTime, CostMoney FROM Money_Control WHERE ([PlayerID] = @PlayerID)" 
                DeleteCommand="DELETE FROM [Money_Control] WHERE [RowID] = @RowID" 
                InsertCommand="INSERT INTO [Money_Control] ([PlayerID], [Kind], [DataTime], [CostMoney]) VALUES (@PlayerID, @Kind, @DataTime, @CostMoney)" 
                UpdateCommand="UPDATE [Money_Control] SET [PlayerID] = @PlayerID, [Kind] = @Kind, [DataTime] = @DataTime, [CostMoney] = @CostMoney WHERE [RowID] = @RowID">
                <SelectParameters>
                    <asp:SessionParameter Name="PlayerID" SessionField="Account" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="RowID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PlayerID" />
                    <asp:Parameter Name="Kind" />
                    <asp:Parameter Name="DataTime" />
                    <asp:Parameter Name="CostMoney" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PlayerID" />
                    <asp:Parameter Name="Kind" />
                    <asp:Parameter Name="DataTime" />
                    <asp:Parameter Name="CostMoney" />
                    <asp:Parameter Name="RowID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="編輯或移除資料" />
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
            <asp:SqlDataSource ID="TopMoney" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="SELECT TOP (3) RowID, PlayerID, (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind, DataTime, CostMoney FROM Money_Control ORDER BY CostMoney DESC WHERE ([PlayerID] = @PlayerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="PlayerID" SessionField="Account" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
                            ORDER BY CostMoney desc WHERE ([PlayerID] = @PlayerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="PlayerID" SessionField="Account" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="TotalKindMoney">
                <Columns>
                    <asp:BoundField DataField="Kind" HeaderText="種類" ReadOnly="True" SortExpression="Kind" />
                    <asp:BoundField DataField="TotalMoney" HeaderText="全部花費" ReadOnly="True" SortExpression="TotalMoney" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TotalKindMoney" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDaddy %>" SelectCommand="SELECT (CASE WHEN Kind = 0 THEN N'食' WHEN Kind = 1 THEN N'衣' WHEN Kind = 2 THEN N'住' WHEN Kind = 3 THEN N'行' END) AS Kind ,Sum(CostMoney) AS TotalMoney FROM Money_Control
GROUP BY Kind ORDER by TotalMoney desc WHERE ([PlayerID] = @PlayerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="PlayerID" SessionField="Account" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <script>
        function Init() {
            var aKind = 1;
            $.get("../Model/M_Control_LookData.aspx",
                {
                    Kind: aKind,
                },
                function (result) {
                    if (result = '99') {
                        alert('參數錯誤');
                        var aUrl = "V_UploadData.aspx?";
                        location.replace(aUrl);
                        window.opener.location.reload();
                        window.close();
                    }
                    else if (result = '1')
                        alert('參數錯誤');
                    else if (result = '0') {
                        alert('目前並無資料');
                        var aUrl = "V_UploadData.aspx?";
                        location.replace(aUrl);
                        window.opener.location.reload();
                        window.close();
                    }
                });
        }
        $(document).ready(function () {
            Init();
        });
    </script>
</body>

    <script type="text/javascript" src="../js/Button.js" ></script>
</html>
