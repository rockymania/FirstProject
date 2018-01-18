using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Model_UploadData : System.Web.UI.Page
{
    private string mServerUrl = "http://192.168.8.104/";
    private string mCreateUrl = "UploadData.aspx?PlayerID={0}&Pic={1}";
    private string mFile = @"D:\@WebServic\test\";
    private string UploadUrl = "ftp://192.168.8.117/";
    private string TestURL = @"D:\Pic\";
    private string TempDir = @"D:\FileUploadDemo\";

    protected void Page_Load(object sender, EventArgs e)
    {

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
        String vUrl = "http://192.168.8.104/Test.aspx";

        WebClient mMyWebClient = new WebClient();

        string savePath = TempDir + UploadPic.PostedFile.FileName;

        UploadPic.PostedFile.SaveAs(savePath);

        string fileName = savePath;

        byte[] responseArray = mMyWebClient.UploadFile(vUrl, fileName);

        string EndString = System.Text.Encoding.ASCII.GetString(responseArray);

        Response.Write(EndString);

        return;

        //int mGetResult = CheckUploadPic();

        //if (mGetResult != 0)
        //{
        //    switch(mGetResult)
        //    {
        //        case 1:
        //            Response.Write("上傳規格不符合");
        //            break;
        //        case 2:
        //            Response.Write("請先選擇照片");
        //            break;
        //    }
        //}

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
        catch(Exception ex)
        {
            string aExContent;
            aExContent = ex.ToString();
            Response.Write(aExContent);
        }
    }


    private bool CheckFtpDir(string iUser, string iPass, string iPath)
    {
        Uri aUri = new Uri(iPath);
        try
        {
            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(aUri);
            request.Method = WebRequestMethods.Ftp.PrintWorkingDirectory;
            request.Timeout = 60000;
            request.Credentials = new NetworkCredential(iUser, iPass);

            FtpWebResponse response = (FtpWebResponse)request.GetResponse();
            response.Close();

            System.Threading.Thread.Sleep(1000);

            return true;
        }
        catch(WebException e)
        {
            return false;
        }
    }

    private void CreateFtpDir(string iUser, String iPass, string iPath)
    {
        if(iPath.EndsWith("/"))
        {
            iPath = iPath.Remove(iPath.Length-1);
        }

        string aData = iPath.Replace(UploadUrl, "");
        string[] aStrAry = aData.Split('/');

        for(int i = 0; i < aStrAry.Length; i++)
        {
            string zPath = UploadUrl;

            for (int j=0; j<aStrAry.Length;j++)
            {
                zPath = zPath + iPath + aStrAry[j] + "/";
            }

            //if (CheckFtpDir(iUser, iPass, iPath) == true)
            //    continue;

            if (zPath.EndsWith("/"))
            {
                zPath = zPath.Remove(zPath.Length - 1);
            }

            Uri iUri = new Uri(zPath);

            try
            {
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(iUri);
                request.Method = WebRequestMethods.Ftp.MakeDirectory;
                request.Timeout = 60000;
                request.Credentials = new NetworkCredential(iUser, iPass);

                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                response.Close();

                System.Threading.Thread.Sleep(1000);
            }
            catch
            {

            }


        }


    }

    private int CheckUploadPic()
    {
        bool mIsFileOK = false;

        String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

        String fileExtension = System.IO.Path.GetExtension(UploadPic.FileName).ToLower();

        if (!UploadPic.HasFile)
            mIsFileOK = false;

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
        WebClient mMyWebClinet = new WebClient();
        string savePath = TempDir + "321.jpg";
        mMyWebClinet.DownloadFile(vPath, savePath);
    }
}

/*
 * 透過FTP丟資料
 * string userName = "9453";
        string password = "9453";

        if (CheckFtpDir(userName, password, UploadUrl+ TestURL) == false)
            CreateFtpDir(userName, password, UploadUrl+ TestURL);

        WebClient wb = new WebClient();
        wb.Credentials = new NetworkCredential(userName, password);

        
        byte[] responseData = wb.UploadData(UploadUrl+ TestURL + myFile.FileName , myData);//+ myFile.FileName

        string srcString = System.Text.Encoding.UTF8.GetString(responseData);
 * */
