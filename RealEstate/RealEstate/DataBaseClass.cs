using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;

namespace RealEstate
{
    public class DataBaseClass
    {
        DataTable dt = new DataTable();


        public Boolean InsertData(string query)
        {
            try
            {
                using (NpgsqlConnection conn = GetConnection())
                {
                    string qry = query;
                    NpgsqlCommand cmd = new NpgsqlCommand(qry, conn);
                    conn.Open();
                    int n = cmd.ExecuteNonQuery();
                    if (n == 1)
                    {
                        conn.Close();
                        return true;
                    }
                    conn.Close();
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public DataTable FetchData(string query)
        {
            try
            {
                dt.Rows.Clear();
                try
                {
                    NpgsqlConnection objConn = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=;Database=Manoj;");
                    objConn.Open();
                    string strSelectCmd = query;
                    NpgsqlDataAdapter objDataAdapter = new NpgsqlDataAdapter(strSelectCmd, objConn);

                    objDataAdapter.Fill(dt);
                    objConn.Close();
                    return dt;
                }
                catch (Exception ex)
                {

                }

                return dt;

            }
            catch (Exception ex)
            {

            }
            return dt;
        }





        private static NpgsqlConnection GetConnection()
        {
            return new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=;Database=Manoj;");


        }
    }
}