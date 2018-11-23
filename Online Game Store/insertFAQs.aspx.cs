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
    public partial class insertFAQs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void ButtonInsertFaq_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String check = "select count(*) from faq where Question_1='" + TextBoxfaqQuestion.Text + "' OR Answer_1='"+TextBoxfaqAnswer.Text+"'";
                SqlCommand com2 = new SqlCommand(check, con);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp > 0)
                {
                    LabelcFaQError.Text = "Already Exist!!!";
                }
                else
                {
                    String insertQuery = "insert into Faq(Question_1,Answer_1)values(@q,@a)";
                    SqlCommand com = new SqlCommand(insertQuery, con);
                    com.Parameters.AddWithValue("@q", TextBoxfaqQuestion.Text);
                    com.Parameters.AddWithValue("@a", TextBoxfaqAnswer.Text);
                    com.ExecuteNonQuery();
                    LabelcFaQError.Text = "Faq Successfully inserted!";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("" + ex.ToString());
            }
        }
    }
}