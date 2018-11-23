using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Game_Store
{
    public partial class Login1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["c_email"] != null)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                    con.Open();

                    String check3 = "select customer_id from customer where customer_email='" + Session["c_email"] + "'";
                    SqlCommand com3 = new SqlCommand(check3, con);
                    int cid = Convert.ToInt32(com3.ExecuteScalar().ToString());


                    String check = "select count(Id) from cart where user_id='" + cid + "'";
                    SqlCommand com = new SqlCommand(check, con);
                    int totalPNo = Convert.ToInt32(com.ExecuteScalar().ToString());
                    LabelTotalProductCount.Text = "Total Products:" + totalPNo.ToString() +" |";

                    String check2 = "select sum(total_price) from cart where user_id='" + cid + "'";
                    SqlCommand com2 = new SqlCommand(check2, con);
                    String totalPrNo = com2.ExecuteScalar().ToString();
                    LabelTotalPriceCount.Text = "Total Price:" + totalPrNo.ToString();

                    con.Close();
                }
            }
        }
    }
}