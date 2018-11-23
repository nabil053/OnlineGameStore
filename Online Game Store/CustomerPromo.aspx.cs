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
    public partial class CustomerPromo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
        }

        protected void myAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyAccount.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateCustomerProfile.aspx");
        }

        protected void Button1CustomerLogout_Click(object sender, EventArgs e)
        {
            Session["c_email"] = null;
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfileOrders.aspx");
        }

        protected void GoToCart_Click(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();

                string check = "select customer_id from customer where customer_email='" + Session["c_email"] + "'";
                SqlCommand com = new SqlCommand(check, con);
                int user_id = Convert.ToInt32(com.ExecuteScalar().ToString());
                Response.Redirect("Cart.aspx?u_id=" + user_id);
            }
            else
            {
                Response.Redirect("CustomerLogin.aspx");
            }

        }

        protected void ButtonPromoApply_Click(object sender, EventArgs e)
        {
            DateTime currentDate = DateTime.Now;
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();

                String check2 = "select count(*) from promo_code where code='" + TextBoxPromoCode.Text + "'";
                SqlCommand com2 = new SqlCommand(check2, con);
                int temp2 = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp2 > 0)
                {
                    String check3 = "select end_date from promo_code where code='" + TextBoxPromoCode.Text + "'";
                    SqlCommand com3 = new SqlCommand(check3, con);
                    DateTime end_date = DateTime.Parse(com3.ExecuteScalar().ToString());
                    int result = DateTime.Compare(end_date, currentDate);
                    if (result < 0)
                    {
                        LabelPromoWarning.Text = "Promo Code Expired";

                    }
                    else if (result > 0)
                    {
                        String check4 = "select status from promo_code where code='" + TextBoxPromoCode.Text + "'";
                        SqlCommand com4 = new SqlCommand(check4, con);
                        String temp4 = com4.ExecuteScalar().ToString();
                        if (temp4 == "used")
                        {
                            LabelPromoWarning.Text = "Promo Code Not Available!!!";
                        }
                        else if (temp4 == "unused")
                        {
                            String insertQuery = "Update promo_code set status=@status,c_email=@email where code='" + TextBoxPromoCode.Text + "'";
                            SqlCommand com = new SqlCommand(insertQuery, con);
                            com.Parameters.AddWithValue("@status", "used");
                            com.Parameters.AddWithValue("@email", Session["c_email"]);
                            com.ExecuteNonQuery();
                            LabelPromoWarning.Text = "Successfully activated!!!";
                        }
                        else if (temp4 == "applied")
                        {
                            LabelPromoWarning.Text = "Already Used!!!";
                        }

                       

                    }
                    //int temp3 = Convert.ToInt32(com3.ExecuteScalar().ToString());
                    //if (temp3>0) {
                    //    LabelPromoWarning.Text = "Not Expired";
                    //}
                    //else {
                    //    LabelPromoWarning.Text = "Expired";
                    //}

                }
                else {
                    LabelPromoWarning.Text = "Invalid Promo Code";
                }
                
                /*
                String check5 = "select count(*) from promo_code where code='" + TextBoxPromoCode.Text + "' AND status='" + stat2 + "' AND end_date > '" + dateTime.ToString("MM/dd/yyyy") + "'";
                SqlCommand com5 = new SqlCommand(check5, con);
                int temp5 = Convert.ToInt32(com5.ExecuteScalar().ToString());
                if (temp5 > 0)
                {

                    
                }
                else
                {
                    LabelPromoWarning.Text = "Invalid Promo Code!";
                }

                */

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("" + ex.ToString());
            }
        }


    }
}