using DollarsAndSense.Helpers;
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
            string house = form.Get("HouseholdId");
            return db.Database.SqlQuery<Households>("EXEC AddHousehold @householdId, @name",
                new SqlParameter("householdId", house),
                new SqlParameter("name", name));
        }

        [Route("Household/Invite")]
        [HttpPost]
        public string PostInviteToHousehold(FormDataCollection form)
        {
            string user = form.Get("UserId");
            string email = form.Get("Email");
            return Sql.NonQuery("InvitationSent",
                new SqlParameter("email", email),
                new SqlParameter("user", user));
        }

        [Route("Household/Leave")]
        [HttpPost]
        public string PostLeaveHousehold(FormDataCollection form)
        {
            string id = form.Get("HouseholdId");
            string email = form.Get("Email");
            return Sql.NonQuery("LeaveHousehold",
                new SqlParameter("email", email),
                new SqlParameter("householdId", id));
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

            return Sql.NonQuery("JoinHousehold",
                new SqlParameter("email", email),
                new SqlParameter("householdId", householdId));
        }

        /// <summary>
        /// Get list of all users within a household
        /// </summary>
        /// <param name="HouseholdId"></param>
        /// <returns></returns>
        [Route("Household/Users")]
        public IHttpActionResult GetHouseholdUsers(string HouseholdId)
        {
            IEnumerable<HouseholdUser> Users;

            Users = db.Database.SqlQuery<HouseholdUser>("EXEC GetHouseholdUsers @householdId",
                new SqlParameter("householdId", HouseholdId));
            
            return Ok(Users.ToList());
        }
    }
}
