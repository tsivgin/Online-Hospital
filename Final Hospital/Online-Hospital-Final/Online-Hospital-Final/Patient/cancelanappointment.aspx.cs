using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;

namespace Online_Hospital.Patient
{
    /// <summary>
    /// Cancel an appointment
    /// </summary>
    public partial class cancelanappointment : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// If is not post back load fetchdata
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fetchdata();

        }

        /// <summary>
        /// load appointments of patient
        /// </summary>
        void fetchdata()
        {
            db.startDB();
            DataTable dt;
            SqlCommand cmd;
            var user = Session["tc_no"];
            if (user != null)
            {
                //string query = "Select PersonID FROM person WHERE tc_no like '%" + Convert.ToInt64(user.ToString()) + "%'";
                //cmd = db.MySqlCommand(query);
                //dt = db.SelectDataTable(cmd);
                //var x = dt.Rows[0][0].ToString();

                string date = DateTime.Today.ToString("yyyy/mm/dd");
                string query = "Select  A.appointmentID,DE.departmentname as Department, P.policinicname as Polinic, PE.name as DoctorName,CONVERT(NVARCHAR, A.date, 106) AS Date, T.WorkHour as Time FROM appointments as A INNER JOIN department as DE ON A.DepartmentID =  DE.DepartmentID INNER JOIN Person AS PE ON PE.tc_no = A.DoctorID  INNER JOIN work_hours AS T ON T.type = A.type  INNER JOIN Policinic AS P ON P.PolicinicID = A.PolicinicID WHERE A.PatientID = '" + Convert.ToInt64(user.ToString())+ "' AND A.Date>='" + "2018/01/04" + "'";

                cmd = db.MySqlCommand(query);

                dt = db.SelectDataTable(cmd);
                if (dt != null)
                {
                    dt.Columns.Add("FullName", typeof(string), "Department + '- ' + Polinic + ' - '  + DoctorName  + ' - ' + Date +  ' -  '  +  Time");
                    rbtnl_cancelapp.DataSource = dt;
                    rbtnl_cancelapp.DataBind();
                    cancelapp.Visible = true;

                }
                else
                {
                    app.Visible = true;
                    app.Text = "There is no appointment";
                }
            }

        }

        /// <summary>
        /// delete of selection appointment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void deletebtn_Click(object sender, EventArgs e)
        {
            var appid = rbtnl_cancelapp.SelectedValue.ToString();
            if (appid != null)
            {

                db.startDB();
                SqlCommand cmd;
                string query = "Delete From appointments where AppointmentID=" + Convert.ToInt32(appid.ToString());
                cmd = db.MySqlCommand(query);
                db.Execute(cmd);

                Response.Redirect("/Patient/cancelanappointment.aspx");
            }
        }
    }
}