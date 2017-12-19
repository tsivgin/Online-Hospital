using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace Online_Hospital
{
    public class Database
    {
        public SqlConnection baglanti;
        public SqlCommand com;




        /// <summary>
        /// The database constructor.
        /// </summary>
        public Database()
        {
            SqlConnection.ClearAllPools();
            baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
            //String connectionString = "Server=localhost; Port=3306; Database=mydb; Uid=root;";
            //baglanti = new SqlConnection(connectionString);
        }
        /// <summary>
        /// starts the database.
        /// </summary>
        public void startDB()
        {

            if (baglanti != null && baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
        }
        /// <summary>
        /// Stops Database.
        /// </summary>
        public void stopDB()
        {
            if (baglanti != null && baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }

        }

        public SqlCommand MySqlCommand(string query)
        {

            var mySqlCommand = new SqlCommand(query, baglanti);
            return mySqlCommand;
        }
        /// <summary>
        /// Returns the DataTable created by SqlCommand
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>DataTable</returns>
        public DataTable GetData(SqlCommand cmd)
        {
            startDB();
            var dataTable = new DataTable();
            var dataSet = new DataSet();
            var dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(dataSet);
            dataTable = dataSet.Tables[0];
            return dataTable;
        }
        /// <summary>
        /// Returns the DataRow created by SqlCommand
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>DataRow</returns>
        public DataRow SelectData(SqlCommand cmd)
        {
            DataTable dTable = new DataTable();
            using (SqlDataAdapter dr = new SqlDataAdapter(cmd))
            {
                dr.Fill(dTable);
                if (dTable.Rows.Count > 0)
                {
                    return dTable.Rows[0];
                }
                else
                    return null;
            }

        }

        /// <summary>
        /// Creates dataTable with a cmd.
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>DataTable.</returns>
        public DataTable SelectDataTable(SqlCommand cmd)
        {
            DataTable dTable = new DataTable();
            using (SqlDataAdapter dr = new SqlDataAdapter(cmd))
            {

                dr.Fill(dTable);
                if (dTable.Rows.Count > 0)
                {
                    return dTable;
                }
                else
                    return null;


            }

        }



        /// <summary>
        /// This method helps to execute the query.
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>a boolean type.</returns>
        public bool Execute(SqlCommand cmd)
        {

            try
            {
                if (cmd.ExecuteNonQuery() == 1)
                    return true;
                else
                    return false;
            }
            catch (SqlException ex)
            {
                ex.ToString();
                return false;
            }
        }

      
    }
}