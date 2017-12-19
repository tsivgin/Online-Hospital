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
    public partial class ListAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database db = new Database();
            SqlCommand cmd;
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
            cnn.Open();
            String query;

            var user = Session["tc_no"];
            if (user != null)
            {
                query = "Select PersonID FROM person WHERE tc_no= " + Convert.ToInt64(user.ToString());
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                var x = dt.Rows[0][0];
                query = "Select  A.appID,DE.departmentname as Department, P.policinicname as Polinic  , PE.name as DoctorName,CONVERT(NVARCHAR, A.date, 106) AS Date, T.WorkHour as Time FROM appointments as A INNER JOIN department as DE ON A.DepartmentID =  DE.DepartmentID INNER JOIN Person AS PE ON PE.personID = A.DoctorID  INNER JOIN work_hours AS T ON T.type = A.type  INNER JOIN Policinic AS P ON P.PolicinicID = A.PolicinicID WHERE A.PatientID = " + Convert.ToInt32(x);
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                listappointment.DataSource = dt;
                listappointment.DataBind();

            }



        }

        protected void listappointment_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }


    }
}