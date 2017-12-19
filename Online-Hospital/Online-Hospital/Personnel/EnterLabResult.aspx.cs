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
    public partial class EnterLabResult : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fetch();
            }

        }
        protected void fetch()
        {




            SqlCommand cmd;
            db.startDB();
            string query = "Select * from department";
            cmd = db.MySqlCommand(query);
            DataTable dt;
            dt = db.SelectDataTable(cmd);
            departmentname.DataTextField = "DepartmentName";
            departmentname.DataValueField = "DepartmentID";
            departmentname.DataSource = dt;
            departmentname.DataBind();


        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            var tc = TC.Text;
            SqlCommand cmd;
            db.startDB();
            string query = "select personID from person where tc_no=" + tc.ToString();
            cmd = db.MySqlCommand(query);
            DataRow dr;
            dr = db.SelectData(cmd);
            var personid = dr["PersonID"];

            query = "Insert into labresult(pid,LabResult,DepartmentID) values (@pid,@labresult,@depid)";
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@pid", personid);
            cmd.Parameters.AddWithValue("@labresult", enterlabresult.Text);
            cmd.Parameters.AddWithValue("@depid", departmentname.SelectedValue);
            db.Execute(cmd);
            lbl_Succeed.Visible = true;



        }
    }
}