using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Server_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string vPlayerID = Request.QueryString["PlayerID"].ToString();
        HttpPostedFile myData = null;

        myData = Request.Files["Pic"];

        myData.SaveAs(Server.MapPath("~/Pic/" + vPlayerID.ToString() + "/Pic/" + myData.FileName));

        //Response.Clear();
        //Response.ContentType = "image/jpeg";
        //Response.BinaryWrite(myData);
    }
}