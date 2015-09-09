using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    public class BudgetItems
    {
        public int Id { get; set; }
        public string HouseholdId { get; set; }
        public int CategoryId { get; set; }

        // Default budget amount for all categories
        public decimal DefaultAmount { get; set; }

        // Budget amounts
        public decimal JanBudget { get; set; }
        public decimal FebBudget { get; set; }
        public decimal MarBudget { get; set; }
        public decimal AprBudget { get; set; }
        public decimal MayBudget { get; set; }
        public decimal JunBudget { get; set; }
        public decimal JulBudget { get; set; }
        public decimal AugBudget { get; set; }
        public decimal SepBudget { get; set; }
        public decimal OctBudget { get; set; }
        public decimal NovBudget { get; set; }
        public decimal DecBudget { get; set; }

        // Actuals for the specified year
        public decimal JanActual { get; set; }
        public decimal FebActual { get; set; }
        public decimal MarActual { get; set; }
        public decimal AprActual { get; set; }
        public decimal MayActual { get; set; }
        public decimal JunActual { get; set; }
        public decimal JulActual { get; set; }
        public decimal AugActual { get; set; }
        public decimal SepActual { get; set; }
        public decimal OctActual { get; set; }
        public decimal NovActual { get; set; }
        public decimal DecActual { get; set; }

        //public virtual Households Household { get; set; }
        //public virtual Categories Category { get; set; }
    }
}