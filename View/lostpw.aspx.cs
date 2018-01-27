using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class View_lostpw : System.Web.UI.Page
{
    //private string mServerUrl = "http://192.168.8.104/GetPW.aspx?Mail={0}";
    private string mServerUrl = "http://MobileDaddy.net/WebService/GetPW.aspx?Mail={0}";

    protected void Page_Load(object sender, EventArgs e)
    {       
        int aKind = 0;

        if(!Page.IsPostBack)
        {
            try
            {
                aKind = int.Parse(Request.QueryString["lost"]);

                if(aKind == 1)
                {
                    Random aRandom = new Random();
                    string aRand = aRandom.Next(1, 1000).ToString("0000");
                    Session["CheckString"] = aRand;
                    Label1.Text = string.Format("請輸入隨機驗證碼[{0}]", aRand);
                    GetPW.Visible = false;
                }

            }
            catch
            {
                Response.Write("99");
            }
        }
    }
    protected void SendLost_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text != (String)Session["CheckString"])
        {
            Response.Write("<Script language='JavaScript'>alert('驗證碼錯誤，請重新輸入');</Script>");
            return;
        }
        else
        {
            string aGetMessage = string.Empty;
            using (var wb = new WebClient())
            {
                string aSendMsg = string.Format(mServerUrl, TextBox1.Text);

                aGetMessage = wb.DownloadString(aSendMsg);
            }

            switch(aGetMessage)
            {
                case "0":
                    break;
                case "1":
                    Response.Write("<Script language='JavaScript'>alert('無此帳號');</Script>");
                    break;
                case "2":
                    Response.Write("<Script language='JavaScript'>alert('錯誤2');</Script>");
                    break;
                case "3":
                    Response.Write("<Script language='JavaScript'>alert('錯誤3');</Script>");
                    break;
                case "99":
                    Response.Write("<Script language='JavaScript'>alert('其他錯誤');</Script>");
                    break;
                default://成功
                    Session["CheckString"] = string.Empty;
                    GetPW.Visible = true;
                    GetPW.Text = string.Format("您的帳號為{0}，你的密碼為{1}", TextBox1.Text, aGetMessage);
                    break;
            }
               
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginMain.aspx");
    }
}