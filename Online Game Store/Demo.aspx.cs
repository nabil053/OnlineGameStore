using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Game_Store
{
    public partial class Demo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonUpdateImages_Click(object sender, EventArgs e)
        {

        }

        private void retrive() {
            //SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            //con2.Open();
            //String sQuery = "select * from products";
            //SqlCommand com2 = new SqlCommand(sQuery, con2);

            //SqlDataAdapter ad = new SqlDataAdapter();
            //ad.SelectCommand = com2;
            //DataSet ds = new DataSet();

            //ad.Fill(ds);

            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    fname.Text = ds.Tables[0].Rows[0]["customer_name"].ToString();
            //    email.Text = ds.Tables[0].Rows[0]["customer_email"].ToString();
            //    password.Text = ds.Tables[0].Rows[0]["customer_pass"].ToString();
            //    country.Text = ds.Tables[0].Rows[0]["customer_country"].ToString();
            //    city.Text = ds.Tables[0].Rows[0]["customer_city"].ToString();
            //    contact.Text = ds.Tables[0].Rows[0]["customer_contact"].ToString();
            //    address.Text = ds.Tables[0].Rows[0]["customer_address"].ToString();
            //    string gen = ds.Tables[0].Rows[0]["customer_gender"].ToString();
            //    if (gen.Equals("Male"))
            //    {
            //        male.Checked = true;
            //    }
            //    else
            //    {
            //        female.Checked = true;
            //    }

            //}
            //else
            //{
            //    Response.Write("Error");
            //}
            //con2.Close();
        }

        protected void rptCarousel_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectDate = TextBoxTime.Text;

            DateTime d1 = DateTime.Parse(selectDate);

            DateTime d2 = DateTime.Now;

            int result = DateTime.Compare(d1,d2);
            if (result<0) {
                LabelTime.Text = "not Available";
            }
            else if (result >0)
            {
                LabelTime.Text = "avaialable";

            }
            


        }
    }
}