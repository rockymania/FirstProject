using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    private string mServerUrl = "http://192.168.8.104/";
    private string mCreateUrl = "CreateUser.aspx?Kind={0}&Account={1}&Password={2}&Mail={3}&IPAddress={4}";
    private int mStatusKind;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            mStatusKind = 0;
            Panel2.Visible = false;
            Panel3.Visible = true;
            Panel4.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (!CheckCanCreate())
            return;

        string aAccount = string.Empty;
        string aPassword = string.Empty;
        string aMail = string.Empty;

        aAccount = Account_Text.Text;
        aPassword = PassWord_Text.Text;
        aMail = CreateMail.Text;

       IPAddress XXX = Dns.Resolve(Dns.GetHostName()).AddressList[0];

        String URL = string.Empty;
        if (Session["LoginType"] == "1")
            URL = mServerUrl + string.Format(mCreateUrl, 1,aAccount,aPassword, aMail, XXX.ToString());
        else
            URL = mServerUrl + string.Format(mCreateUrl, 0, aAccount, aPassword, "@@", XXX.ToString());
        String GetMessage = string.Empty;
        using (var wb = new WebClient())
        {
            GetMessage = wb.DownloadString(URL);
        }

            GetString(GetMessage);
    }

    private void GetString(string vKind)
    {
        switch (vKind)
        {
            case "0":
                Response.Write("成功");
                break;
            case "1":
                Response.Write("帳號重複");
                break;
            case "2":
                Response.Write("密碼錯誤");
                break;
            case "3":
                Response.Write("找不到帳號");
                break;
            case "99":
                Response.Write("kind錯誤");
                break;
        }
    }

    private bool CheckCanCreate()
    {
        if (Account_Text.Text == string.Empty)
            return false;
        if (PassWord_Text.Text == string.Empty)
            return false;

        //判斷是否可以創角
        if(Session["LoginType"] == "1")
        {
            //創角階段
            //要判斷 PassWord_Text 是否等於 CheckPassword_Text
            if (PassWord_Text.Text != CheckPassword_Text.Text)
            {
                Response.Write("請確認密碼輸入是否相同");
                return false;
            }
        }

        return true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Account_Text.Text = string.Empty;
        PassWord_Text.Text = string.Empty;
        CheckPassword_Text.Text = string.Empty;

        Response.Write("=====" + Session["LoginType"] + "=====");
    }

    private void ClearData()
    {
        Account_Text.Text = string.Empty;
        PassWord_Text.Text = string.Empty;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = true;
        Title = "創立新角";
        Button3.Text = "放棄創角，登入現有帳號";
        Session["LoginType"] = "1";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = true;
        Panel4.Visible = false;
        Title = "登入帳號";
        Button3.Text = "創立新角";
        Session["LoginType"] = "0";
    }
}