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
    public partial class UpdateNewsFeed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void ButtonUpdateNewsFeed_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String updateQuery = "Update Others Set news_feed = @news_feed Where other_id=@other_id";
                SqlCommand com = new SqlCommand(updateQuery, con);
                com.Parameters.AddWithValue("@news_feed", TextBoxNewsFeed.Text);
                com.Parameters.AddWithValue("@other_id", 20);
                com.ExecuteNonQuery();
                LabelNewFeed2.Text = "NewsFeed Successfully Updated!!!";
                con.Close();
            }
            catch (Exception ex)
            {
                LabelNewFeed2.Text = ex.ToString();
            }
        }
    }
}