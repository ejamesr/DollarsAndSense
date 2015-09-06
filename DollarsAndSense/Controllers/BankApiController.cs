using DollarsAndSense.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;

namespace DollarsAndSense.Controllers
{
    public class BankApiController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        [Route("Account/Add")]
        [HttpPost]
        public IEnumerable<Accounts> PostAddBankAccount(FormDataCollection form)
        {
            string name = form.Get("Name");
            string house = form.Get("Householdid");
            string rec = form.Get("ReconciledBalance");
            string chk = form.Get("CheckbookBalance");
            return db.Database.SqlQuery<Accounts>("EXEC AddBankAccount @Name, @HouseholdId, @CheckbookBalance, @ReconciledBalance",
                new SqlParameter("Name", name),
                new SqlParameter("HouseholdId", house),
                new SqlParameter("CheckbookBalance", chk),
                new SqlParameter("ReconciledBalance", rec));
        }

    }
}
