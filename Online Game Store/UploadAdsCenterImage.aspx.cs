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
    public partial class UploadAdsCenterImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
        static string adsCenterFile;
        protected void ButtonUpdateImages_Click(object sender, EventArgs e)
        {
            if ((FileUploadAdsCenterImage.PostedFile != null))
            {
                adsCenterFile = Path.GetExtension(FileUploadAdsCenterImage.PostedFile.FileName);
                //"G:/CSharp_Project/Online Game Store/Online Game Store/Images/"
                FileUploadAdsCenterImage.SaveAs(Server.MapPath("~/Images/OtherImages/") + "AdsCenter"+adsCenterFile);
            }
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String insertQuery = "Update Others Set ads_center_image=@ads_c_i Where other_id=@o_i";
                SqlCommand com = new SqlCommand(insertQuery, con);
                com.Parameters.AddWithValue("@ads_c_i", "Images/OtherImages/" + "AdsCenter" + adsCenterFile);
                com.Parameters.AddWithValue("@o_i", 20);
                com.ExecuteNonQuery();
                LabelErrorAdsCenter.Text = "Update Successful!!!!";
                con.Close();
            }
            catch (Exception ex)
            {
                LabelErrorAdsCenter.Text = ex.ToString();
            }
        }
    }
}