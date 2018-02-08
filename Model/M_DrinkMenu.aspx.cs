using System;
using System.Net;
using System.Text;

public partial class Model_M_DrinkMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mResult = string.Empty;

        try
        {
            using (WebClient vWc = new WebClient())
            {
                string vURL = "http://www.mobiledaddy.net/WebService/GetDrinkProduct.aspx";
                vWc.Headers["Content-Type"] = "application/x-www-form-urlencoded";
                vWc.Encoding = Encoding.UTF8;
                mResult = vWc.DownloadString(vURL);

                Response.Write(mResult);
            }

        }
        catch
        {
            Response.Write("伺服器錯誤");
        }
    }
}