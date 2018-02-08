using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_V_TryTry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string aGetMessage = "98";
        using (var wb = new WebClient())
        {
            string aUrl = Server.MapPath("~") + "Model/M_TryTry.aspx";
            aGetMessage = wb.DownloadString(aUrl);
        }

        Response.Write(aGetMessage);
    }
}