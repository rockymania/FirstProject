using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_V_LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Reset_Btn_Click(object sender, EventArgs e)
    {
        //重置所有資料
        Input_Acc.Text = "";
        Input_Pass.Text = "";
    }
}