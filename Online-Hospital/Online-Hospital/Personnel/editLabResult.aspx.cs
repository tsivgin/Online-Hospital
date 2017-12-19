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

        }

        protected void Savebtn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;

            db.startDB();
            string query = "update LabResult set LabResult=@labresult, DepartmentID=@depid where LabID=" + rbtn_LabResults.SelectedValue;
            cmd = db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@labresult", newlabresult.Text);
            cmd.Parameters.AddWithValue("@depid", newdepartment.SelectedValue);
            db.Execute(cmd);
            lbl_Succeed.Visible = true;
            Response.Redirect("/Personnel/EditlabResult.aspx");
        }



        protected void Control2_Click(object sender, EventArgs e)
        {
            var labid = rbtn_LabResults.SelectedValue;
            info.Visible = true;
            rbtn_LabResults.Visible = false;
            Control2.Visible = false;

            string query = "Select * from department";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            DataTable dt;
            dt = db.SelectDataTable(cmd);
            newdepartment.DataValueField = "DepartmentID";
            newdepartment.DataTextField = "DepartmentName";
            newdepartment.DataSource = dt;
            newdepartment.DataBind();

            query = "Select A.LabResult, D.departmentname from LabResult as A INNER JOIN  Department as D ON D.departmentID=A.departmentID where LabId=" + labid;
            cmd = db.MySqlCommand(query);
            DataRow dr;
            dr = db.SelectData(cmd);

            nowdepartment.Text = dr["departmentname"].ToString();
            nowlabresult.Text = dr["LabResult"].ToString();

        }

        protected void Control_Click(object sender, EventArgs e)
        {
            rbtn_LabResults.Visible = true;
            tckontrol.Visible = false;
            Control.Visible = false;
            Control2.Visible = true;

            var tc = TC.Text;
            string query = "Select * from person where tc_no=" + Convert.ToInt64(tc);
            db.startDB();
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            DataRow dr;
            dr = db.SelectData(cmd);
            var personid = dr["PersonID"];
            var name = dr["Name"].ToString() + "   " + dr["Surname"].ToString();
            PatientName.Visible = true;
            PatientName.Text = name;

            query = "Select A.LabID, A.LabResult, D.departmentname from LabResult as A INNER JOIN Department as D ON D.departmentID=A.departmentID where pid=" + personid;
            cmd = db.MySqlCommand(query);
            DataTable dt;
            dt = db.SelectDataTable(cmd);
            dt.Columns.Add("FullName", typeof(string), "LabResult + ' - ' + departmentname ");
            rbtn_LabResults.DataTextField = "FullName";
            rbtn_LabResults.DataValueField = "LabId";
            rbtn_LabResults.DataSource = dt;
            rbtn_LabResults.DataBind();
        }
    }
}