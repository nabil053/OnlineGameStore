using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Online_Game_Store
{
    public partial class Cart : System.Web.UI.Page
    {
        int discount=0;
        int total_price=0;
        int vat = 0;
        int net_total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime currentDate = DateTime.Now;
            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else { 
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                    //Start Of Promo Part
                    String check2 = "select count(*) from promo_code where c_email='" + Session["c_email"] + "'";
                    SqlCommand com2 = new SqlCommand(check2, con);
                    int temp2 = Convert.ToInt32(com2.ExecuteScalar().ToString());

                    if (temp2 > 0)
                    {
                        String check3 = "select end_date from promo_code where c_email='" + Session["c_email"] + "'";
                        SqlCommand com3 = new SqlCommand(check3, con);
                        DateTime end_date = DateTime.Parse(com3.ExecuteScalar().ToString());
                        int result = DateTime.Compare(end_date, currentDate);
                        if (result < 0)
                        {
                            //"Promo Code Expired";

                        }
                        else if (result > 0)
                        {
                            String check4 = "select status from promo_code where c_email='" + Session["c_email"] + "'";
                            SqlCommand com4 = new SqlCommand(check4, con);
                            String temp4 = com4.ExecuteScalar().ToString();
                            if (temp4 == "used")
                            {
                                String check5 = "select discount from promo_code where c_email='" + Session["c_email"] + "'";
                                SqlCommand com5 = new SqlCommand(check5, con);
                                discount = Convert.ToInt32(com5.ExecuteScalar().ToString());


                                //int cal_discount = (discount * net_Total) / 100;
                                //int total_with_Discount=(net_Total-)
                             
                               total_with_discount.Text = discount+"%" ;
                               
                            }
                            else if (temp4 == "unused")
                            {
                                
                            }
                            else if (temp4 == "applied")
                            {
                                
                            }
                            //End Of Promo Part


                        }
                    }
                   


                    string query = "SELECT COUNT(user_id) AS user_count FROM cart WHERE user_id = @user_id";

                SqlCommand comm = new SqlCommand(query, con);
                comm.Parameters.AddWithValue("@user_id", Request.QueryString["u_id"]);

                int user_count = 0;
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        user_count = (Int32)reader["user_count"];
                    }
                }

                if (user_count == 0)
                {
                    ProceedButton.Visible = false;
                    alertBox.Visible = true;
                    messageLabel.Text = "Your cart is empty, please add some items first!";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            }
        }

       

        protected void ButtonBackToBuy_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void CartDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("UpdateQuantity"))
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                    con.Open();

                    string[] args = new string[4];
                    args = e.CommandArgument.ToString().Split(',');
                    string row_id = args[0];
                    string user_id = args[1];
                    int product_price = Convert.ToInt32(args[2]);
                    string product_name = args[3];

                    TextBox tb = (TextBox)(e.Item.FindControl("TextBoxQuantity"));
                    int quantity = Convert.ToInt32(tb.Text);

                    if ((quantity > 100) && (tb.Text.Length > 0))
                    {
                        ((HtmlContainerControl)(e.Item.FindControl("alertBox"))).Visible = true;
                        ((Label)(e.Item.FindControl("messageLabel"))).Text = "you cannot order more than 100 samples!";
                    }
                    else if ((quantity <= 0) && (tb.Text.Length > 0))
                    {
                        ((HtmlContainerControl)(e.Item.FindControl("alertBox"))).Visible = true;
                        ((Label)(e.Item.FindControl("messageLabel"))).Text = "Invalid quantity!";
                    }
                    else
                    {
                        string query = "SELECT product_quantity FROM products WHERE product_title LIKE '%' + @name + '%'";

                        SqlCommand comm = new SqlCommand(query, con);
                        comm.Parameters.AddWithValue("@name", product_name);

                        int stock_count = 0;
                        using (SqlDataReader reader = comm.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                stock_count = (Int32)reader["product_quantity"];
                            }
                        }

                        comm.Parameters.Clear();

                        if ((quantity > stock_count) && (tb.Text.Length > 0))
                        {
                            ((HtmlContainerControl)(e.Item.FindControl("alertBox"))).Visible = true;
                            ((Label)(e.Item.FindControl("messageLabel"))).Text = "Out of Stock!";
                        }

                        else
                        {
                           
                            
                               total_price = product_price * quantity;
                                vat = (total_price * 15) / 100;
                                net_total = total_price + vat;
                            
                            

                            query = "UPDATE cart SET product_quantity = @product_quantity, total_price = @total_price, vat = @vat, net_total = @net_total WHERE Id = @Id";

                            comm = new SqlCommand(query, con);
                            comm.Parameters.AddWithValue("@Id", row_id);
                            comm.Parameters.AddWithValue("@product_quantity", quantity.ToString());
                            comm.Parameters.AddWithValue("@total_price", total_price.ToString());
                            comm.Parameters.AddWithValue("@vat", vat.ToString());
                            comm.Parameters.AddWithValue("@net_total", net_total.ToString());

                            comm.ExecuteNonQuery();
                            comm.Parameters.Clear();

                            Response.Redirect("Cart.aspx?u_id=" + user_id);
                        }

                    }

                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else if (e.CommandName.Equals("DeleteProduct"))
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                    con.Open();

                    string[] args = new string[2];
                    args = e.CommandArgument.ToString().Split(',');
                    string row_id = args[0];
                    string user_id = args[1];

                    string query = "DELETE FROM cart WHERE Id = @Id";

                    SqlCommand comm = new SqlCommand(query, con);
                    comm.Parameters.AddWithValue("@Id", row_id);

                    comm.ExecuteNonQuery();

                    comm.Parameters.Clear();

                    con.Close();

                    Response.Redirect("Cart.aspx?u_id=" + user_id);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        protected void ProceedButton_Click(object sender, EventArgs e)
        {
            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            //Session["c_email"]
            string c_id = "select customer_id from customer where customer_email='" + Session["c_email"] + "'";
            SqlCommand com2 = new SqlCommand(c_id, con);
            string cusID = com2.ExecuteScalar().ToString();

            con.Close();
            Response.Redirect("MasterCardPage.aspx?u_id=" + cusID);
        }

        }
    }
}