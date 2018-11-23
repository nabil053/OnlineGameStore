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
    public partial class UpdateCustomerProfile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["c_email"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            if (!IsPostBack)
            {
                SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con2.Open();
                String sQuery = "select * from customer where customer_email='" + Session["c_email"] + "'";
                SqlCommand com2 = new SqlCommand(sQuery, con2);

                SqlDataAdapter ad = new SqlDataAdapter();
                ad.SelectCommand = com2;
                DataSet ds = new DataSet();

                ad.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    fname.Text = ds.Tables[0].Rows[0]["customer_name"].ToString();
                    email.Text = ds.Tables[0].Rows[0]["customer_email"].ToString();
                    password.Text = ds.Tables[0].Rows[0]["customer_pass"].ToString();
                    country.Text = ds.Tables[0].Rows[0]["customer_country"].ToString();
                    city.Text = ds.Tables[0].Rows[0]["customer_city"].ToString();
                    contact.Text = ds.Tables[0].Rows[0]["customer_contact"].ToString();
                    address.Text = ds.Tables[0].Rows[0]["customer_address"].ToString();
                    string gen = ds.Tables[0].Rows[0]["customer_gender"].ToString();
                    if (gen.Equals("Male"))
                    {
                        male.Checked = true;
                    }
                    else
                    {
                        female.Checked = true;
                    }

                }
                else
                {
                    Response.Write("Error");
                }
                con2.Close();

            }
        }

        protected void Button2CustomerLogout_Click(object sender, EventArgs e)
        {
            Session["c_email"] = null;
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void Save_button_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();

            String check = "select count(*) from master_card_table where customer_email='" + Session["c_email"] + "'";
            SqlCommand comss = new SqlCommand(check, con);
            int temp = Convert.ToInt32(comss.ExecuteScalar().ToString());

            if (temp==1) {
                String updateQuery = "Update master_card_table set customer_email = @ne Where customer_email = '" + Session["c_email"] + "'";
                SqlCommand coms = new SqlCommand(updateQuery, con);
                coms.Parameters.AddWithValue("@ne", email.Text);
                coms.ExecuteNonQuery();
            }

            String upQuery = "Update customer set customer_name=@fname,customer_email=@email,customer_pass=@password,customer_country=@country,customer_city=@city,customer_contact=@contact,customer_address=@address,customer_gender=@gender Where customer_email='" + Session["c_email"] + "'";
            SqlCommand com = new SqlCommand(upQuery, con);

            com.Parameters.AddWithValue("@fname", fname.Text);
            com.Parameters.AddWithValue("@email", email.Text);
            com.Parameters.AddWithValue("@password", password.Text);
            com.Parameters.AddWithValue("@country", country.Text);
            com.Parameters.AddWithValue("@city", city.Text);
            com.Parameters.AddWithValue("@contact", contact.Text);
            com.Parameters.AddWithValue("@address", address.Text);


            string gender = "Male";

            if (male.Checked == true)
            {
                gender = "Male";
            }

            if (female.Checked == true)
            {
                gender = "Female";
            }
            com.Parameters.AddWithValue("@gender", gender);


            com.ExecuteNonQuery();
            Session["c_email"] = null;
            Response.Redirect("CustomerLogin.aspx");
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyAccount.aspx");
        }

        protected void viewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfileOrders.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPromo.aspx");
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
    }
}