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
    /// <summary>
    /// List all doctors
    /// </summary>
    public partial class ListDoctor : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// If is not postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FetchData();


        }
        /// <summary>
        /// Load Doctor information
        /// </summary>
        void FetchData()
        {

            DataTable dt = new DataTable();
            String query = "Select * FROM person WHERE Role like'%" + "doctor" + "%'";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);

            if (dt != null)
            {
                dt.Columns.Add("FullName", typeof(string), "Name + ' ' + Surname");

                rbtnl_doctor.DataTextField = "FullName";
                rbtnl_doctor.DataValueField = "tc_no";
                rbtnl_doctor.DataSource = dt;
                rbtnl_doctor.DataBind();
            }
        }

        /// <summary>
        /// go to add doctor page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Add_doctor_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            db.startDB();
            String query = "Select * FROM Department ";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_Hospitals.DataSource = dt;
            dwn_Hospitals.DataBind();
            dwn_Hospitals.Items.Insert(0, new ListItem("Select"));
            list.Visible = false;
            add_doctorp.Visible = true;

            gender_add.Items.Add("Female");
            gender_add.Items.Add("Male");


        }
        /// <summary>
        /// register a new doctor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void registerbtn_Click(object sender, EventArgs e)
        {

            if (TC.Text.Length != 11)
            {
                lbl_control.Text = "11 haneden küçük veya büyük olamaz";
                lbl_control.Visible = true;
            }
            else
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
                    cmd.Parameters.AddWithValue("@gender", gender_add.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@role", "doctor");
                    cmd.Parameters.AddWithValue("@age", Calendar.SelectedDate.ToString("yyyy-MM-dd"));

                    cmd.ExecuteReader();
                    cnn.Close();

                    insertdoctor();

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

        /// <summary>
        /// register doctorTable
        /// </summary>
        protected void insertdoctor()
        {
            SqlConnection.ClearAllPools();
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
            cnn.Open();
            DataRow dr;

            var departmentid = dwn_Hospitals.SelectedValue;
            String query = "Select * from department where DepartmentID=" + Convert.ToInt32(departmentid.ToString());
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            var policinicid = dr["PolicinicID"];

            query = "Insert into doctor(DoctorID, DepartmentID, PolicinicID) values (@doctorid,@departmentid,@polid)";
            cmd = new SqlCommand(query, cnn);
            cmd.Parameters.AddWithValue("@doctorid", Convert.ToInt64(TC.Text));
            cmd.Parameters.AddWithValue("@departmentid", Convert.ToInt64(departmentid));
            cmd.Parameters.AddWithValue("@polid", Convert.ToInt64(policinicid));
            lbl_Succeed.Visible = true;
            cmd.ExecuteReader();
            cnn.Close();

        }


        /// <summary>
        /// go to edit doctor page of selection doctor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Edit_doctor_Click(object sender, EventArgs e)
        {

            if (rbtnl_doctor.SelectedItem != null)
            {
                var tc_no = rbtnl_doctor.SelectedValue.ToString();
                list.Visible = false;
                edit_doctor2.Visible = true;

                DataRow dr;
                SqlCommand cmd;
                String query = "Select *  From person where tc_no=" + Convert.ToInt64(tc_no);
                cmd = db.MySqlCommand(query);
                dr = db.SelectData(cmd);
                Name2.Text = dr["Name"].ToString();
                lastname2.Text = dr["Surname"].ToString();
                email2.Text = dr["email"].ToString();
                //tcno.Text = dr["tc_No"].ToString();
                gender_edit.Items.Add(dr["gender"].ToString());
                if (dr["gender"].ToString() == "Male")
                {
                    gender_edit.Items.Add("Female");
                }
                else
                    gender_edit.Items.Add("Male");
                query = "Select DepartmentID From Doctor where DoctorID=" + dr["tc_no"];
                cmd = db.MySqlCommand(query);
                dr = db.SelectData(cmd);
                query = "Select DepartmentName from department where DepartmentID=" + dr["DepartmentID"];
                cmd = db.MySqlCommand(query);
                dr = db.SelectData(cmd);
                departmentName.Text = dr["DepartmentName"].ToString();

                DataTable dt = new DataTable();
                query = "Select * From department";
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                department.DataSource = dt;
                department.DataBind();
            }
        }

        /// <summary>
        /// save new information of doctor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Save_Click(object sender, EventArgs e)
        {
            db.startDB();
            //age=@age,tc_no=@tc_no,
            string query = "update person set   name=@name, Surname=@surname, gender=@gender, email=@email where tc_no=" + rbtnl_doctor.SelectedValue.ToString();
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);

            //cmd.Parameters.AddWithValue("@tc_no", tcno.Text);
            //cmd.Parameters.AddWithValue("@age", Age.Text);
            cmd.Parameters.AddWithValue("@name", Name2.Text);
            cmd.Parameters.AddWithValue("@surname", lastname2.Text);
            cmd.Parameters.AddWithValue("@gender", gender_edit.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@email", email2.Text);
            db.Execute(cmd);

            query = "update doctor set DepartmentID=@departmentid where DoctorID=" + rbtnl_doctor.SelectedValue.ToString();
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@departmentid", Convert.ToInt64(department.SelectedValue.ToString()));
            db.Execute(cmd);
            Response.Redirect("/Admin/listDoctor.aspx");

        }
        /// <summary>
        /// delete of select doctor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Delete_doctor_Click(object sender, EventArgs e)
        {
            if (rbtn1_doctor.SelectedItem != null)
            {
                var x = rbtnl_doctor.SelectedValue.ToString();
                db.startDB();
                SqlCommand cmd;
                string query = "Delete From person where tc_no=" + Convert.ToInt64(x.ToString());
                cmd = db.MySqlCommand(query);
                db.Execute(cmd);

                query = "Delete From doctor where DoctorID=" + Convert.ToInt64(x.ToString());
                cmd = db.MySqlCommand(query);
                db.Execute(cmd);
                Response.Redirect("/Admin/listDoctor.aspx");
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = DateTime.Today;
            DateTime bookDate = Calendar.SelectedDate;

            int yas = date.Year - bookDate.Year;
            if (bookDate > date)
            {
                ltrl_SelectedDate.Text = "You can not pick date . Please change the date.";
                ltrl_SelectDate.Visible = true;
                //btn_Continue.Enabled = false;
                registerbtn.Enabled = false;
            }
            else
            {
                ltrl_SelectedDate.Visible = false;
                registerbtn.Enabled = true;

            }
        }




    }
}