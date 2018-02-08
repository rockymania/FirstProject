using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Model_M_Control_LookData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int aKind = 0;
        string aPlayerID;
        try
        {
            aKind = int.Parse(Request.QueryString["Kind"].ToString());
            aPlayerID = (string)Session["Account"];

            if (aPlayerID == null)
                aPlayerID = "7788@7788.com";
            if (aKind == 1)
            {
                using(SqlConnection aCon = new SqlConnection("Data Source=184.168.47.10;Integrated Security=False;User ID=MobileDaddy;PASSWORD=Aa54380438!;Connect Timeout=15;Encrypt=False;Packet Size=4096"))
                {
                    aCon.Open();

                    string aSqlStr = "Select * From Money_Control Where PlayerID ='" + aPlayerID +"'";

                    using (SqlCommand aComm = new SqlCommand(aSqlStr, aCon))
                    {
                        SqlDataReader aReader = aComm.ExecuteReader();
                        if (aReader.FieldCount > 0)
                            Response.Write("0");
                        aReader.Close();
                    }
                }
            }
            else
            {
                Response.Write("1");
            }
        }
        catch
        {
            Response.Write("99");
        }
    }
}