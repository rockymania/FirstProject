using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

public partial class Model_M_DrinkProductaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string vUploadIP = "ftp://50.62.160.239/WebClinet/Image/";
        string vUploadIP = "ftp://50.62.160.239/httpdocs/WebClinet/Image/";
        string vUserName = "Ricky";
        string vPassword = "abc101238";
        string vPicName = string.Empty;

        if (Request.Files.AllKeys.Any())
        {
            var httpPostedFile = Request.Files["UploadPic"];
            var vName = Request["Name"].ToString();
            var vIntroduction = Request["Introduction"].ToString();
            var vPrice = Request["Price"].ToString();

            if (httpPostedFile != null && httpPostedFile.ContentLength != 0)
            {
                StreamReader vSr = new StreamReader(httpPostedFile.InputStream);
                var vData = default(byte[]);
                using (var memstream = new MemoryStream())
                {
                    vSr.BaseStream.CopyTo(memstream);
                    vData = memstream.ToArray();
                }

                vSr.Dispose();

                using (WebClient vWc = new WebClient())
                {
                    try
                    {
                        vWc.Credentials = new NetworkCredential(vUserName, vPassword);
                        
                        //上傳圖片
                        vWc.UploadData(vUploadIP + httpPostedFile.FileName, vData);

                        //取得檔案名稱
                        vPicName = Path.GetFileNameWithoutExtension(httpPostedFile.FileName);
                        try
                        {
                            //上傳資訊
                            using (WebClient vWC = new WebClient())
                            {

                                string vURL = string.Format("http://www.mobiledaddy.net/WebService/AddDrinkProduct.aspx?Name={0}&Introduction={1}&Price={2}&PicName={3}", vName, vIntroduction, vPrice, vPicName);

                                string vResult = vWc.DownloadString(vURL);

                                Response.Write(vResult);

                            }

                        }
                        catch
                        {
                            //上傳資料失敗
                            Response.Write("2");
                        }
                    }
                    catch
                    {
                        //上傳圖片失敗
                        Response.Write("99");
                    }
                }

            }
            else
                //沒有檔案
                Response.Write("1");
        }
    }
}
