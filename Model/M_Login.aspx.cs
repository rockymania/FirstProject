using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Model_M_Login : System.Web.UI.Page
{
    private string mServerUrl = "http://192.168.8.104/";
    private string mLoginUrl = "LoginUser.aspx?Acc={0}&Pass={1}";



    protected void Page_Load(object sender, EventArgs e)
    {
        string aAccount;
        string aPassword;

        try
        {
            aAccount = Request.QueryString["Acc"];
            aPassword = Request.QueryString["Pass"];

            string Send_Acc = EncodeString(aAccount);
            string SendPass = EncodeString(aPassword);

            string aGetMessage;

            string aUrl = string.Format(mServerUrl + mLoginUrl, Send_Acc, SendPass);

            using (var wb = new WebClient())
            {
                aGetMessage = wb.DownloadString(aUrl);
                Response.Write(aGetMessage);
            }
        }
        catch
        {
            Response.Write("99");
        }
    }

    public string EncodeString(string toEncode)
    {
        try
        {
            byte[] toEncodeAsBytes = Encoding.UTF8.GetBytes(toEncode);
            return Convert.ToBase64String(toEncodeAsBytes);
        }
        catch (Exception ex)
        {
            //thorow new Exception();
            return "";
        }
    }

    //https://market.cloud.edu.tw/content/senior/computer/ks_ks/et/webpg1203/index3.htm
}