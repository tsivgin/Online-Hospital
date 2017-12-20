using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Online_Hospital.Admin
{
    public partial class listdepartment : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FetchData();


        }

        void FetchData()
        {

            DataTable dt = new DataTable();
            String query = "Select * FROM Department";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            rbtnl_department.DataTextField = "DepartmentName";
            rbtnl_department.DataValueField = "DepartmentID";
            rbtnl_department.DataSource = dt;
            rbtnl_department.DataBind();
        }

        protected void add_deparment_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection.ClearAllPools();
            db.startDB();
            String query = "Select * FROM Policinic ";
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            dwn_policinic.DataSource = dt;
            dwn_policinic.DataBind();
            list.Visible = false;
            adddepartment.Visible = true;

        }

        protected void registerbtn_Click(object sender, EventArgs e)
        {
            SqlConnection.ClearAllPools();
            if (DepartmentName.Text != "" || BuildingNo.Text != "")
            {
                //SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
                //cnn.Open();
                db.startDB();
                SqlCommand cmd;

                string sorgu = "Insert into Department(DepartmentName, BuildingNo, PolicinicID) values (@depname, @buildno, @polid)";
                //SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd = db.MySqlCommand(sorgu);

                try
                {
                    cmd.Parameters.AddWithValue("@depname", DepartmentName.Text);
                    cmd.Parameters.AddWithValue("@buildno", BuildingNo.Text);
                    cmd.Parameters.AddWithValue("@polid", dwn_policinic.SelectedValue.ToString());
                    cmd.ExecuteReader();



                }

                catch (Exception ex)
                {
                    if (ex is NullReferenceException)
                    {
                        lbl_Failed3.Text = "Lütfen boş alanların tümünü doldurunuz.";
                    }
                    else if (ex is FormatException)
                    {
                        lbl_Failed3.Text = "Lütfen cevabı istenilen formatta ve doğru yazdığınızdan emin olunuz.";
                    }
                    else
                    {
                        lbl_Failed3.Text = ex.ToString();
                    }
                    lbl_Failed3.Visible = true;
                }
                lbl_Succeed3.Visible = true;

            }
        }

        protected void edit_department_Click(object sender, EventArgs e)
        {
            var x = rbtnl_department.SelectedValue;
            list.Visible = false;
            editdepartment.Visible = true;


            DataRow dr;
            SqlCommand cmd;

            String query = "Select A.DepartmentName,A.BuildingNo, P.policinicname  from department as A INNER JOIN Policinic AS P ON P.PolicinicID = A.PolicinicID where A.DepartmentID=" + Convert.ToInt64(x);
            cmd = db.MySqlCommand(query);
            dr = db.SelectData(cmd);
            namedepartment.Text = dr["DepartmentName"].ToString();
            DeparmentBuildingNo.Text = dr["BuildingNo"].ToString();
            depofpolicinic.Text = dr["policinicname"].ToString();


            DataTable dt = new DataTable();
            query = "Select * From policinic";
            cmd = db.MySqlCommand(query);
            dt = db.SelectDataTable(cmd);
            policinic2.DataSource = dt;
            policinic2.DataBind();

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            db.startDB();

            string query = "update department set departmentname=@depname, buildingno=@buildno, PolicinicID=@polid where DepartmentID=" + rbtnl_department.SelectedValue.ToString();
            SqlCommand cmd;
            cmd = db.MySqlCommand(query);

            cmd.Parameters.AddWithValue("@depname", namedepartment.Text);
            cmd.Parameters.AddWithValue("@buildno", DeparmentBuildingNo.Text);
            cmd.Parameters.AddWithValue("@polid", policinic2.SelectedValue);
            db.Execute(cmd);

            Label1.Visible = true;

        }

        protected void delete_department_Click(object sender, EventArgs e)
        {
            var x = rbtnl_department.SelectedValue.ToString();
            db.startDB();
            SqlCommand cmd;
            string query = "Delete From department where departmentID=" + Convert.ToInt32(x.ToString());
            cmd = db.MySqlCommand(query);
            db.Execute(cmd);
            Response.Redirect("/Admin/listdepartment.aspx");

        }




    }
}