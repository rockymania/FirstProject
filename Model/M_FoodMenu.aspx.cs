using System;
using System.Net;
using Newtonsoft.Json;
using System.Text;
using Newtonsoft.Json.Linq;

public partial class Model_M_FoodMenu : System.Web.UI.Page
{
    public class rFoodProductData
    {
        public string Name;
        public string PicName;
        public string Introduction;
        public int Price;

        public rFoodProductData()
        {
            Name = string.Empty;
            PicName = string.Empty;
            Introduction = string.Empty;
            Price = 0;
        }
    }

    public class rFoodProductAllData
    {
        rFoodProductData[] AllData;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        string mResult = string.Empty;

        try
        {
            using (WebClient vWC = new WebClient())
            {
                string zUrl = "http://www.mobiledaddy.net/WebService/GetFoodProduct.aspx";
                //解決收中文字變亂馬的方法
                vWC.Headers["Content-Type"] = "application/x-www-form-urlencoded";
                vWC.Encoding = Encoding.UTF8;

                mResult = vWC.DownloadString(zUrl);

                //JArray zArray = JsonConvert.DeserializeObject<JArray>(mResult);

                //rFoodProductData[] zData = new rFoodProductData[zArray.Count] ;

                //int vIndex = 0;

                //foreach (JObject Jobj in zArray)
                //{
                //    zData[vIndex] = new rFoodProductData();
                //    zData[vIndex].Name = Jobj["Name"].ToString();
                //    zData[vIndex].PicName = Jobj["PicName"].ToString();
                //    zData[vIndex].Introduction = Jobj["Introduction"].ToString();
                //    zData[vIndex].Price = int.Parse(Jobj["Price"].ToString());
                //    vIndex++;
                //}

                Response.Write(mResult);
            }
        }
        catch
        {
            Response.Write("伺服器錯誤");
        }
    }
}