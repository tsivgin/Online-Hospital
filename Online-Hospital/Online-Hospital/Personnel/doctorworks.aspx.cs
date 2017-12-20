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
    public partial class doctorworks : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = DateTime.Today;
            DateTime bookDate = Calendar.SelectedDate;
            if (bookDate < date)
            {
                ltrl_SelectedDate.Text = "You can not pick date which is earlier then today's date. Please change the date.";
                ltrl_SelectDate.Visible = true;

            }

        }

        protected void Control_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            db.startDB();
            string sorgu = "Select * from person where tc_no=" + Convert.ToInt64(TC.Text);
            cmd = db.MySqlCommand(sorgu);
            DataTable dr;
            dr = db.SelectDataTable(cmd);
            var personid = dr.Rows[0]["PersonID"];

            sorgu = "update doctor set workdays = @workdays where DoctorID=" + personid;
            cmd = db.MySqlCommand(sorgu);
            cmd.Parameters.AddWithValue("@workdays", Calendar.SelectedDate);
            db.Execute(cmd);
            lbl_Succeed.Visible = true;


        }


    }
}