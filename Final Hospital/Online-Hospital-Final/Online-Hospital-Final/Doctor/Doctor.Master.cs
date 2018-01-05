using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Online_Hospital_Final.Doctor
{
    /// <summary>
    /// 
    /// </summary>
    public partial class Doctor : System.Web.UI.MasterPage
    {
        Database db = new Database();


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            object tc_no = Session["tc_no"];
            if (tc_no == null)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                string query = "Select Name,role from person where tc_no=" + Convert.ToInt64(tc_no.ToString());
                SqlCommand cmd;
                db.startDB();
                cmd = db.MySqlCommand(query);
                DataRow dr = db.SelectData(cmd);
                if (dr["role"].ToString() != "doctor")
                {
                    Response.Redirect("../default.aspx");
                }
                ltrl_Username.Text = dr["Name"].ToString();
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../login.aspx");

        }
    }
}