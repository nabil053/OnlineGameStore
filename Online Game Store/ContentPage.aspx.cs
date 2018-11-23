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
    public partial class ContentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["c_email"] != null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
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
        protected void SuggestionsDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("ViewProduct"))
            {
                Response.Redirect("ContentPage.aspx?p_id=" + e.CommandArgument.ToString());
            }
        }

        protected void DataForButtonDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddToCart"))
            {
                if (Session["c_email"] != null)
                {
                    try
                    {
                        string[] args = new string[3];
                        args = e.CommandArgument.ToString().Split(',');
                        string name = args[0];
                        Int32 in_stock = Convert.ToInt32(args[1]);
                        Int32 price = Convert.ToInt32(args[2]);

                        if (in_stock < 1)
                        {
                            ((HtmlContainerControl)(e.Item.FindControl("alertBox"))).Visible = true;
                            ((Label)(e.Item.FindControl("messageLabel"))).Text = "Out of Stock!";
                        }
                        else
                        {


                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                            con.Open();

                            string check = "select customer_id from customer where customer_email='" + Session["c_email"] + "'";
                            SqlCommand com = new SqlCommand(check, con);
                            String user_id = com.ExecuteScalar().ToString();

                            string query = "SELECT COUNT(user_id) AS user_count FROM cart WHERE (user_id = @user_id) AND (product_title LIKE '%' + @product_name + '%')";

                            SqlCommand comm = new SqlCommand(query, con);
                            comm.Parameters.AddWithValue("@user_id", user_id);
                            comm.Parameters.AddWithValue("@product_name", name);

                            int user_count = 0;
                            using (SqlDataReader reader = comm.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    user_count = (Int32)reader["user_count"];
                                }
                            }

                            comm.Parameters.Clear();

                            if (user_count == 1)
                            {
                                query = "SELECT product_quantity FROM cart WHERE (user_id = @user_id) AND (product_title LIKE '%' + @product_name + '%')";

                                comm = new SqlCommand(query, con);
                                comm.Parameters.AddWithValue("@user_id", user_id);
                                comm.Parameters.AddWithValue("@product_name", name);

                                int product_quantity = 0;
                                using (SqlDataReader reader = comm.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        product_quantity = (Int32)reader["product_quantity"];
                                    }
                                }

                                product_quantity++;
                                int total_price = price * product_quantity;
                                int vat = (total_price * 15) / 100;
                                int net_total = vat + total_price;

                                comm.Parameters.Clear();

                                query = "UPDATE cart SET product_quantity = @product_quantity, total_price = @total_price, vat = @vat, net_total = @net_total WHERE (user_id = @user_id) AND (product_title LIKE '%' + @product_name + '%')";

                                comm = new SqlCommand(query, con);
                                comm.Parameters.AddWithValue("@user_id", user_id);
                                comm.Parameters.AddWithValue("@product_name", name);
                                comm.Parameters.AddWithValue("@product_quantity", product_quantity.ToString());
                                comm.Parameters.AddWithValue("@total_price", total_price.ToString());
                                comm.Parameters.AddWithValue("@vat", vat.ToString());
                                comm.Parameters.AddWithValue("@net_total", net_total.ToString());

                                comm.ExecuteNonQuery();

                                comm.Parameters.Clear();
                            }
                            else
                            {
                                Random rnd = new Random();
                                //int Id = rnd.Next(10, 10001);
                                query = "INSERT INTO cart(user_id,product_title,product_price,product_quantity,total_price,vat,net_total) VALUES (@user_id,@product_name,@product_price,@product_quantity,@total_price,@vat,@net_total)";

                                comm = new SqlCommand(query, con);

                                //comm.Parameters.AddWithValue("@Id", Id.ToString());
                                comm.Parameters.AddWithValue("@user_id", user_id);
                                comm.Parameters.AddWithValue("@product_name", name);
                                comm.Parameters.AddWithValue("@product_price", price.ToString());
                                comm.Parameters.AddWithValue("@product_quantity", "1");
                                comm.Parameters.AddWithValue("@total_price", price.ToString());
                                comm.Parameters.AddWithValue("@vat", ((price * 15) / 100).ToString());
                                comm.Parameters.AddWithValue("@net_total", (price + ((price * 15) / 100)).ToString());

                                comm.ExecuteNonQuery();

                                comm.Parameters.Clear();
                            }

                            con.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }

                }
                else {
                    ((HtmlContainerControl)(e.Item.FindControl("alertBox"))).Visible = true;
                    ((Label)(e.Item.FindControl("messageLabel"))).Text = "Login First!";
                }
            }
        }
    }
}