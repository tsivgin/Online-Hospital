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
    public partial class cancelappointment : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fetchdata();

        }

        void fetchdata()
        {
            db.startDB();
            DataTable dt;
            SqlCommand cmd;
            var user = Session["tc_no"];
            if (user != null)
            {
                string query = "Select PersonID FROM person WHERE tc_no like '%" + Convert.ToInt64(user.ToString()) + "%'";
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                var x = dt.Rows[0][0].ToString();

                query = "Select  A.appID,DE.departmentname as Department, P.policinicname as Polinic  , PE.name as DoctorName,CONVERT(NVARCHAR, A.date, 106) AS Date, T.WorkHour as Time FROM appointments as A INNER JOIN department as DE ON A.DepartmentID =  DE.DepartmentID INNER JOIN Person AS PE ON PE.personID = A.DoctorID  INNER JOIN work_hours AS T ON T.type = A.type  INNER JOIN Policinic AS P ON P.PolicinicID = A.PolicinicID WHERE A.PatientID = " + Convert.ToInt32(x);

                cmd = db.MySqlCommand(query);

                dt = db.SelectDataTable(cmd);
                dt.Columns.Add("FullName", typeof(string), "Department + '- ' + Polinic + ' - '  + DoctorName  + ' - ' + Date +  ' -  '  +  Time");
                rbtnl_cancelapp.DataSource = dt;
                rbtnl_cancelapp.DataBind();
            }

        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            var appid = rbtnl_cancelapp.SelectedValue.ToString();
            db.startDB();
            SqlCommand cmd;
            string query = "Delete From appointments where AppID=" + Convert.ToInt32(appid.ToString());
            cmd = db.MySqlCommand(query);
            db.Execute(cmd);

            Response.Redirect("/Patient/cancelanappointment.aspx");
        }
    }
}