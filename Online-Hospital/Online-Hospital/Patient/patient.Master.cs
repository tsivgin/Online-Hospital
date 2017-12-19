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
    public partial class patient : System.Web.UI.MasterPage
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                object tc_no = Session["tc_no"];
                if (tc_no != null)
                    PopulateData();
                else
                    Response.Redirect("../login.aspx");
            }
        }

        protected void PopulateData()
        {
            DataRow dr;
            String tc_no = Session["tc_no"].ToString();
            SqlCommand cmd;
            String query = "Select * from person where Tc_no = '" + tc_no + "'";
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            ltrl_Username.Text = dr["Name"].ToString();
            ltrl_Username.Visible = true;





        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../login.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}