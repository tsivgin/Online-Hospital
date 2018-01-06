using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital.Personnel
{
    /// <summary>
    /// 
    /// </summary>
    public partial class editappointment : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// If all information is correct save
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Savebtn_Click(object sender, EventArgs e)
        {
            var selectedID = rbtnl_AvailableTimes.SelectedValue.ToString(); ;
            if (selectedID.Equals(""))
                lbl_TimeViolation.Visible = true;
            else
            {
                db.startDB();
                SqlCommand cmd;
                string query = "update appointments set Type=@type, Date=@date,change=@change where AppointmentID=" + appointments.SelectedValue;
                cmd = db.MySqlCommand(query);
                cmd.Parameters.AddWithValue("@type", Int32.Parse(selectedID));
                cmd.Parameters.AddWithValue("@date", ltrl_SelectedDate.Text.ToString());
                cmd.Parameters.AddWithValue("@change", true);
                db.Execute(cmd);
                lbl_Succeed.Visible = true;
            }



        }
        DataTable dt;
        /// <summary>
        /// If tc_no is saved go select appointment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Control_Click(object sender, EventArgs e)
        {
            var tc = TC.Text;
            string query ;
            db.startDB();
            SqlCommand cmd;

            query = "Select PolicinicID from personnel where personnelID=" + Convert.ToInt64(Session["tc_no"].ToString());
            cmd = db.MySqlCommand(query);
            DataRow dr = db.SelectData(cmd);
            var policinicid = Convert.ToInt64(dr["policinicID"].ToString());



            query = "Select A.AppointmentID, work.WorkHour, d.departmentname, doc.Name, doc.Surname, CONVERT(NVARCHAR, A.date, 106) AS Date from appointments as A INNER JOIN Department as d ON d.departmentID=A.DepartmentID INNER JOIN work_hours as work ON work.type=A.type INNER JOIN person as doc ON doc.tc_no=A.DoctorID  where patientID='" + Convert.ToInt64(tc) + "' AND A.PolicinicID='" + Convert.ToInt64(policinicid.ToString()) + "'";
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dt.Columns.Add("FullName", typeof(string), "WorkHour + ' - ' + date+ ' - '  + departmentname + ' - ' + Name + ' ' + Surname");
            appointments.DataSource = dt;
            appointments.DataTextField = "FullName";
            appointments.DataValueField = "AppointmentID";
            appointments.DataBind();
            tckontrol.Visible = false;
            Control.Visible = false;
            Control2.Visible = true;
        }
        /// <summary>
        /// Select one appointment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Control2_Click(object sender, EventArgs e)
        {
            var x = appointments.SelectedValue;
            db.startDB();
            string query = "Select work.WorkHour,CONVERT(NVARCHAR, A.date, 106) AS Date   from appointments as A INNER JOIN Work_Hours as work ON work.type= A.type where A.appointmentID=" + Convert.ToInt64(x);
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            DataRow dr;
            dr = db.SelectData(cmd);
            info.Visible = true;
            nowtime.Text = dr["Workhour"].ToString();
            nowdate.Text = dr["date"].ToString();
            appointments.Visible = false;
            Control2.Visible = false;

            Calendar.Visible = true;
            ltlrl_Calendar.Visible = true;
            ltlrl_Calendar.Text = "- Pick a date -";

        }
        /// <summary>
        /// Select a new available date 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            string query = "select doctorID from appointments where appointmentID =" + appointments.SelectedValue;
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            DataRow drr;
            drr = db.SelectData(cmd);
            DateTime date = DateTime.Today;
            DateTime bookDate = Calendar.SelectedDate;
            var DoctorID = drr["doctorID"];

            if (bookDate < date)
            {
                ltrl_SelectedDate.Text = "You can not pick date which is earlier then today's date. Please change the date.";
                ltrl_SelectDate.Visible = true;
            }
            else
            {

                ltrl_SelectDate.Text = "Selected Date:";
                ltrl_SelectedDate.Text = Calendar.SelectedDate.ToString("yyyy/MM/dd");
                ltrl_SelectDate.Visible = true;
                ltrl_SelectedDate.Visible = true;

                DataTable dt = new DataTable();
                query = "Select * From work_hours WHERE Type NOT IN(SELECT Type FROM Appointments WHERE DATE='" + Calendar.SelectedDate.ToString("yyyy-MM-dd") + "' AND DoctorID='" + DoctorID + "')";

                db.startDB();
                cmd = db.MySqlCommand(query);
                SqlDataReader dr = cmd.ExecuteReader();
                ltrl_SelectTime.Text = "- Select a Time - (Showing only available time intervals.) ";
                ltrl_SelectTime.Visible = true;
                rbtnl_AvailableTimes.DataSource = dr;
                rbtnl_AvailableTimes.DataBind();


            }



        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {

            e.Day.IsSelectable = !e.Day.IsWeekend;
        }
    }
}