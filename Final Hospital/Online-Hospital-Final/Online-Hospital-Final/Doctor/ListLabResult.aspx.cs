using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Online_Hospital.Doctor
{
    /// <summary>
    /// 
    /// </summary>
    public partial class ListLabResult : System.Web.UI.Page
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
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void List_Click(object sender, EventArgs e)
        {
            string query = "Select A.patientID as PatientName, A.LabResult, Dep.Departmentname as DepartmentName from labresult as A  Inner JOIN department as Dep ON A.DepartmentID=Dep.departmentID  where patientID = " + TC.Text;
            SqlCommand cmd = db.MySqlCommand(query);
            DataTable dt = db.SelectDataTable(cmd);
            labresult.DataSource = dt;
            labresult.DataBind();
            calender.Visible = true;
            panel.Visible = false;


        }
    }
}