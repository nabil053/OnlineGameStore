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
    public partial class AdmininsertPromo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void ButtonPromoInsert_Click(object sender, EventArgs e)
        {

            DateTime dateTime = DateTime.UtcNow.Date;
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
                con.Open();
                String check = "select count(*) from promo_code where code='" + TextBoxCode.Text + "'";
                SqlCommand com2 = new SqlCommand(check, con);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                if (temp > 0)
                {
                    LabelPromoInsertError.Text = "Promo Code Already Exist!!!";
                }
                else
                {
                    String insertQuery = "insert into promo_code(code,discount,status,c_email,end_date)values(@code,@discount,@status,@email,@edate)";
                    SqlCommand com = new SqlCommand(insertQuery, con);


                    com.Parameters.AddWithValue("@code", TextBoxCode.Text);
                    com.Parameters.AddWithValue("@discount", TextBoxDiscount.Text);
                    com.Parameters.AddWithValue("@status", "unused");
                    com.Parameters.AddWithValue("@email", "none");
                    com.Parameters.AddWithValue("@edate", DateTime.Parse(TextBoxGameEDate.Text));
                    com.ExecuteNonQuery();
                    LabelPromoInsertError.Text = "Insertion Successful!!!!";
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