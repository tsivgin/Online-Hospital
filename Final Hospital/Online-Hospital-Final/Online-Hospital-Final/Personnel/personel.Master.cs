using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Online_Hospital_Final.Personnel
{

    /// <summary>
    /// 
    /// </summary>
    public partial class personnel : System.Web.UI.MasterPage
    {
        /// <summary>
        /// control of personnel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                object tc_no = Session["tc_no"];
                if (tc_no == null)
                {
                    Response.Redirect("../login.aspx");
                }
                else
                {
                    Database db = new Database();
                    db.startDB();
                    string query = "Select * from person where tc_No=" + Convert.ToInt64(tc_no.ToString());
                    SqlCommand cmd;
                    cmd = db.MySqlCommand(query);
                    DataRow dr = db.SelectData(cmd);
                    string role = dr["role"].ToString();
                    if (role != "personnel")
                    {
                        Response.Redirect("../default.aspx");
                    }
                    ltrl_Username.Text = dr["Name"].ToString();
                }

            }
        }

        /// <summary>
        /// logout
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