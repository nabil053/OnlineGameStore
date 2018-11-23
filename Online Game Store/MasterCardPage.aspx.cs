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
   
    public partial class CreditCardPage : System.Web.UI.Page
    {
        int dis = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else {
                DateTime currentDate = DateTime.Now;
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
                   if (result > 0)
                    {
                        String check4 = "select status from promo_code where c_email='" + Session["c_email"] + "'";
                        SqlCommand com4 = new SqlCommand(check4, con);
                        String temp4 = com4.ExecuteScalar().ToString();
                        if (temp4 == "used")
                        {
                            String check5 = "select discount from promo_code where c_email='" + Session["c_email"] + "'";
                            SqlCommand com5 = new SqlCommand(check5, con);
                            dis = Convert.ToInt32(com5.ExecuteScalar().ToString());
                            //Response.Write(""+dis);
                        }
                    }
                }
            }
        }

        public bool IsAllDigits(string s)
        {
            return s.All(char.IsDigit);
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();

                string querys = "SELECT COUNT(user_id) AS user_count FROM cart WHERE user_id = @user_id";

                SqlCommand comms = new SqlCommand(querys, con);
                comms.Parameters.AddWithValue("@user_id", Request.QueryString["u_id"]);

                int user_count = 0;
                using (SqlDataReader reader = comms.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        user_count = (Int32)reader["user_count"];
                    }
                }

                string card_number_tb = card_number.Text.ToString();
                string cardholder_name_tb = cardholder_name.Text.ToString();
                string billing_address_tb = billing_address.Text.ToString();
                string month_tb = month.Text.ToString();
                string year_tb = year.Text.ToString();
                string cvc_tb = cvc.Text.ToString();

                if (user_count == 0)
                {
                    Response.Redirect("Default.aspx");
                }
                else if ((card_number_tb.Length == 0) || (cardholder_name_tb.Length == 0) || (billing_address_tb.Length == 0) || (month_tb.Length == 0) || (year_tb.Length == 0) || (cvc_tb.Length == 0))
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "One or more fields are empty!";
                }
                else if (IsAllDigits(card_number_tb) == false)
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "Card number must be numeric!";
                }
                else if (card_number_tb.Length != 16)
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "Invalid Card number!";
                }
                else if (IsAllDigits(month_tb) == false)
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "Month must be numeric!";
                }
                else if (IsAllDigits(year_tb) == false)
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "Year must be numeric!";
                }
                else if (IsAllDigits(cvc_tb) == false)
                {
                    alertBox.Visible = true;
                    alertLabel.Text = "<strong>Error! </strong>";
                    messageLabel.Text = "CVC must be numeric!";
                }
                else
                {



                    string user_id_db = Request.QueryString["u_id"];

                    //Session["c_email"]
                    string c_id = "select customer_contact from customer where customer_id='" + user_id_db + "'";
                    SqlCommand com2 = new SqlCommand(c_id, con);
                    string mobile = com2.ExecuteScalar().ToString();



                    string card_number_db = card_number_tb;
                    string cardholder_name_db = cardholder_name_tb;
                    string card_address_db = billing_address_tb;
                    string card_mm_db = month_tb;
                    string card_yy_db = year_tb;
                    string card_cvc_db = cvc_tb;
                    string phone_number_db = mobile.ToString();
                    string status_db = "pending";

                    string query = "SELECT product_title, product_price, product_quantity FROM cart WHERE user_id = @user_id";

                    SqlCommand comm = new SqlCommand(query, con);
                    comm.Parameters.AddWithValue("@user_id", user_id_db);

                    int order_count = 0;
                    string products_db = "";
                    string quantities_db = "";
                    string prices_db = "";
                    List<string> products_list = new List<string>();
                    List<int> quantities_list = new List<int>();

                    using (SqlDataReader reader = comm.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (order_count != 0)
                            {
                                products_db = products_db + ",";
                                quantities_db = quantities_db + ",";
                                prices_db = prices_db + ",";
                            }
                            products_db = products_db + (reader["product_title"].ToString());
                            quantities_db = quantities_db + (reader["product_quantity"].ToString());
                            prices_db = prices_db + (reader["product_price"].ToString());
                            order_count++;

                            products_list.Add(reader["product_title"].ToString());

                            int quantity_int = Convert.ToInt32(reader["product_quantity"]);
                            quantities_list.Add(quantity_int);
                        }
                    }

                    comm.Parameters.Clear();

                    bool is_in_stock = true;
                    List<int> stocks_list = new List<int>();
                    for (int i = 0; i < order_count; i++)
                    {
                        query = "SELECT product_quantity FROM products WHERE product_title LIKE '%' + @name + '%'";

                        comm = new SqlCommand(query, con);
                        comm.Parameters.AddWithValue("@name", products_list[i].ToString());

                        using (SqlDataReader reader = comm.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                int quantity_int = quantities_list[i];
                                int stock_int = Convert.ToInt32(reader["product_quantity"]);
                                stocks_list.Add(stock_int);

                                if (quantity_int > stock_int) is_in_stock = false;
                            }
                        }

                        comm.Parameters.Clear();
                    }

                    query = "SELECT SUM(net_total) AS net_total_sum FROM cart WHERE (user_id = @user_id)";

                    comm = new SqlCommand(query, con);
                    comm.Parameters.AddWithValue("@user_id", user_id_db);

                    string total_price_db = "";

                    using (SqlDataReader reader = comm.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            total_price_db = reader["net_total_sum"].ToString();
                        }
                    }

                    comm.Parameters.Clear();

                    if (is_in_stock == false)
                    {
                        alertBox.Visible = true;
                        alertLabel.Text = "<strong>Error! </strong>";
                        messageLabel.Text = "One or more items are out of stock!";
                    }
                    else
                    {
                        for (int i = 0; i < order_count; i++)
                        {
                            stocks_list[i] = stocks_list[i] - quantities_list[i];

                            query = "UPDATE products SET product_quantity = @in_stock WHERE product_title LIKE '%' + @name + '%'";

                            comm = new SqlCommand(query, con);

                            comm.Parameters.AddWithValue("@in_stock", stocks_list[i].ToString());
                            comm.Parameters.AddWithValue("@name", products_list[i].ToString());

                            comm.ExecuteNonQuery();

                            comm.Parameters.Clear();
                        }

                        int covert_total = Convert.ToInt32(total_price_db);
                        int calculate_dis2 = (covert_total * dis)/100;
                        int new_total_price = covert_total-calculate_dis2;

                        query = "INSERT INTO master_card_table(user_id,card_number,cardholder_name,card_address,card_mm,card_yy,card_cvc,quantities,total_price,date,status,phone_number,products,customer_email,prices) VALUES (@user_id,@card_number,@cardholder_name,@card_address,@card_mm,@card_yy,@card_cvc,@quantities,@total_price,@datetime,@status,@phone_number,@products,@email,@prices)";

                        comm = new SqlCommand(query, con);
                        comm.Parameters.AddWithValue("@user_id", user_id_db);
                        comm.Parameters.AddWithValue("@card_number", card_number_db);
                        comm.Parameters.AddWithValue("@cardholder_name", cardholder_name_db);
                        comm.Parameters.AddWithValue("@card_address", card_address_db);
                        comm.Parameters.AddWithValue("@card_mm", card_mm_db);
                        comm.Parameters.AddWithValue("@card_yy", card_yy_db);
                        comm.Parameters.AddWithValue("@card_cvc", card_cvc_db);
                        comm.Parameters.AddWithValue("@products", products_db);
                        comm.Parameters.AddWithValue("@quantities", quantities_db);
                        comm.Parameters.AddWithValue("@total_price", new_total_price);
                        comm.Parameters.AddWithValue("@phone_number", phone_number_db);
                        comm.Parameters.AddWithValue("@status", status_db);
                        comm.Parameters.AddWithValue("@prices", prices_db);
                        comm.Parameters.AddWithValue("@email", Session["c_email"]);
                        comm.Parameters.AddWithValue("@datetime", DateTime.Now);

                        comm.ExecuteNonQuery();

                        comm.Parameters.Clear();

                        query = "DELETE FROM cart WHERE user_id = @user_id";

                        comm = new SqlCommand(query, con);
                        comm.Parameters.AddWithValue("@user_id", user_id_db);
                        comm.ExecuteNonQuery();
                        comm.Parameters.Clear();

                        card_number.Text = string.Empty;
                        cardholder_name.Text = string.Empty;
                        billing_address.Text = string.Empty;
                        month.Text = string.Empty;
                        year.Text = string.Empty;
                        cvc.Text = string.Empty;

                        alertBox.Attributes["class"] = "alert alert-success alert-dismissible";
                        alertLabel.Text = "<strong>Congratulations! </strong>";
                        messageLabel.Text = "Purchase Successfull!";
                    }
                    stocks_list.Clear();
                    products_list.Clear();
                    quantities_list.Clear();

                    //Finally changing promo status
                    DateTime currentDate = DateTime.Now;
                    //Start Of Promo Part
                    String checks2 = "select count(*) from promo_code where c_email='" + Session["c_email"] + "'";
                    SqlCommand coms2 = new SqlCommand(checks2, con);
                    int temps2 = Convert.ToInt32(coms2.ExecuteScalar().ToString());

                    if (temps2 > 0)
                    {
                        String checks3 = "select end_date from promo_code where c_email='" + Session["c_email"] + "'";
                        SqlCommand coms3 = new SqlCommand(checks3, con);
                        DateTime end_date = DateTime.Parse(coms3.ExecuteScalar().ToString());
                        int result = DateTime.Compare(end_date, currentDate);
                        if (result > 0)
                        {
                            String checks4 = "select status from promo_code where c_email='" + Session["c_email"] + "'";
                            SqlCommand coms4 = new SqlCommand(checks4, con);
                            String temp4 = coms4.ExecuteScalar().ToString();
                            if (temp4 == "used")
                            {
                                String promoUpdateStatus = "Update promo_code set status=@status where c_email=@email ";
                                SqlCommand com = new SqlCommand(promoUpdateStatus, con);
                                com.Parameters.AddWithValue("@status", "applied");
                                com.Parameters.AddWithValue("@email", Session["c_email"]);
                                com.ExecuteNonQuery();
                            }
                        }
                    }
                    
                    

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            }
        }
    }
