﻿using System;
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
    public partial class _default : System.Web.UI.Page
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
            String query = "Select * FROM person WHERE Role like'%" + "personnel" + "%'";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);

            dt.Columns.Add("FullName", typeof(string), "Name + ' ' + Surname");

            rbtnl_personnnel.DataTextField = "FullName";
            rbtnl_personnnel.DataValueField = "PersonID";
            rbtnl_personnnel.DataSource = dt;
            rbtnl_personnnel.DataBind();
        }

        protected void Add_Personnel_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            db.startDB();
            String query = "Select * FROM Policinic ";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_Hospitals.DataSource = dt;
            dwn_Hospitals.DataBind();
            dwn_Hospitals.Items.Insert(0, new ListItem("Select"));
            list.Visible = false;
            add_personel.Visible = true;



        }
        protected void registerbtn_Click(object sender, EventArgs e)
        {
            SqlConnection.ClearAllPools();
            if (TC.Text != "" || Name.Text != "" || LastName.Text != "" || email.Text != "" || password1.Text != "")
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
                    cmd.Parameters.AddWithValue("@gender", "erkek");
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@role", "personnel");
                    cmd.Parameters.AddWithValue("@age", "22");

                    cmd.ExecuteReader();
                    cnn.Close();

                    insertpersonnel();

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

        protected void Edit_Personnel_Click(object sender, EventArgs e)
        {
            var x = rbtnl_personnnel.SelectedValue.ToString();
            list.Visible = false;
            edit_personel.Visible = true;


            DataRow dr;
            SqlCommand cmd;
            String query = "Select *  From person   where PersonID=" + Convert.ToInt64(x);
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            Name2.Text = dr["Name"].ToString();
            lastname2.Text = dr["Surname"].ToString();
            email2.Text = dr["email"].ToString();
            tcno.Text = dr["tc_No"].ToString();
            Age.Text = dr["Age"].ToString();
            gender.Text = dr["gender"].ToString();



            query = "Select P.policinicname From personnel as A INNER JOIN Policinic AS P ON  P.PolicinicID = A.PolicinicID where A.PersonnelID=" + dr["PersonID"];
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            policinicnamenow.Text = dr["policinicname"].ToString();


            DataTable dt = new DataTable();
            query = "Select * From policinic";
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            policinic2.DataSource = dt;
            policinic2.DataBind();




        }
        protected void Save_Click(object sender, EventArgs e)
        {
            db.startDB();

            string query = "update person set tc_no=@tc_no, age=@age, name=@name, Surname=@surname, gender=@gender, email=@email where PersonID=" + rbtnl_personnnel.SelectedValue.ToString();
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);

            cmd.Parameters.AddWithValue("@tc_no", tcno.Text);
            cmd.Parameters.AddWithValue("@age", Age.Text);
            cmd.Parameters.AddWithValue("@name", Name2.Text);
            cmd.Parameters.AddWithValue("@surname", lastname2.Text);
            cmd.Parameters.AddWithValue("@gender", gender.Text);
            cmd.Parameters.AddWithValue("@email", email2.Text);
            db.Execute(cmd);

            query = "update personnel set PolicinicID=@policinicid where PersonnelID=" + rbtnl_personnnel.SelectedValue.ToString();
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@policinicid", Convert.ToInt64(policinic2.SelectedValue.ToString()));
            db.Execute(cmd);

        }


        protected void Delete_Personnel_Click(object sender, EventArgs e)
        {
            var x = rbtnl_personnnel.SelectedValue.ToString();
            db.startDB();
            SqlCommand cmd;
            string query = "Delete From person where PersonID=" + Convert.ToInt32(x.ToString());
            cmd = db.MySqlCommand(query);
            db.Execute(cmd);

            query = "Delete From personnel where PersonnelID=" + Convert.ToInt32(x.ToString());
            cmd = db.MySqlCommand(query);
            db.Execute(cmd);
            Response.Redirect("/Admin/");


        }



        protected void insertpersonnel()
        {
            SqlConnection.ClearAllPools();
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
            cnn.Open();


            DataRow dr;
            String query = "Select * from person where Tc_no = '" + TC.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.Parameters.AddWithValue("@tc_no", TC.Text.ToString());
            //SqlDataReader dr = cmd.ExecuteReader();
            dr = db.SelectData(cmd);
            var personid = dr["PersonID"];


            var policinicid = dwn_Hospitals.SelectedValue;


            query = "Insert into personnel(PersonnelID, PolicinicID) values (@personelid,@polid)";
            cmd = new SqlCommand(query, cnn);
            cmd.Parameters.AddWithValue("@personelid", Convert.ToInt64(personid));
            cmd.Parameters.AddWithValue("@polid", Convert.ToInt64(policinicid));
            lbl_Succeed.Visible = true;
            cmd.ExecuteReader();
            cnn.Close();

        }



    }
}
