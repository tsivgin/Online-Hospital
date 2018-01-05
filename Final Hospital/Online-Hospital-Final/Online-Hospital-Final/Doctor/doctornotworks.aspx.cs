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
    public partial class doctornotworks : System.Web.UI.Page
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Save.Enabled = false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = DateTime.Today;
            DateTime bookDate = Calendar.SelectedDate;
            ltrl_SelectedDate.Text = Calendar.SelectedDate.ToString();
            if (bookDate < date)
            {
                ltrl_SelectedDate.Text = "You can not pick date which is earlier then today's date. Please change the date.";
                ltrl_SelectDate.Visible = true;
                //btn_Continue.Enabled = false;
                Save.Enabled = false;
            }
            else
            {
                Save.Enabled = true;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Save_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            db.startDB();
            object tc_no = Session["tc_no"];
            string query = "update doctor set WorkDays = @workday where DoctorID= " + Convert.ToInt64(tc_no.ToString());
            SqlCommand cmd=db.MySqlCommand(query);
            cmd.Parameters.AddWithValue("@workday" , Calendar.SelectedDate.ToString("yyyy/MM/dd"));
            if (db.Execute(cmd))
                lbl_Succeed.Visible = true;                
            else
                lbl_Failed.Visible = true;

        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {

            e.Day.IsSelectable = !e.Day.IsWeekend;
        }
    }
}