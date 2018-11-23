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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void RegButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            string check = "select count(*) from customer where customer_email='" + TextBoxLEmail.Text + "'";
            SqlCommand com = new SqlCommand(check, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            

            if (temp == 1)
            {
                string cpass = "select customer_pass from customer where customer_email='" + TextBoxLEmail.Text + "'";
                SqlCommand com2 = new SqlCommand(cpass, con);
                string passConfirm = com2.ExecuteScalar().ToString();

                if (passConfirm==TextBoxLPass.Text)
                {
                    Session["c_email"] = TextBoxLEmail.Text;
                    Response.Redirect("Default.aspx");
                    LabelCustomerError.Text = "Login Successful";
                }
                else
                {
                    LabelCustomerError.Text = "*Password Incorrect";
                }
            }
            else {
                LabelCustomerError.Text = "*USer Name Incorrect";

            }
            con.Close();
        }
    }
}