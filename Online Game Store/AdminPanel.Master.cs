using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Game_Store
{
    public partial class AdminPanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                ButtonLogout.Visible =true;
            }
            else {
                ButtonLogout.Visible = false;
            }
        }

        protected void ButtonViewSite_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonInsertProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertProduct.aspx");
        }

        protected void ButtonViewAllProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProduct.aspx");
        }

        protected void ButtonViewCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCustomer.aspx");
        }

        protected void ButtonInsertDeveloper_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertDeveloper.aspx");
        }

        protected void ButtonInsertCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertCategory.aspx");
        }

        protected void ButtonViewCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCategory.aspx");
        }

        protected void ButtonViewDeveloper_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewDevelopers.aspx");
        }

        protected void ButtonViewMessages_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCustomerMessage.aspx");
            
        }

        protected void ButtonViewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewOrders.aspx");
        }

        

      

        protected void ButtonUpdateOtherImages_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateOtherImages.aspx");
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["New"] =null;
            Response.Redirect("AdminLogin.aspx");
        }

        protected void ButtonUpdateHeader_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateHeaderImage.aspx");
        }

        

        protected void ButtonUpdateCenterAds_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadAdsCenterImage.aspx");
        }

        protected void ButtonUpdateBanner_Click1(object sender, EventArgs e)
        {
            Response.Redirect("UploadBannerImage.aspx");
        }

        protected void ButtonUpdateNewsFeed_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateNewsFeed.aspx");
        }

        protected void ButtonInsertFaqs_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertFAQs.aspx");
        }
        protected void ButtonViewFaqs_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewFAQs.aspx");
        }

        protected void ButtonInsertPlatform_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertPlatform.aspx");
        }

        protected void ButtonViewPlatform_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPlatform.aspx");
           
        }

        protected void ButtonHome_Click(object sender, EventArgs e)
        {
           
                Response.Redirect("AdminHomePage.aspx");
        }

        protected void ButtonInsertPromos_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdmininsertPromo.aspx");
        }

        protected void ButtonViewPromos_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminViewPromoCode.aspx");
        }

        protected void ButtonUpdateFooterText_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("UpdateFooterText.aspx");
        }
    }
}