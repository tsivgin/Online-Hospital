using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital.Patient
{
    /// <summary>
    /// Book new appointment
    /// </summary>
    public partial class BookAppointment : System.Web.UI.Page
    {
        Database db = new Database();
        String DoctorID;
        /// <summary>
        /// if is not post back
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PopulateData();
            
        }
        /// <summary>
        /// load policinic
        /// </summary>
        public void PopulateData()
        {
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
            cnn.Open();
            String query = "Select * FROM Policinic ";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_policinic.DataSource = dt;
            dwn_policinic.DataBind();
            dwn_policinic.Items.Insert(0, new ListItem("Select"));



        }

        /// <summary>
        /// load department of selection policinic
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dwn_policinic_SelectedIndexChanged(object sender, EventArgs e)
        {
            //dwn_policinic.Enabled = false;
            ltrl_SelectDepartment.Text = "- Department -";
            ltrl_SelectDepartment.Visible = true;
            dwn_Departments.Visible = true;


            DataTable dt = new DataTable();
            String query = "Select * FROM Department WHERE PolicinicID like'%" + Int32.Parse(dwn_policinic.SelectedValue.ToString()) + "%'";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_Departments.DataSource = dt;
            dwn_Departments.DataBind();
            dwn_Departments.Items.Insert(0, new ListItem("Select"));
            Page_Load(null, null);

        }




        //Select Policinic
        //protected void dwn_policinic_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    dwn_policinic.Enabled = false;
        //    ltrl_SelectDepartment.Text = "- Department -";
        //    ltrl_SelectDepartment.Visible = true;
        //    dwn_Departments.Visible = true;

        //    DataTable dt = new DataTable();
        //    String query = "Select * FROM Department WHERE PolicinicID like'%" + Int32.Parse(dwn_policinic.SelectedValue.ToString()) + "%'";
        //    SqlCommand cmd;
        //    cmd = db.MySqlCommand(query);
        //    dt = db.SelectDataTable(cmd);
        //    dwn_Departments.DataSource = dt;
        //    dwn_Departments.DataBind();
        //    dwn_Departments.Items.Insert(0, new ListItem("Select"));


        //}

        /// <summary>
        /// load doctor of selection department
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dwn_Departments_SelectedIndexChanged(object sender, EventArgs e)
        {

            //dwn_Departments.Enabled = false;
            ltrl_SelectDoctor.Text = "- Doctor -";
            ltrl_SelectDoctor.Visible = true;
            dwn_Doctors.Visible = true;
            DataTable dt = new DataTable();
            String query = "Select * FROM person WHERE tc_no IN(Select DoctorID FROM doctor where PolicinicID IN(Select PolicinicID FROM policinic WHERE PolicinicName='" + dwn_policinic.SelectedItem.Text.ToString() + "' AND DepartmentID IN(Select DepartmentID FROM department where DepartmentName='" + dwn_Departments.SelectedItem.Text.ToString() + "')))";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_Doctors.DataSource = dt;
            dwn_Doctors.DataBind();
            dwn_Doctors.Items.Insert(0, new ListItem("Select"));


        }

        /// <summary>
        /// load calender
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dwn_Doctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calendar.Visible = true;
            ltlrl_Calendar.Visible = true;
            ltlrl_Calendar.Text = "- Pick a date -";
            //dwn_Doctors.Enabled = false;

        }

        /// <summary>
        /// load available work hours of doctor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = DateTime.Today;
            DateTime bookDate = Calendar.SelectedDate;
            DoctorID = dwn_Doctors.SelectedValue.ToString();
            String query = "Select CONVERT(NVARCHAR, workdays, 110) AS Date from Doctor where DoctorID=" +  dwn_Doctors.SelectedValue.ToString();
            db.startDB();
            SqlCommand cmd = db.MySqlCommand(query);
            DataRow datedr = db.SelectData(cmd);
            string bookdatecontrol = bookDate.ToString("MM-dd-yyyy");

            if (bookDate < date)
            {
                ltrl_SelectedDate.Text = "You can not pick date which is earlier then today's date. Please change the date.";
                ltrl_SelectDate.Visible = true;
                rbtnl_AvailableTimes.Visible = false;
                //btn_Continue.Enabled = false;
            }
            else if (bookdatecontrol.Equals(datedr["Date"]))
            {
                ltrl_SelectedDate.Text = "You can not pick date which is doctor is not working";
                ltrl_SelectedDate.Visible = true;
                rbtnl_AvailableTimes.Visible = false;
            
            }
            else
            {
                //btn_Continue.Enabled = true;
                ltrl_SelectDate.Text = "Selected Date:";
                ltrl_SelectedDate.Text = Calendar.SelectedDate.ToString("yyyy/MM/dd");
                ltrl_SelectDate.Visible = true;
                ltrl_SelectedDate.Visible = true;
                rbtnl_AvailableTimes.Visible = true;

                DataTable dt = new DataTable();
                 query = "Select * From work_hours WHERE Type NOT IN(SELECT Type FROM Appointments WHERE DATE='" + Calendar.SelectedDate.ToString("yyyy-MM-dd") + "' AND DoctorID='" + DoctorID + "')";
                
                cmd = db.MySqlCommand(query);
                SqlDataReader dr = cmd.ExecuteReader();
                ltrl_SelectTime.Text = "- Select a Time - (Showing only available time intervals.) ";
                ltrl_SelectTime.Visible = true;
                rbtnl_AvailableTimes.DataSource = dr;
                rbtnl_AvailableTimes.DataBind();
                //btn_Continue.Text = "Continue";
                //btn_Continue.BackColor = System.Drawing.Color.Gray;
                btn_Reset.Visible = true;
                btn_Confirm.Text = "I confirm that I have entered all the information above";
                btn_Confirm.Visible = true;
                btn_Confirm.BackColor = System.Drawing.Color.MediumSeaGreen;
                btn_Reset.BackColor = System.Drawing.Color.OrangeRed;
                //btn_Continue.Enabled = false;
            }
        }

        /// <summary>
        /// reset page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");

        }

        /// <summary>
        /// Save appointment is correct
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Confirm_Click(object sender, EventArgs e)
        {

            object tc_no = Session["tc_no"];
            string selectedID = "";

            selectedID = rbtnl_AvailableTimes.SelectedValue.ToString(); ;
            if (selectedID.Equals(""))
                lbl_TimeViolation.Visible = true;
            else
            {
                db.startDB();
                SqlCommand cmd2;
                DataTable dt = new DataTable();
                var personid = dwn_Doctors.SelectedValue.ToString();
                string query2 = "SELECT * From doctor WHERE DoctorID like'%" + personid + "%'";
                cmd2 = db.MySqlCommand(query2);
                dt = db.SelectDataTable(cmd2);
                var x = dt.Rows[0][0];

                lbl_TimeViolation.Visible = false;
                string date = ltrl_SelectedDate.Text.ToString();
                SqlCommand cmd;
                string query = "INSERT INTO appointments(PatientID,DepartmentID,PolicinicID,DoctorID,Date,isOk,Type,change) VALUES (@param1,@param2,@param3,@param4,@param5,@param6,@param7,@param8)";
                cmd = db.MySqlCommand(query);

                cmd.Parameters.AddWithValue("@param1", Convert.ToInt64(tc_no.ToString()));
                cmd.Parameters.AddWithValue("@param2", Convert.ToInt64(dwn_Departments.SelectedValue.ToString()));
                cmd.Parameters.AddWithValue("@param3", Convert.ToInt64(dwn_policinic.SelectedValue.ToString()));

                cmd.Parameters.AddWithValue("@param4", Convert.ToInt64(x.ToString()));
                cmd.Parameters.AddWithValue("@param5", ltrl_SelectedDate.Text.ToString());
                cmd.Parameters.AddWithValue("@param7", Convert.ToInt64(selectedID));
                cmd.Parameters.AddWithValue("@param6", true);
                cmd.Parameters.AddWithValue("@param8", false);

                bool result = db.Execute(cmd);
                if (result)
                {
                    Response.Redirect("listappointment.aspx");
                }
                else
                {
                    lbl_TimeViolation.Text = "Something went wrong";
                    lbl_TimeViolation.Visible = true;
                }
            }
        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {

        }

        protected void Calendar_DayRender1(object sender, DayRenderEventArgs e)
        {
            e.Day.IsSelectable = !e.Day.IsWeekend;
           
        }


    }
}