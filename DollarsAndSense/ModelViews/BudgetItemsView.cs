using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.ModelViews
{
    public class BudgetItemsView
    {
        public int Id { get; set; }
        public string HouseholdId { get; set; }
        public int CategoryId { get; set; }

        // Default budget amount for all categories
        public string DefaultAmount { get; set; }

        // Budget amounts
        public string JanBudget { get; set; }
        public string FebBudget { get; set; }
        public string MarBudget { get; set; }
        public string AprBudget { get; set; }
        public string MayBudget { get; set; }
        public string JunBudget { get; set; }
        public string JulBudget { get; set; }
        public string AugBudget { get; set; }
        public string SepBudget { get; set; }
        public string OctBudget { get; set; }
        public string NovBudget { get; set; }
        public string DecBudget { get; set; }

        // Actuals for the specified year
        public string JanActual { get; set; }
        public string FebActual { get; set; }
        public string MarActual { get; set; }
        public string AprActual { get; set; }
        public string MayActual { get; set; }
        public string JunActual { get; set; }
        public string JulActual { get; set; }
        public string AugActual { get; set; }
        public string SepActual { get; set; }
        public string OctActual { get; set; }
        public string NovActual { get; set; }
        public string DecActual { get; set; }
    }

}