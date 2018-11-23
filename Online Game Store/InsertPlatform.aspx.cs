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
    public partial class InsertPlatform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            
        }

        protected void ButtonPlatform_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String check = "select count(*) from platforms where platform_title='" + TextBoxPlatformName.Text + "'";
                SqlCommand com2 = new SqlCommand(check, con);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp > 0)
                {
                    LabelcPlatformError.Text = "Platform Name Already Exist!!!";
                }
                else
                {
                    String insertQuery = "insert into platforms(platform_title)values(@title)";
                    SqlCommand com = new SqlCommand(insertQuery, con);
                    com.Parameters.AddWithValue("@title", TextBoxPlatformName.Text);
                    com.ExecuteNonQuery();
                    LabelcPlatformError.Text = "Platform Successfully inserted!";
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