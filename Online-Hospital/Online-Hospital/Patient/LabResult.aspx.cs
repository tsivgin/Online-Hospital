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
    public partial class LabResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database db = new Database();
            DataTable dt = new DataTable();          
            String query;
            SqlCommand cmd;
            db.startDB();
            var user = Session["tc_no"];
            if (user != null)
            {
                query = "Select PersonID FROM person WHERE tc_no like '%" + Convert.ToInt64(user.ToString()) + "%'";
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                var x = dt.Rows[0][0].ToString();

                query = "Select  DE.departmentname as Department, A.LabResult as LabResult  FROM LabResult as A INNER JOIN department as DE ON A.DepartmentID =  DE.DepartmentID WHERE Pid " + Convert.ToInt32(x);
                cmd = db.MySqlCommand(query);
                dt = db.SelectDataTable(cmd);
                labresult.DataSource = dt;
                labresult.DataBind();


            }

        }
    }
}