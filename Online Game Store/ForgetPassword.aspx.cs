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
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["c_email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        String answerConfirm, questionConfirm;
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            string check = "select count(*) from customer where customer_email='" + TextBoxFEmail.Text + "'";
            SqlCommand com = new SqlCommand(check, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                TextBoxA.Visible = true;
                LabelSC.Visible = true;
                LabelSCQ.Visible = true;
                ButtonNext.Visible = true;
                LabelFQuestionError.Visible = true;
                RequiredFieldValidator2.Visible = true;
                string question = "select customer_s_question from customer where customer_email='" + TextBoxFEmail.Text + "'";
                SqlCommand com2 = new SqlCommand(question, con);
                questionConfirm = com2.ExecuteScalar().ToString();
                LabelSCQ.Text = questionConfirm;

                
                //
                //Session["c_email"] = TextBoxLEmail.Text;
                //Response.Redirect("Default.aspx");
            }
            else {
                LabelFEmailError.Text = "*Email Address Not Matched";
            }
            con.Close();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
            con.Open();
            string answer = "select customer_s_answer from customer where customer_email='" + TextBoxFEmail.Text + "'";
            SqlCommand com3 = new SqlCommand(answer, con);
            answerConfirm = com3.ExecuteScalar().ToString();
            if (answerConfirm==TextBoxA.Text)
            {
                Session["r_pass_email"] = TextBoxFEmail.Text;
                Response.Redirect("ResetPassword.aspx");
            }
            else {
                LabelFQuestionError.Text = "Incorrect Answer!!!";
            }
            con.Close();
        }
    }
}