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
    public partial class InsertProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            
        }
        static string coverFile, sFile1, sFile2, sFile3;
        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            if ((FileUploadGameCoverImage.PostedFile!=null) &&
                (FileUploadGameSS1.PostedFile!=null) &&
                (FileUploadGameSS2.PostedFile!=null) &&
                (FileUploadGameSS3.PostedFile!=null)) {

                coverFile = Path.GetExtension(FileUploadGameCoverImage.PostedFile.FileName);
                sFile1 = Path.GetExtension(FileUploadGameSS1.PostedFile.FileName);
                sFile2 = Path.GetExtension(FileUploadGameSS2.PostedFile.FileName);
                sFile3 = Path.GetExtension(FileUploadGameSS3.PostedFile.FileName);
                //"G:/CSharp_Project/Online Game Store/Online Game Store/Images/"
                FileUploadGameCoverImage.SaveAs(Server.MapPath("~/Products/Cover/") + TextBoxGameTitle.Text+ coverFile);
                FileUploadGameSS1.SaveAs(Server.MapPath("~/Products/ScreenShots/") + TextBoxGameTitle.Text + "S1"+ sFile1);
                FileUploadGameSS2.SaveAs(Server.MapPath("~/Products/ScreenShots/") + TextBoxGameTitle.Text + "S2" + sFile2);
                FileUploadGameSS3.SaveAs(Server.MapPath("~/Products/ScreenShots/") + TextBoxGameTitle.Text + "S3" + sFile3);
            }
            try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                    con.Open();
                String check = "select count(*) from products where product_title='" + TextBoxGameTitle.Text + "'";
                SqlCommand com2 = new SqlCommand(check, con);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp > 0)
                {
                    LabelProductInsertError.Text = "Product Name Already Exist!!!";
                }
                else
                {
                    String insertQuery = "insert into products(product_category,product_developers,product_title,product_price,product_description,product_image,product_keyword,product_ss1,product_ss2,product_ss3,product_graphics_card,product_cpu,product_ram,product_os,product_platform,product_quantity)values(@category,@developers,@title,@price,@description,@image,@keyword,@ss1,@ss1,@ss3,@pgc,@cpu,@ram,@os,@platform,@quantity)";
                    SqlCommand com = new SqlCommand(insertQuery, con);


                    com.Parameters.AddWithValue("@category", DropDownListGameCategory.SelectedItem.ToString());
                    com.Parameters.AddWithValue("@developers", DropDownListGameDevelopers.SelectedItem.ToString());
                    com.Parameters.AddWithValue("@title", TextBoxGameTitle.Text);
                    com.Parameters.AddWithValue("@price", TextBoxGamePrice.Text);
                    com.Parameters.AddWithValue("@description", TextBoxGameDescription.Text);
                    com.Parameters.AddWithValue("@image", "Products/Cover/" + TextBoxGameTitle.Text + coverFile);
                    com.Parameters.AddWithValue("@keyword", TextBoxGameKeywords.Text);
                    com.Parameters.AddWithValue("@ss1", "Products/ScreenShots/" + TextBoxGameTitle.Text + "S1" + sFile1);
                    com.Parameters.AddWithValue("@ss2", "Products/ScreenShots/" + TextBoxGameTitle.Text + "S2" + sFile2);
                    com.Parameters.AddWithValue("@ss3", "Products/ScreenShots/" + TextBoxGameTitle.Text + "S3" + sFile3);
                    com.Parameters.AddWithValue("@pgc", TextBoxGraphicsCard.Text);
                    com.Parameters.AddWithValue("@cpu", TextBoxCPU.Text);
                    com.Parameters.AddWithValue("@ram", TextBoxRamSize.Text);
                    com.Parameters.AddWithValue("@os", TextBoxOs.Text);
                    com.Parameters.AddWithValue("@platform", DropDownListGamePlatform.SelectedItem.ToString());
                    com.Parameters.AddWithValue("@quantity", TextBoxQuantity.Text);


                    com.ExecuteNonQuery();
                    LabelProductInsertError.Text = "Insertion Successful!!!!";
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