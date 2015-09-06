using DollarsAndSense.Models;
using DollarsAndSense.ModelViews;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Threading.Tasks;
using System.Web.Http;

namespace DollarsAndSense.Controllers
{
    /// <summary>
    /// Manage households: create, update, get, join, leave
    /// </summary>
    public class HouseholdApiController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        /// <summary>
        /// Get list of all households
        /// </summary>
        /// <returns></returns>
        [Route("Households")]
        public IEnumerable<Households> GetAllHouseholds(){
            return db.Database.SqlQuery<Households>("EXEC GetAllHouseholds");
        }

        [Route("Household")]
        public IEnumerable<Households> GetHousehold(string id)
        {
            return db.Database.SqlQuery<Households>("EXEC GetHousehold @householdId",
                new SqlParameter("householdId", id));
        }

        [Route("Household/Add")]
        [HttpPost]
        public IEnumerable<Households> PostHouseholdAdd(FormDataCollection form)
        {
            string name = form.Get("Name");
            string house = form.Get("householdid");
            return db.Database.SqlQuery<Households>("EXEC AddHousehold @name, @householdId",
                new SqlParameter("name", name),
                new SqlParameter("householdId", house));
        }

        [Route("Household/Invite")]
        [HttpPost]
        public string PostInviteToHousehold(FormDataCollection form)
        {
            string user = form.Get("UserId");
            string email = form.Get("Email");
            return SqlNonQuery("InvitationSent",
                new SqlParameter("email", email),
                new SqlParameter("user", user));
        }

        [Route("Household/Leave")]
        [HttpPost]
        public string PostLeaveHousehold(FormDataCollection form)
        {
            string id = form.Get("HouseholdId");
            string email = form.Get("Email");
            return SqlNonQuery("LeaveHousehold",
                new SqlParameter("email", email),
                new SqlParameter("householdId", id));
        }

        /// <summary>
        /// Helper method to execute stored procedure
        /// </summary>
        /// <param name="StoreProcName"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        private string SqlNonQuery(string StoredProcName, params SqlParameter[] parms)
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


        [Route("Household/Join")]
        [HttpPost]
        public string PostJoinHousehold(FormDataCollection form)
        {
            string email = form.Get("Email");
            string householdId = form.Get("HouseholdId");

            // This method works, but the value returned is always -1.  The next method (using
            // a SqlConnections and SqlCommand) returns the RETURN value from the stored procedure
            //
            // var x = db.Database.ExecuteSqlCommand("EXEC JoinHousehold @email, @householdId",
            //    new SqlParameter("email", email),
            //    new SqlParameter("householdId", householdId));

            return SqlNonQuery("JoinHousehold",
                new SqlParameter("email", email),
                new SqlParameter("householdId", householdId));

            //string result;
            //using (SqlConnection cn = new SqlConnection(db.Database.Connection.ConnectionString))
            //{
            //    cn.Open();
            //    using (SqlCommand cmd = new SqlCommand(, cn))
            //    {
            //        cmd.CommandType = System.Data.CommandType.StoredProcedure;
            //        SqlParameter[] parms = { new SqlParameter("email", email),
            //                           new SqlParameter("householdId", householdId)};
            //        SqlParameter retVal = new SqlParameter();
            //        retVal.Direction = System.Data.ParameterDirection.ReturnValue;
            //        cmd.Parameters.AddRange(parms);
            //        cmd.Parameters.Add(retVal);
            //        cmd.ExecuteNonQuery();
            //        result = "Got it: " + retVal.Value;
            //    }
            //}
            //return result;
        }

        /// <summary>
        /// Get list of all users within a household
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Household/Users")]
        public IHttpActionResult GetHouseholdUsers(string id)
        {
            IEnumerable<HouseholdUser> Users;

            Users = db.Database.SqlQuery<HouseholdUser>("EXEC GetHouseholdUsers @householdId",
                new SqlParameter("householdId", id));
            
            return Ok(Users.ToList());
        }
    }
}
