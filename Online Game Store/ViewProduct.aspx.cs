using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Online_Game_Store
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            if (!IsPostBack) {
                Bind();
            }
        }

        public void Bind() {
            SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con2.Open();
            String sQuery = "select * from products";
            SqlCommand com2 = new SqlCommand(sQuery, con2);

            SqlDataAdapter ad = new SqlDataAdapter();
            ad.SelectCommand = com2;
            DataSet ds = new DataSet();

            ad.Fill(ds);

            GridViewViewProduct.DataSource = ds;
            GridViewViewProduct.DataBind();
            con2.Close();
        }

        protected void GridViewViewProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewViewProduct.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridViewViewProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewViewProduct.EditIndex =-1;
            Bind();
        }

        protected void GridViewViewProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewViewProduct.PageIndex = e.NewPageIndex;
            Bind();
        }
        static string coverFile, sFile1, sFile2, sFile3;

        protected void GridViewViewProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)GridViewViewProduct.Rows[index];
            Label id = (Label)row.FindControl("LabelPId");
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String query = "delete from products where [product_id]=@pid";
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("@pid", id.Text);
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ViewProduct.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("" + ex.ToString());
            }

        }
        String link1, link2, link3, link4;
        FileUpload cover, ss1, ss2, ss3;
        String imageTitle, imageS1, imageS2, imageS3;
        protected void GridViewViewProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)GridViewViewProduct.Rows[index];
            TextBox text10 = (TextBox)row.FindControl("TextBoxPlatform");
            TextBox text11 = (TextBox)row.FindControl("TextBoxCategory");
            TextBox text12 = (TextBox)row.FindControl("TextBoxDeveloper");
            TextBox text1 = (TextBox)row.FindControl("TextBoxTitle");
            TextBox text2= (TextBox)row.FindControl("TextBoxPrice");
            TextBox text3 = (TextBox)row.FindControl("TextBoxDescription");
            TextBox text4 = (TextBox)row.FindControl("TextBoxKeyword");
            TextBox text5 = (TextBox)row.FindControl("TextBoxGraphics");
            TextBox text6 = (TextBox)row.FindControl("TextBoxCpu");
            TextBox text7 = (TextBox)row.FindControl("TextBoxRam");
            TextBox text8 = (TextBox)row.FindControl("TextBoxOs");
            TextBox text9 = (TextBox)row.FindControl("TextBoxQuantity");

            cover = (FileUpload)row.FindControl("FileUploadCover");
            ss1 = (FileUpload)row.FindControl("FileUploadSS1");
            ss2 = (FileUpload)row.FindControl("FileUploadSS2");
            ss3 = (FileUpload)row.FindControl("FileUploadSS3");
            Label id = (Label)row.FindControl("LabelPIds");
            Label c = (Label)row.FindControl("LabelLinkCover");
            Label s1 = (Label)row.FindControl("LabelLinkSS1");
            Label s2 = (Label)row.FindControl("LabelLinkSS2");
            Label s3 = (Label)row.FindControl("LabelLinkSS3");

            //Random rand = new Random((int)DateTime.Now.Ticks);
            //int numIterations = 0;
            //numIterations = rand.Next(1, 1000);
            imageTitle = text1.Text;
            imageS1 = text1.Text+"S1";
            imageS2 = text1.Text + "S2";
            imageS3 = text1.Text + "S3";


            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = updatedata;
            //cmd.Connection = sqlcon;
            //cmd.ExecuteNonQuery();
            //sqlcon.Close();
            //


            if (cover.PostedFile.FileName.Length > 0)
            {
                cover.SaveAs(Server.MapPath("~/Products/Cover/") + imageTitle + Path.GetExtension(cover.FileName));
                link1 = "Products/Cover/" + imageTitle + Path.GetExtension(cover.FileName);
            }
            else {
                link1 = c.Text;
            }

            if (ss1.PostedFile.FileName.Length > 0)
            {
                ss1.SaveAs(Server.MapPath("~/Products/ScreenShots/") + imageS1 + Path.GetExtension(ss1.FileName));
                link2 = "Products/ScreenShots/" + imageS1 + Path.GetExtension(ss1.FileName);
            }
            else {
                link2 = s1.Text;
            }

            if (ss2.PostedFile.FileName.Length > 0)
            {
                ss2.SaveAs(Server.MapPath("~/Products/ScreenShots/") + imageS2 + Path.GetExtension(ss2.FileName));
                link3 = "Products/ScreenShots/" + imageS2 + Path.GetExtension(ss2.FileName);
            }
            else
            {
                link3 = s2.Text;
            }

            if (ss3.PostedFile.FileName.Length > 0)
            {
                ss3.SaveAs(Server.MapPath("~/Products/ScreenShots/") + imageS3 + Path.GetExtension(ss3.FileName));
               link4 = "Products/ScreenShots/" + imageS3 + Path.GetExtension(ss3.FileName);
            }
            else
            {
                link4 = s3.Text;
            }
            //coverFile = Path.GetExtension(cover.PostedFile.FileName);
            //    sFile1 = Path.GetExtension(ss1.PostedFile.FileName);
            //    sFile2 = Path.GetExtension(ss2.PostedFile.FileName);
            //    sFile3 = Path.GetExtension(ss3.PostedFile.FileName);
            //    //"G:/CSharp_Project/Online Game Store/Online Game Store/Images/"
            //    cover.SaveAs(Server.MapPath("~/Products/Cover/") + text1.Text + coverFile);
            //    ss1.SaveAs(Server.MapPath("~/Products/ScreenShots/") + text1.Text + "_S1" + sFile1);
            //    ss2.SaveAs(Server.MapPath("~/Products/ScreenShots/") + text1.Text + "_S2" + sFile2);
            //    ss3.SaveAs(Server.MapPath("~/Products/ScreenShots/") + text1.Text + "_S3" + sFile3);

            try
                {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            String insertQuery = "update products set product_category=@category,product_developers=@developer,product_title=@title,product_price=@price,product_description=@description,product_image=@image,product_keyword=@keyword,product_ss1=@ss1,product_ss2=@ss2,product_ss3=@ss3,product_graphics_card=@pgc,product_cpu=@cpu,product_ram=@ram,product_os=@os,product_platform=@platform,product_quantity=@quantity where [product_id]=@pid";
            SqlCommand com = new SqlCommand(insertQuery, con);

            com.Parameters.AddWithValue("@title", text1.Text);
            com.Parameters.AddWithValue("@category", text11.Text);
            com.Parameters.AddWithValue("@developer", text12.Text);
            com.Parameters.AddWithValue("@price", text2.Text);
            com.Parameters.AddWithValue("@description", text3.Text);
            com.Parameters.AddWithValue("@image", link1);
            com.Parameters.AddWithValue("@keyword", text4.Text);
            com.Parameters.AddWithValue("@ss1", link2);
            com.Parameters.AddWithValue("@ss2", link3);
            com.Parameters.AddWithValue("@ss3", link4);
            com.Parameters.AddWithValue("@pgc", text5.Text);
            com.Parameters.AddWithValue("@cpu", text6.Text);
            com.Parameters.AddWithValue("@ram", text7.Text);
            com.Parameters.AddWithValue("@os", text8.Text);
            com.Parameters.AddWithValue("@platform", text10.Text);
            com.Parameters.AddWithValue("@quantity", text9.Text);
            com.Parameters.AddWithValue("@pid", id.Text);

            com.ExecuteNonQuery();
            con.Close();
            GridViewViewProduct.EditIndex = -1;
            Bind();
            }
            catch (Exception ex)
            {
                Response.Write("" + ex.ToString());
            }
        }
    }
}