using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
namespace Online_Game_Store
{
    public partial class UploadBannerImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
        static string bannerFile;
        protected void ButtonUpdateImages_Click(object sender, EventArgs e)
        {
            if ((FileUploadBannerImage.PostedFile != null))
            {
                bannerFile = Path.GetExtension(FileUploadBannerImage.PostedFile.FileName);
                //"G:/CSharp_Project/Online Game Store/Online Game Store/Images/"
                FileUploadBannerImage.SaveAs(Server.MapPath("~/Images/OtherImages/") + "BannerImage"+bannerFile);
            }
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String insertQuery = "Update Others Set ads_cover_image=@a_c_i Where other_id=@o_i";
                SqlCommand com = new SqlCommand(insertQuery, con);
                com.Parameters.AddWithValue("@a_c_i", "Images/OtherImages/" + "BannerImage" + bannerFile);
                com.Parameters.AddWithValue("@o_i", 20);
                com.ExecuteNonQuery();
                LabelErrorBanner.Text = "Update Successful!!!!";
                con.Close();
            }
            catch (Exception ex)
            {
                LabelErrorBanner.Text = ex.ToString();
            }
        }
    }
}