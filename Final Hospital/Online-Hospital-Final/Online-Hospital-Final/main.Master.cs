using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Hospital_Final
{
    /// <summary>
    /// 
    /// </summary>
    public partial class main : System.Web.UI.MasterPage
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Lab_Click(object sender, EventArgs e)
        {
            object user = Session["tc_no"];
            if (user != null)
            {
                Response.Redirect("login.aspx");

            }
            else
            {

            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void randevu_Click(object sender, EventArgs e)
        {
            object user = Session["tc_no"];
            if (user != null)
            {
                Response.Redirect("login.aspx");

            }
            else
            {

            }
        }






    }
}