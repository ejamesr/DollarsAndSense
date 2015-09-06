using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace DollarsAndSense.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult TestHouseholds()
        {
            ViewBag.Title = "Test households!";
            return View();
        }

        public ActionResult TestAccounts()
        {
            ViewBag.Title = "Test accounts!";
            return View();
        }

        public ActionResult TestBudgets()
        {
            ViewBag.Title = "Test budgets!";
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
