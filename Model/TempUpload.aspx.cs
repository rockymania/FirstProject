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
        string savePath = Server.MapPath("~/WebClinet/Model/Image/");
        string appPath = Request.PhysicalApplicationPath;
        foreach (string f in Request.Files.AllKeys)
        {
            HttpPostedFile file = Request.Files[f];

            //file.SaveAs(appPath + savePath + file.FileName);
            //file.SaveAs(savePath + file.FileName);
            //Response.Write(file.FileName);
            Response.Write(savePath + file.FileName);
        }
        

    }
}