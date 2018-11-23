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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
            if (IsPostBack) {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String check = "select count(*) from customer where customer_email='"+TextBoxEmail.Text+"'";
                SqlCommand com = new SqlCommand(check,con);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp==1) {
                    Response.Write("User Already Exists");
                }
                con.Close();
            }

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {

            try {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String insertQuery = "insert into customer(customer_name,customer_email,customer_pass,customer_country,customer_city,customer_contact,customer_address,customer_gender,customer_s_question,customer_s_answer)values(@name,@email,@pass,@country,@city,@contact,@address,@gender,@s_question,@s_answer)";
                SqlCommand com = new SqlCommand(insertQuery, con);


                com.Parameters.AddWithValue("@name", TextBoxName.Text);
                 com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                com.Parameters.AddWithValue("@pass", TextBoxPass.Text);
                com.Parameters.AddWithValue("@country", DropDownListCountry.SelectedItem.ToString());
                com.Parameters.AddWithValue("@city", TextBoxCity.Text);
                com.Parameters.AddWithValue("@contact",TextBoxMobile.Text);
                com.Parameters.AddWithValue("@address", TextBoxAddress.Text);
                com.Parameters.AddWithValue("@gender", RadioButtonListGender.SelectedItem.ToString());
                com.Parameters.AddWithValue("@s_question", DropDownSQ.SelectedItem.ToString());
                com.Parameters.AddWithValue("@s_answer", TextBoxSCAnswer.Text);
                com.ExecuteNonQuery();
                Response.Redirect("CustomerLogin.aspx");
                Response.Write("Registration Successful");


                con.Close();
            }
            catch (Exception ex) {
                Response.Write(""+ex.ToString());
            }


        }
    }
}