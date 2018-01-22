using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_lostpw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int aKind = 0;

        if(!Page.IsPostBack)
        {
            try
            {
                aKind = int.Parse(Request.QueryString["lost"]);

                if(aKind == 1)
                {
                    Random aRandom = new Random();
                    string aRand = aRandom.Next(1, 1000).ToString("0000");
                    Session["CheckString"] = aRand;
                    Label1.Text = string.Format("請輸入隨機驗證碼[{0}]", aRand);
                }

            }
            catch
            {
                Response.Write("99");
            }
        }
    }
    protected void SendLost_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text != (String)Session["CheckString"])
        {
            Response.Write("<Script language='JavaScript'>alert('驗證碼錯誤，請重新輸入');</Script>");
            return;
        }
        else
        {
            Response.Write("<Script language='JavaScript'>alert('驗證碼正確');</Script>");

            Session["CheckString"] = string.Empty;
        }
    }
}