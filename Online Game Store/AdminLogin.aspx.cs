using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Online_Game_Store
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Response.Redirect("AdminHomePage.aspx");
            }
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            string check = "select count(*) from admins where admin_email='" + AdminEmail.Text + "'";
            SqlCommand com = new SqlCommand(check, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());


            if (temp == 1)
            {
                string cpass = "select admin_password from admins where admin_email='" + AdminEmail.Text + "'";
                SqlCommand com2 = new SqlCommand(cpass, con);
                string passConfirm = com2.ExecuteScalar().ToString();

                if (passConfirm == AdminPass.Text)
                {
                    Session["New"] = AdminEmail.Text;
                    Response.Redirect("AdminHomePage.aspx");
                    LabelAdminError.Text = "Login Successful";

                }
                else
                {
                    LabelAdminError.Text = "*Password Incorrect";
                    
                }
            }
            else
            {
                LabelAdminError.Text = "*USer Name Incorrect";

            }
            con.Close();
        }
    }
}