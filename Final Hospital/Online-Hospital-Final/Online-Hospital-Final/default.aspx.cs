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
    public partial class _default : System.Web.UI.Page
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            object user = Session["tc_no"];
            if (user != null)
            {
                users.Visible = false;
                users2.Visible = true;
            }
            else
            {
                users.Visible = true;
                users2.Visible = false;
            }
        }
    }
}