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
    public partial class EnterLabResult : System.Web.UI.Page
    {
        Database db = new Database();
        /// <summary>
        /// Is not post back load fetch
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fetch();
            }

        }        
        /// <summary>
        /// Loading Department
        /// </summary>
        protected void fetch()
        {

            if (Session["tc_no"] != null)
            {
                SqlCommand cmd;
                db.startDB();
                string query = "Select PolicinicID from personnel where personnelID=" + Convert.ToInt64(Session["tc_no"].ToString());
                cmd = db.MySqlCommand(query);
                DataRow dr = db.SelectData(cmd);
                query = "Select * from department where policinicID=" + Convert.ToInt64(dr["PolicinicID"].ToString());
                cmd = db.MySqlCommand(query);
                DataTable dt;
                dt = db.SelectDataTable(cmd);
                departmentname.DataTextField = "DepartmentName";
                departmentname.DataValueField = "DepartmentID";
                departmentname.DataSource = dt;
                departmentname.DataBind();

            }
        }
        /// <summary>
        /// Saves the lab result.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void savebtn_Click(object sender, EventArgs e)
        {

            
            SqlCommand cmd;
            db.startDB();
            

            string query = "Insert into labresult(patientID,LabResult,DepartmentID) values (@pid,@labresult,@depid)";
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@pid", Convert.ToInt64(TC.Text));
            cmd.Parameters.AddWithValue("@labresult", enterlabresult.Text);
            cmd.Parameters.AddWithValue("@depid", departmentname.SelectedValue);
            db.Execute(cmd);
            lbl_Succeed.Visible = true;



        }
    }
}