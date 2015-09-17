using DollarsAndSense.Models;
using DollarsAndSense.ModelViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace DollarsAndSense.Controllers
{
    public class HomeController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult TestAccounts()
        {

            // Preload Update function with data from this id...
            int id = 6;
            ViewBag.Id = id;
            var rec = db.Accounts.Find(id);
            TestAccountsModel model = new TestAccountsModel();
            model.Id = rec.Id;
            model.HouseholdId = rec.HouseholdId;
            model.Name = rec.Name;
            model.CheckbookBalance = rec.CheckbookBalance;
            model.ReconciledBalance = rec.ReconciledBalance;
            model.AccountNum = rec.AccountNumber;
            model.Desc = rec.Description;
            ViewBag.HouseholdId = new SelectList(db.Households, "HouseholdId", "Name", rec.HouseholdId);
            ViewBag.Title = "Test accounts!";

            TestAccountsModel blank = new TestAccountsModel("");
            ViewBag.Blank = blank;
            return View(model);
        }

        public ActionResult TestBudgets()
        {
            // Preload Update function with data from this id...
            int id = 2;
            ViewBag.Id = id;
            var rec = db.BudgetItems.Find(id);
            BudgetItemsView data = new BudgetItemsView();
            data.Id = rec.Id;
            data.HouseholdId = rec.HouseholdId;
            data.JanBudget = rec.JanBudget.ToString();
            data.FebBudget = rec.FebBudget.ToString();
            data.MarBudget = rec.MarBudget.ToString();
            data.AprBudget = rec.AprBudget.ToString();
            data.MayBudget = rec.MayBudget.ToString();
            data.JunBudget = rec.JunBudget.ToString();
            data.JulBudget = rec.JulBudget.ToString();
            data.AugBudget = rec.AugBudget.ToString();
            data.SepBudget = rec.SepBudget.ToString();
            data.OctBudget = rec.OctBudget.ToString();
            data.NovBudget = rec.NovBudget.ToString();
            data.DecBudget = rec.DecBudget.ToString();
            ViewBag.ToUpdate = data;
            
            ViewBag.Title = "Test budgets!";
            BudgetItemsView view = new BudgetItemsView();
            ViewBag.HouseholdId = new SelectList(db.Households, "HouseholdId", "Name");
            return View(view);
        }

        public ActionResult TestCategories()
        {
            ViewBag.Title = "Test categories!";
            return View();
        }

        public ActionResult TestHouseholds()
        {
            TestHouseholdsModel model = new TestHouseholdsModel();
            model.Households = new SelectList(db.Households, "HouseholdId", "Name");
            ViewBag.HouseholdId = model.Households;
            ViewBag.Title = "Test households!";
            return View();
        }

        public ActionResult TestTransactions()
        {
            ViewBag.Title = "Test transactions!";
            return View();
        }

        [HttpPost]
        public ActionResult Test3()
        {
            string name = Request.Form.Get("Name");
            ViewBag.Title = "Test stuff!";
            return View();
        }


    }
}
