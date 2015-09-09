using DollarsAndSense.Helpers;
using DollarsAndSense.Models;
using DollarsAndSense.ModelViews;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DollarsAndSense.Controllers
{
    public class BudgetApiController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        [Route("Budget/Add")]
        [HttpPost]
        public string PostAddBudgetItem(BudgetItemsView model)
        {
            // Make sure each item is not null... convert to -1 instead
            model.JanBudget = model.JanBudget ?? "-1";
            model.FebBudget = model.FebBudget ?? "-1";
            model.MarBudget = model.MarBudget ?? "-1";
            model.AprBudget = model.AprBudget ?? "-1";
            model.MayBudget = model.MayBudget ?? "-1";
            model.JunBudget = model.JunBudget ?? "-1";
            model.JulBudget = model.JulBudget ?? "-1";
            model.AugBudget = model.AugBudget ?? "-1";
            model.SepBudget = model.SepBudget ?? "-1";
            model.OctBudget = model.OctBudget ?? "-1";
            model.NovBudget = model.NovBudget ?? "-1";
            model.DecBudget = model.DecBudget ?? "-1";
            var x = Sql.NonQuery("AddBudgetItem",   // @HouseholdId, @CategoryId, @DefaultAmt, @Jan, @Feb, @Mar, @Apr, @May, @Jun, @Jul, @Aug, @Sep, @Oct, @Nov, @Dec",
                new SqlParameter("HouseholdId", model.HouseholdId),
                new SqlParameter("CategoryId", model.CategoryId),
                new SqlParameter("DefaultAmt", model.DefaultAmount),
                new SqlParameter("Jan", model.JanBudget),
                new SqlParameter("Feb", model.FebBudget),
                new SqlParameter("Mar", model.MarBudget),
                new SqlParameter("Apr", model.AprBudget),
                new SqlParameter("May", model.MayBudget),
                new SqlParameter("Jun", model.JunBudget),
                new SqlParameter("Jul", model.JulBudget),
                new SqlParameter("Aug", model.AugBudget),
                new SqlParameter("Sep", model.SepBudget),
                new SqlParameter("Oct", model.OctBudget),
                new SqlParameter("Nov", model.NovBudget),
                new SqlParameter("Dec", model.DecBudget));
            return x;
        }

        [Route("Budget")]
        [HttpGet]
        public IEnumerable<BudgetItems> GetBudget(int Id)
        {
            return db.Database.SqlQuery<BudgetItems>("EXEC GetBudgetInfo @Id",
                new SqlParameter("Id", Id));
        }

        [Route("Budget/Household")]
        [HttpGet]
        public IEnumerable<BudgetItems> GetBudgetsForHousehold(string HouseholdId)
        {
            return db.Database.SqlQuery<BudgetItems>("EXEC GetBudgetsForHousehold @HouseholdId",
                new SqlParameter("HouseholdId", HouseholdId));
        }

        [Route("Budget/Remove")]
        [HttpPost]
        public string PostRemoveBudget()
        {
            // Remember: with POST, there are no parameters sent via the URL, they come through the body!
            return Sql.NonQuery("RemoveBudgetItem",
                new SqlParameter("Id", 5));
        }

        [Route("Budget/Update")]
        [HttpPost]
        public string PostUpdateBudget(BudgetItemsView model)
        {
            return Sql.NonQuery("UpdateBudgetMonths",//Item @HouseholdId, @CategoryId, @DefaultAmt, @JanBudget, @FebBudget, @MarBudget, @AprBudget, @MayBudget, @JunBudget, @JulBudget, @AugBudget, @SepBudget, @OctBudget, @NovBudget, @DecBudget,  @JanActual, @FebActual, @MarActual, @AprActual, @MayActual, @JunActual, @JulActual, @AugActual, @SepActual, @OctActual, @NovActual, @DecActual",
                new SqlParameter("Id", model.Id),
                new SqlParameter("JanBudget", model.JanBudget),
                new SqlParameter("FebBudget", model.FebBudget),
                new SqlParameter("MarBudget", model.MarBudget),
                new SqlParameter("AprBudget", model.AprBudget),
                new SqlParameter("MayBudget", model.MayBudget),
                new SqlParameter("JunBudget", model.JunBudget),
                new SqlParameter("JulBudget", model.JulBudget),
                new SqlParameter("AugBudget", model.AugBudget),
                new SqlParameter("SepBudget", model.SepBudget),
                new SqlParameter("OctBudget", model.OctBudget),
                new SqlParameter("NovBudget", model.NovBudget),
                new SqlParameter("DecBudget", model.DecBudget));
        }
    }
}
