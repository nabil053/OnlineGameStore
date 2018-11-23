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
    public partial class UpdateFooterText : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void ButtonFooterText_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String updateQuery = "Update Others Set footer_text = @f_t Where other_id=@other_id";
                SqlCommand com = new SqlCommand(updateQuery, con);
                com.Parameters.AddWithValue("@f_t", TextBoxFooterText.Text);
                com.Parameters.AddWithValue("@other_id", 20);
                com.ExecuteNonQuery();
                LabelFooterTxtError.Text = "Footer Text Successfully Updated!!!";
                con.Close();
            }
            catch (Exception ex)
            {
                LabelFooterTxtError.Text = ex.ToString();
            }
        }
    }
}