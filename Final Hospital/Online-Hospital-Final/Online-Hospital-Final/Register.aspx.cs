using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital_Final
{
    /// <summary>
    /// Save of authenticated
    /// </summary>
    public partial class Register : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Gender.Items.Add("Male");
                Gender.Items.Add("Female");
                Gender.DataBind();

                for (int i = 1; i < 32; i++)
                {
                    Day.Items.Add(i.ToString());
                }
                for (int j = 1; j < 13; j++)
                {
                    Month.Items.Add(j.ToString());
                }
                for (int k = 1930; k < DateTime.Today.Year; k++)
                {
                    Year.Items.Add(k.ToString());
                }
            }
        }
        /// <summary>
        /// Save user
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void registerbtn_Click(object sender, EventArgs e)
        {
            SqlConnection.ClearAllPools();
            if (TC.Text.Length != 11)
            {
                lbl_control.Text = "11 haneden küçük veya büyük olamaz";
                lbl_control.Visible = true;
            }
            else
                if (TC.Text != "" || Name.Text != "" || LastName.Text != "" || email.Text != "" || password1.Text != "" || password2.Text != "")
                {
                    string date = Year.SelectedItem.ToString() + "/" + Month.SelectedItem.ToString() + "/" + Day.SelectedItem.ToString();
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
                        cmd.Parameters.AddWithValue("@gender", Gender.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@email", email.Text);
                        cmd.Parameters.AddWithValue("@role", "patient");
                        cmd.Parameters.AddWithValue("@age", date);
                        cmd.ExecuteReader();
                        lbl_Succeed.Visible = true;
                        db.startDB();
                        sorgu = "insert into patient (PatientID) values (@pid)";
                        cmd = db.MySqlCommand(sorgu);
                        cmd.Parameters.AddWithValue("@pid", TC.Text);
                        db.Execute(cmd);
                        cnn.Close();


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
                            lbl_Failed.Text = "Tc numarası sisteme daha önce kayıt olunmuş bir TC";
                        }
                        lbl_Failed.Visible = true;
                    }


                }


        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {

            //DateTime date = DateTime.Today;
            //DateTime bookDate = Calendar.SelectedDate;

            //int yas = date.Year - bookDate.Year;
            //if (bookDate > date)
            //{
            //    ltrl_SelectedDate.Text = "You can not pick date . Please change the date.";
            //    ltrl_SelectDate.Visible = true;
            //    //btn_Continue.Enabled = false;
            //    registerbtn.Enabled = false;
            //}
            //else
            //{
            //    ltrl_SelectedDate.Visible = false;
            //    registerbtn.Enabled = true;

            //}
        }




    }
}