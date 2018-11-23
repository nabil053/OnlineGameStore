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
    public partial class insertCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();

                String check = "select count(*) from categories where category_title='" + TextBoxCategoryName.Text + "'";
                SqlCommand com2 = new SqlCommand(check, con);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp > 0)
                {
                    LabelcCategoryError.Text = "Category Name Already Exist!!!";
                }
                else
                {
                    String insertQuery = "insert into categories(category_title)values(@title)";
                    SqlCommand com = new SqlCommand(insertQuery, con);
                    com.Parameters.AddWithValue("@title", TextBoxCategoryName.Text);
                    com.ExecuteNonQuery();
                    LabelcCategoryError.Text = "Category Successfully inserted!";
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