using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string aSqlStr = string.Format("Select * FROM Uncle");
        using (SqlConnection aCon = new SqlConnection("Data Source=184.168.47.10;Integrated Security=False;User ID=MobileRocky;PASSWORD=Aa54380438!;Connect Timeout=15;Encrypt=False;Packet Size=4096"))
        {
            aCon.Open();

            using (SqlCommand cmd = new SqlCommand(aSqlStr, aCon))
            {
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Label1.Text += string.Format("PlayerID{0} : Age{1} </br>", dr["PlayerID"], dr["Age"]);
                }
                dr.Close();

            }
        }
    }
}