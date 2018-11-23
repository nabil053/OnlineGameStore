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
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            
        }

        protected void Button1CustomerLogout_Click(object sender, EventArgs e)
        {
            Session["c_email"] = null;
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("UpdateCustomerProfile.aspx");
        }


        protected void viewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfileOrders.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPromo.aspx");
        }

        protected void GoToCart_Click(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();

                string check = "select customer_id from customer where customer_email='" + Session["c_email"] + "'";
                SqlCommand com = new SqlCommand(check, con);
                int user_id = Convert.ToInt32(com.ExecuteScalar().ToString());
                Response.Redirect("Cart.aspx?u_id=" + user_id);
            }
            else
            {
                Response.Redirect("CustomerLogin.aspx");
            }

        }
    }
}