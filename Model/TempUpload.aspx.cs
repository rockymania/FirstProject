using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Model_TempUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string vPath = "Image/";

        foreach (string f in Request.Files.AllKeys)
        {
            HttpPostedFile file = Request.Files[f];

            string vTemp = (vPath + file.FileName);
            Response.Write("<Script language='JavaScript'>alert("+ vTemp+");</Script>");

            file.SaveAs(vPath + file.FileName);
        }
    }
}