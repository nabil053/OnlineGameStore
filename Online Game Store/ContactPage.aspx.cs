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
    public partial class ContactPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                TextBoxCEmail.Text = Session["c_email"].ToString();
            }

        }

        

        protected void ButtonCSend_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String insertQuery = "insert into help_messages(customer_name,customer_email,subject,message)values(@name,@email,@subject,@message)";
                SqlCommand com = new SqlCommand(insertQuery, con);


                com.Parameters.AddWithValue("@name", TextBoxCName.Text);
                com.Parameters.AddWithValue("@email", TextBoxCEmail.Text);
                com.Parameters.AddWithValue("@subject", TextBoxCSubject.Text);
                com.Parameters.AddWithValue("@message", TextBoxCMessage.Text);
                com.ExecuteNonQuery();
                LabelContactError.Text = "Message Successfully Sent.";
                con.Close();
            }
            catch (Exception ex)
            {
                
                LabelContactError.Text = "Message Can't be sent at the moment.\n"
                    + ex.ToString();
            }
        }
    }
}