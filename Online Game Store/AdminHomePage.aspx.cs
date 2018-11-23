using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace Online_Game_Store
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String check = "select count(product_id) from products";
                SqlCommand com = new SqlCommand(check, con);
                int totalPostNo = Convert.ToInt32(com.ExecuteScalar().ToString());
                LabelTotalPostCount.Text = totalPostNo.ToString();

                String check2 = "select count(customer_id) from customer";
                SqlCommand com2 = new SqlCommand(check2, con);
                int totalCNo = Convert.ToInt32(com2.ExecuteScalar().ToString());
                LabelTotalCustomerCount.Text = totalCNo.ToString();

                String check3 = "select count(Id) from help_messages";
                SqlCommand com3 = new SqlCommand(check3, con);
                int totalHMNo = Convert.ToInt32(com3.ExecuteScalar().ToString());
                LabelTotalMessageCount.Text = totalHMNo.ToString();

                String check4 = "select count(Id) from master_card_table";
                SqlCommand com4 = new SqlCommand(check4, con);
                int totalONo = Convert.ToInt32(com4.ExecuteScalar().ToString());
                LabelOrdersCount.Text = totalONo.ToString();

                //String check5 = "select count(category_id) from categories";
                //SqlCommand com5 = new SqlCommand(check5, con);
                //int totalCatNo = Convert.ToInt32(com5.ExecuteScalar().ToString());
                //LabelCategoriesCount.Text = totalCatNo.ToString();

                //String check6 = "select count(developer_id) from developers";
                //SqlCommand com6 = new SqlCommand(check6, con);
                //int totalDevNo = Convert.ToInt32(com6.ExecuteScalar().ToString());
                //LabelDevelopersCount.Text = totalDevNo.ToString();

                con.Close();
            }
            if (Session["New"] != null)
            {
                LabelShowEmail.Text = Session["New"].ToString();
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}