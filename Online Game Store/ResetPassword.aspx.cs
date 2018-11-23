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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["r_pass_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            if (Session["c_email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();

            String upQuery = "Update customer set customer_pass=@password Where customer_email='" + Session["r_pass_email"] + "'";
            SqlCommand com = new SqlCommand(upQuery, con);
            com.Parameters.AddWithValue("@password", TextBoxRPass.Text);
            com.ExecuteNonQuery();
            Session["c_email"] = null;
            Response.Redirect("CustomerLogin.aspx");
            con.Close();
        }
    }
}