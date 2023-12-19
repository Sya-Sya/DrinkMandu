﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace template.infrastructure
{
    public class DBConnection
    {
        public static SqlConnection Connection()
        {
            SqlConnection con = new SqlConnection();
            SqlConnection.ClearAllPools();
            con = new SqlConnection();
            try
            {
                con = new SqlConnection(Convert.ToString(ConfigurationManager.ConnectionStrings["TemplateDBConnection"].ConnectionString));

                if (con.State.ToString() == "Open")
                {
                    con.Close();
                }
                if (con.State.ToString() == "Closed")
                {
                    con.Open();
                }
                return con;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message);
            }
        }
    }
}