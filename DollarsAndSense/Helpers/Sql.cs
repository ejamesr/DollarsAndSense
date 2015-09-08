using DollarsAndSense.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Helpers
{
    public static class Sql
    {
        private static ApplicationDbContext db = new ApplicationDbContext();

        /// <summary>
        /// Helper method to execute stored procedure
        /// </summary>
        /// <param name="StoreProcName"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        public static string NonQuery(string StoredProcName, params SqlParameter[] parms)
        {
            using (SqlConnection cn = new SqlConnection(db.Database.Connection.ConnectionString))
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand(StoredProcName, cn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter retVal = new SqlParameter();
                    retVal.Direction = System.Data.ParameterDirection.ReturnValue;
                    cmd.Parameters.AddRange(parms);
                    cmd.Parameters.Add(retVal);
                    cmd.ExecuteNonQuery();
                    string result = "Got it: " + retVal.Value;
                    return result;
                }
            }
        }

    }
}