using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Model_M_TryTry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mString = string.Empty;
        try
        {
            //mString = Request.QueryString["Test"];
        }
        catch
        {
            Response.Write("99");
        }

        Response.Write(mString);
    }
}