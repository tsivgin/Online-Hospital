using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital_Final.Patient
{
    /// <summary>
    /// 
    /// </summary>
    public partial class _default : System.Web.UI.Page
    {
        int count = 0;
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
                string query = "Select DE.departmentname as Department, P.policinicname as Polinic, PE.name as DoctorName,CONVERT(NVARCHAR, A.date, 106) AS Date, T.WorkHour as Time FROM appointments as A INNER JOIN department as DE ON A.DepartmentID =  DE.DepartmentID INNER JOIN Person AS PE ON PE.tc_no = A.DoctorID  INNER JOIN work_hours AS T ON T.type = A.type  INNER JOIN Policinic AS P ON P.PolicinicID = A.PolicinicID WHERE A.change = '" + true + "'";
                SqlCommand cmd = db.MySqlCommand(query);
                DataTable dt = db.SelectDataTable(cmd);
                if (dt != null)
                {
                    changeappointment.DataSource = dt;
                    changeappointment.DataBind();
                    changeappointment.Visible = true;
                    confirm.Visible = true;
                    Info.Visible = true;
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void confirm_Click(object sender, EventArgs e)
        {
            db.startDB();
            string query = "update appointments set change=@change where patientID=" + Convert.ToInt64(Session["tc_no"].ToString());
            SqlCommand cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@change", false);
            db.Execute(cmd);
            lbl_Succeed.Visible = true;
            panel.Visible = false;

        }
    }
}