using System;
using System.Data.SqlClient;

public partial class ControlMoney_Model_M_MoneyControl : System.Web.UI.Page
{
    //private string mUploadData = "UploadData.aspx?Kind={0}&PlayerID={1}&List={2}&Time={3}";

    protected void Page_Load(object sender, EventArgs e)
    {
        int aKind;
        string aPlayerID;
        int aList;
        string aTime;
        int aMoney;

        try
        {
            aKind = int.Parse(Request.QueryString["Kind"]);
            aPlayerID = Request.QueryString["PlayerID"];
            aList = int.Parse(Request.QueryString["List"]);
            aTime =  Request.QueryString["Time"];
            aMoney = int.Parse(Request.QueryString["Money"]);

            if (aKind == 1)
                Response.Write(InsertData(aList, aPlayerID, aTime, aMoney));
            else if(aKind == 2)
                Response.Write(UpdateDate(aList, aPlayerID, aTime, aMoney));
            else
            {

            }
        }
        catch
        {
            Response.Write("99");
        }
    }

    private int InsertData(int iKind,string iPlayerID,string iTime,int iMoney)
    {
        //寫入SQL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        try
        {
            using (SqlConnection aCon = new SqlConnection("Data Source=184.168.47.10;Integrated Security=False;User ID=MobileDaddy;PASSWORD=Aa54380438!;Connect Timeout=15;Encrypt=False;Packet Size=4096"))
            {
                aCon.Open();

                string aStr = string.Format("insert into Money_Control (PlayerID, Kind, DataTime, CostMoney) " +
                    "                        Values('{0}','{1}','{2}','{3}')",
                                             iPlayerID, iKind, iTime, iMoney);

                using (SqlCommand aComm = new SqlCommand(aStr, aCon))
                {
                    aComm.ExecuteNonQuery();
                }

                    return 0;
            }
        }

        catch
        {
            return 1;
        }
    }

    private int UpdateDate(int iKind, string iPlayerID, string iTime, int iMoney)
    {
        try
        {
            return 0;
        }
        catch
        {
            return 1;
        }
    }

}

//string aSqlStr = string.Format("Select * FROM Uncle");
//        using (SqlConnection aCon = new SqlConnection("Data Source=184.168.47.10;Integrated Security=False;User ID=MobileDaddy;PASSWORD=Aa54380438!;Connect Timeout=15;Encrypt=False;Packet Size=4096"))
//        {
//            aCon.Open();

//            using (SqlCommand cmd = new SqlCommand(aSqlStr, aCon))
//            {
//                SqlDataReader dr = cmd.ExecuteReader();
//                while (dr.Read())
//                {
//                    Label1.Text += string.Format("PlayerID{0} : Age{1} </br>", dr["PlayerID"], dr["Age"]);
//                }
//                dr.Close();

//            }
//        }