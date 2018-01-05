using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Online_Hospital_Final.Doctor
{

    /// <summary>
    /// 
    /// </summary>
    public partial class listappointments : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tc_no"] != null)
            {
                db.startDB();
                string query = "Select DE.departmentname as Department, P.policinicname as Policinic, PE.name as PatientName, Convert(NVARCHAR,A.date,106) as Date, T.WorkHour as Time From appointments as A  INNER JOIN department as DE ON A.DepartmentID = DE.DepartmentID INNER JOIN Person As PE On PE.tc_no=A.PatientID INNER JOIN work_hours as T ON T.type= A.type INNER JOIN Policinic AS P ON P.policinicID = A.PolicinicID where A.doctorID = " + Convert.ToInt64(Session["tc_no"].ToString());
                SqlCommand cmd;
                cmd = db.MySqlCommand(query);
                DataTable dt = db.SelectDataTable(cmd);
                listappointment.DataSource = dt;
                listappointment.DataBind();
                //List.Visible = true;
                appointments.Visible = true;
            }
        }
    }
}