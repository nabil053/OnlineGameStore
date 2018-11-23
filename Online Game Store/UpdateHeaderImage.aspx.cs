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
    public partial class UpdateOtherImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
        static string hF;

        protected void ButtonUpdateImages_Click(object sender, EventArgs e)
        {
            if ((FileUploadHeaderImage.PostedFile != null))
            {
                hF = Path.GetExtension(FileUploadHeaderImage.PostedFile.FileName);
                //"G:/CSharp_Project/Online Game Store/Online Game Store/Images/"
                FileUploadHeaderImage.SaveAs(Server.MapPath("~/Images/OtherImages/") + "headerImage"+hF);
            }
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String uQuery = "Update Others Set header_image=@h_i Where other_id=@o_i";
                SqlCommand com = new SqlCommand(uQuery, con);
                com.Parameters.AddWithValue("@h_i", "Images/OtherImages/" + "headerImage" + hF);
                com.Parameters.AddWithValue("@o_i", 20);
                com.ExecuteNonQuery();
                LabelErrorHeader.Text = "Update Successful!!!!";
                con.Close();
            }
            catch (Exception ex)
            {
                LabelErrorHeader.Text = ex.ToString();
            }
        }
    }
}