using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital.Admin
{
    public partial class ListPolicinic : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FetchData();


        }

        void FetchData()
        {

            DataTable dt = new DataTable();
            String query = "Select * FROM Policinic";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);

            rbtnl_policinic.DataTextField = "PolicinicName";
            rbtnl_policinic.DataValueField = "PolicinicID";
            rbtnl_policinic.DataSource = dt;
            rbtnl_policinic.DataBind();
        }

        protected void Add_policinic_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            list.Visible = false;
            addpolicinic.Visible = true;


        }

        protected void registerbtn_Click(object sender, EventArgs e)
        {
            SqlConnection.ClearAllPools();
            if (PolicinicName.Text != "" || Address.Text != "" || Phone.Text != "")
            {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
                cnn.Open();

                string sorgu = "Insert into Policinic(PolicinicName ,Address ,Phone) values (@policinicname,@address,@phone)";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);

                try
                {
                    cmd.Parameters.AddWithValue("@policinicname", PolicinicName.Text);
                    cmd.Parameters.AddWithValue("@address", Address.Text);
                    cmd.Parameters.AddWithValue("@phone", Phone.Text);
                    cmd.ExecuteReader();
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
                        lbl_Failed.Text = ex.ToString();
                    }
                    lbl_Failed.Visible = true;
                }


            }
            lbl_Succeed.Visible = true;



        }



        protected void edit_policinic_Click(object sender, EventArgs e)
        {
            var x = rbtnl_policinic.SelectedValue.ToString();
            list.Visible = false;
            editpolicinic.Visible = true;

            DataRow dr;
            SqlCommand cmd;
            String query = "Select *  From Policinic where PolicinicID=" + Convert.ToInt32(x);
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            PolicinicName2.Text = dr["PolicinicName"].ToString();
            PolicinicPhone2.Text = dr["Phone"].ToString();
            Policinicaddress2.Text = dr["Address"].ToString();


        }


        protected void Save_Click(object sender, EventArgs e)
        {
            db.startDB();
            var x = rbtnl_policinic.SelectedValue.ToString();
            SqlCommand cmd;
            string query = "update Policinic set PolicinicName=@polname, Phone=@phone, Address=@address where PolicinicID=" + Convert.ToInt32(x);
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@polname", PolicinicName2.Text);
            cmd.Parameters.AddWithValue("@phone", PolicinicPhone2.Text);
            cmd.Parameters.AddWithValue("@address", Policinicaddress2.Text);
            db.Execute(cmd);
            lbl_Succeed2.Visible = true;

        }
        protected void delete_policinic_Click(object sender, EventArgs e)
        {

            var x = rbtnl_policinic.SelectedValue.ToString();
            db.startDB();
            SqlCommand cmd;
            string query = "Delete From Policinic where PolicinicID=" + Convert.ToInt32(x.ToString());
            cmd = db.MySqlCommand(query);
            db.Execute(cmd);

            Response.Redirect("/Admin/listPolicinic.aspx");
        }






    }
}