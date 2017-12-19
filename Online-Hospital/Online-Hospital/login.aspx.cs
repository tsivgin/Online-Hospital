using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Online_Hospital
{
    public partial class login : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
             
            object user = Session["tc_no"];
            if (user != null)
            {

               
                //Response.Redirect("about.aspx");
                pnlgiris.Visible = false;
                pnluser.Visible = true;
                lblusername.Text = user.ToString();
            }
            else
            {
                pnlgiris.Visible = true;
                pnluser.Visible = false;
            }
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
           
            SqlConnection.ClearAllPools();
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);             
            cnn.Open();     
            string sorgu = "Select * From person where Tc_no=@tc_no AND password=@password";
                   
            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cmd.Parameters.AddWithValue("@tc_no", TC.Text);
            cmd.Parameters.AddWithValue("@password", Password.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                
                Session.Timeout = 300;
                Session.Add("tc_no", dr["Tc_no"].ToString());
                
                lblusername.Text = dr["role"].ToString().Trim();
                if (lblusername.Text == "admin")
                {
                    Response.Redirect("Admin/default.aspx");
                }
                Response.Redirect("Patient/default.aspx");
               
            } 
            cnn.Close();

            
           
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }

       
    }
}