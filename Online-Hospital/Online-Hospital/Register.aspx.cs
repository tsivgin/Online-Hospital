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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerbtn_Click(object sender, EventArgs e)
        {
            SqlConnection.ClearAllPools();
            if (TC.Text != "" || Name.Text != "" || LastName.Text != "" || email.Text != "" || password1.Text != "" || password2.Text != "")
            {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
                cnn.Open();

                string sorgu = "Insert into person(tc_no,password,Age,Name,Surname,gender,Email,Role) values (@tc_no,@password,@age,@name,@surname,@gender,@email, @role)";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);

                try
                {
                    cmd.Parameters.AddWithValue("@tc_no", TC.Text);
                    cmd.Parameters.AddWithValue("@password", password1.Text);
                    cmd.Parameters.AddWithValue("@name", Name.Text);
                    cmd.Parameters.AddWithValue("@surname", LastName.Text);
                    cmd.Parameters.AddWithValue("@gender", Gender.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@role", "patient");
                    cmd.Parameters.AddWithValue("@age", "22");

                    cmd.ExecuteReader();
                    cnn.Close();
                    lbl_Succeed.Visible = true;
                }
                catch (Exception ex)
                {
                    if (ex is NullReferenceException)
                    {
                        lbl_Failed.Text = "Lütfen boş alanların tümünü doldurunuz.";
                    }
                    else if (ex is FormatException)
                    {
                        lbl_Failed.Text = "Lütfen cevabı istenilen formatta ve doğru yazdığınızdan emin olunuz.";
                    }
                    else
                    {
                        lbl_Failed.Text = ex.ToString();
                    }
                    lbl_Failed.Visible = true;
                }


            }


        }






    }
}