﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_V_UploadData : System.Web.UI.Page
{
    private string mUploadUrl = "M_MoneyControl.aspx?Kind={0}&PlayerID={1}&List={2}&Time={3}&Pic={4}";

    private string mServerUrl = "http://MobileDaddy.net/WebClinet/ControlMoney/Model/";
    //private string mUploadData = "M_MoneyControl.aspx?Kind={0}&PlayerID={1}&List={2}&Time={3}&Money={4}";
    private string mUploadData = "Model/M_UploadData.aspx?Kind={0}&PlayerID={1}&List={2}&Time={3}&Money={4}";


    private string TestURL = @"D:\Pic\";
    private string TempDir = @"D:\FileUploadDemo\";

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Confirm1_Click(object sender, EventArgs e)
    {
        //沒有上傳照片的部分

        //mUploadData
        string aSelect = DropDownList1.SelectedValue;
        string aMoney = TextBox1.Text;
        string aTime = datepicker.Text;

        if (aMoney == "")
        {
            Response.Write("<Script language='JavaScript'>alert('請重新輸入金額');</Script>");
            return;
        }

        if (aTime == "")
        {
            Response.Write("<Script language='JavaScript'>alert('請選擇日期');</Script>");
            return;
        }

        for (int i = 0; i < TextBox1.Text.Length; i++)
        {
            if (char.IsNumber(TextBox1.Text[i]))
            {
            }
            else
            {
                Response.Write("<Script language='JavaScript'>alert('請重新輸入金額');</Script>");
                return;
            }
        }

        string aGetMessage = "98";

        using (var wb = new WebClient())
        {
            string aAcc = (string)Session["Account"];

            //string aUrl = mServerUrl + string.Format(mUploadData, 1, aAcc, aSelect, aTime, aMoney);
            string aUrl = Server.MapPath("~") + string.Format(mUploadData, 1, aAcc, aSelect, aTime, aMoney);

            aGetMessage = wb.DownloadString(aUrl);
        }

        int aSwith = Convert.ToInt32(aGetMessage);
        switch (aSwith)
        {
            case 0:
                Response.Write("<Script language='JavaScript'>alert('成功');</Script>");
                break;
            case 1:
                Response.Write("<Script language='JavaScript'>alert('失敗');</Script>");
                break;
            case 99:
                Response.Write("<Script language='JavaScript'>alert('參數錯誤');</Script>");
                break;
            case 98:
                Response.Write("<Script language='JavaScript'>alert('例外錯誤');</Script>");
                break;
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "0")
        {
            Panel1.Visible = true;
        }
        else if (RadioButtonList1.SelectedValue == "1")
        {
            Panel1.Visible = false;
        }
    }

    protected void ConfirmUpload_Click(object sender, EventArgs e)
    {
        //上傳照片
        int mGetResult = CheckUploadPic();

        if (mGetResult != 0)
        {
            switch (mGetResult)
            {
                case 1:
                    Response.Write("上傳規格不符合");
                    break;
                case 2:
                    Response.Write("請先選擇照片");
                    break;
            }
        }
        //先建立要放圖片的資料夾
        string aTempSavePic = Server.MapPath(".") + "\\tempPic";

        if (Directory.Exists(aTempSavePic) == false)
        {
            Directory.CreateDirectory(aTempSavePic);
        }

        //string mUrl = "http://192.168.8.104/Test.aspx";
        string mUrl = "http://MobileDaddy.net/WebClinet/Model/TempUpload.aspx";// "http://MobileDaddy.net/WebService/Test.aspx";//http://MobileDaddy.net/WebClinet/TempData/Money_Upload.aspx

        WebClient mMyWebClient = new WebClient();

        mMyWebClient.Headers.Add("Content-Type", "application/x-www-form-urlencoded");

        string savePath = aTempSavePic + "//" + UploadPic.PostedFile.FileName;

        UploadPic.PostedFile.SaveAs(savePath);

        //File.Delete(savePath);

        string fileName = savePath;

        //UploadPic.PostedFile.SaveAs("http://MobileDaddy.net/WebClinet/Model/Image/");

        byte[] responseArray = mMyWebClient.UploadFile(mUrl, "POST", fileName);

        string EndString = System.Text.Encoding.ASCII.GetString(responseArray);

        Response.Write(EndString);

        return;



        //HttpPostedFile myFile = UploadPic.PostedFile;

        //int nFileLen = myFile.ContentLength;

        //byte[] myData = new byte[nFileLen];
        //myFile.InputStream.Read(myData, 0, nFileLen);
        //string savePath = TempDir + myFile.FileName;

        //UploadPic.PostedFile.SaveAs(savePath);

        //String URL = string.Empty;
        //URL = mServerUrl + string.Format(mCreateUrl, "123", myFile.FileName);
        ////UploadFileBinary(savePath, URL);


        //String GetMessage = string.Empty;

        //using (var wb2 = new WebClient())
        //{
        //    byte[]  vGet =  wb2.UploadValues(savePath, myData);
        //    Response.Write(vGet[0]);
        //    //GetMessage = wb2.DownloadString(URL);
        //    //Response.Write(GetMessage);
        //}
    }

    //判斷照片格式
    private int CheckUploadPic()
    {
        bool mIsFileOK = false;

        String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

        String fileExtension = System.IO.Path.GetExtension(UploadPic.FileName).ToLower();

        if (UploadPic.HasFile)
            mIsFileOK = true;

        if (!mIsFileOK)
            return 2;

        for (int i = 0; i < allowedExtensions.Length; i++)
        {
            if (fileExtension == allowedExtensions[i])
            {
                mIsFileOK = true;
            }
        }

        if (!mIsFileOK)
            return 1;

        return 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string vPath = "http://192.168.8.104/Pic/123.jpg";
        //private string mServerUrl = "http://192.168.8.104/";
        string mServerUrl = "http://MobileDaddy.net/WebService/Pic/123.jpg";
        WebClient mMyWebClinet = new WebClient();
        string savePath = TempDir + "321.jpg";
        mMyWebClinet.DownloadFile(vPath, savePath);
    }



    //網路COPY部分 上傳照片
    private void UploadFileBinary(string LocalFile, string UploadUrl)
    {
        try
        {
            FileStream aStream = new FileStream(LocalFile, FileMode.Open);

            byte[] aInData = new byte[4096];

            int TotalByte = 0;

            MemoryStream aMemory = new MemoryStream();

            int aByteRead = aStream.Read(aInData, 0, aInData.Length);

            while (aByteRead > 0)
            {
                aMemory.Write(aInData, 0, aByteRead);
                aByteRead = aStream.Read(aInData, 0, aInData.Length);
                TotalByte += aByteRead;
            }
            aStream.Close();
            aMemory.Position = 0;

            //準備下一階段
            HttpWebRequest aRequest = (HttpWebRequest)WebRequest.Create(UploadUrl);
            aRequest.Method = "POST";
            aRequest.ContentLength = (long)aMemory.Length;

            using (Stream s = aRequest.GetRequestStream())
            {
                s.Write(aMemory.ToArray(), 0, (int)aMemory.Length);
                aMemory.Close();
            }

            WebResponse aWebRes = aRequest.GetResponse();

            String GetMessage = string.Empty;

            using (var wb2 = new WebClient())
            {
                GetMessage = wb2.DownloadString(aWebRes.ResponseUri);
                Response.Write(GetMessage);
            }

            aWebRes.Close();

        }
        catch (Exception ex)
        {
            string aExContent;
            aExContent = ex.ToString();
            Response.Write(aExContent);
        }
    }
}