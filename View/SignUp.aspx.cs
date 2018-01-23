using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_SignUp : System.Web.UI.Page
{
    private string mServerUrl = "http://192.168.8.104/";
    private string mURL = "CreateAccount.aspx?Password={0}&Email={1}";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        PasswordText.Text = "";
        AgianPasswordText.Text = "";
        MailText.Text = "";
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if (CheckPassword() == false)
            return;

        if (CheckMail() == false)
            return;

        string zURL = mServerUrl + string.Format(mURL, PasswordText.Text, MailText.Text);

        string vResult = string.Empty;

        using (WebClient vWb = new WebClient())
        {
            vResult = vWb.DownloadString(zURL);
        }

        Response.Write(GetResultString(vResult));
    }

    private bool CheckPassword()
    {
        if (PasswordText.Text != AgianPasswordText.Text)
        {
            Response.Write("密碼不符");
            return false;
        }

        if (PasswordText.Text == "")
        {
            Response.Write("密碼為空");
            return false;
        }

        if (AgianPasswordText.Text == "")
        {
            Response.Write("再次輸入密碼為空");
            return false;
        }

        return true;
    }

    private bool CheckMail()
    {
        if (MailText.Text == "")
            return false;

        int vIndex = -1;

        vIndex = MailText.Text.IndexOf('@');

        if (vIndex == -1)
            return false;

        return true;
    }

    private string GetResultString(string vResult)
    {
        string zResultString = string.Empty;

        switch (vResult)
        {
            case "0":
                zResultString = "成功";
                break;
            case "1":
                zResultString = "信箱重複";
                break;
            default:
                zResultString = "伺服器錯誤";
                break;
        }

        return zResultString;
    }
}