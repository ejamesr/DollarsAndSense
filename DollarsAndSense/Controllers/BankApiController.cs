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
using System.Web.Http;

namespace DollarsAndSense.Controllers
{
    public class BankApiController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        [Route("Account/Add")]
        [HttpPost]
        public IEnumerable<Accounts> PostAddBankAccount(TestAccountsModel model)
        {
            return db.Database.SqlQuery<Accounts>("EXEC AddBankAccount @Name, @HouseholdId, @CheckbookBalance, @ReconciledBalance, @AccountNum, @Description",
                new SqlParameter("Name", model.Name),
                new SqlParameter("HouseholdId", model.HouseholdId),
                new SqlParameter("CheckbookBalance", model.CheckbookBalance),
                new SqlParameter("ReconciledBalance", model.ReconciledBalance),
                new SqlParameter("AccountNum", model.AccountNum),
                new SqlParameter("Description", model.Desc));
        }

        [Route("Account")]
        [HttpGet]
        public IEnumerable<Accounts> GetAccountInfo(int Id)
        {
            return db.Database.SqlQuery<Accounts>("EXEC GetAccountInfo @Id",
                new SqlParameter("Id", Id));
        }

        [Route("Account/Household")]
        [HttpGet]
        public IEnumerable<Accounts> GetAccountsForHousehold(string HouseholdId)
        {
            return db.Database.SqlQuery<Accounts>("EXEC GetAccountsForHousehold @HouseholdId",
                new SqlParameter("HouseholdId", HouseholdId));
        }

        [Route("Account/Update")]
        [HttpPost]
        public string PostUpdateAccountInfo(TestAccountsModel model)
        {
            return Sql.NonQuery("UpdateAccountInfo",
                new SqlParameter("Id", model.Id),
                new SqlParameter("Name", model.Name),
                new SqlParameter("HouseholdId", model.HouseholdId),
                new SqlParameter("CheckbookBal", model.CheckbookBalance),
                new SqlParameter("ReconciledBal", model.ReconciledBalance),
                new SqlParameter("AccountNum", model.AccountNum),
                new SqlParameter("Desc", model.Desc));

            //return db.Database.SqlQuery<Accounts>("EXEC UpdateAccountInfo @Id, @Name, @HouseholdId, @CheckbookBalance, @ReconciledBalance, @AccountNum, @Description",
            //    new SqlParameter("Id", model.Id),
            //    new SqlParameter("Name", model.Name),
            //    new SqlParameter("HouseholdId", model.HouseholdId),
            //    new SqlParameter("CheckbookBalance", model.CheckbookBalance),
            //    new SqlParameter("ReconciledBalance", model.ReconciledBalance),
            //    new SqlParameter("AccountNum", model.AccountNum),
            //    new SqlParameter("Description", model.Desc));
        }

    }
}
