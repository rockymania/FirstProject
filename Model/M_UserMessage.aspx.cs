using System;
using System.Net;

public partial class Model_M_UserMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string vResult = string.Empty;

        try
        {
            string vName = Request.QueryString["Name"].ToString();
            string vEmail = Request.QueryString["Email"].ToString();
            string vPhone = Request.QueryString["Phone"].ToString();
            string vContent = Request.QueryString["MessageContent"].ToString();

            using (WebClient vWC = new WebClient())
            {
                string vStr = string.Format("http://www.mobiledaddy.net/WebService/AddCustomerMessage.aspx?Name={0}&Email={1}&Phone={2}&MessageContent={3}"
                    , vName, vEmail, vPhone, vContent);

                vResult = vWC.DownloadString(vStr);
            }
        }
        catch
        {
            vResult = "99";
        }

        Response.Write(vResult);
    }
}