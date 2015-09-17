using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    public enum CatType
    {
        Asset,
        Debt,
        Income,
        Expense,
        NetWorth,
        Xfr,
        Other
    }
    public static class CatTypes
    {
        private static string[] t = Enum.GetNames(typeof(CatType));
        //private static string[] t = 
        //    { CatType.Asset.ToString(), CatType.Debt.ToString(), CatType.Income.ToString(),
        //        CatType.Expense.ToString(), CatType.NetWorth.ToString(), CatType.Xfr.ToString(),
        //        CatType.Other.ToString() };
        public static string Asset    { get { return t[(int)CatType.Asset  ]; } }
        public static string Debt     { get { return t[(int)CatType.Debt   ]; } }
        public static string Income   { get { return t[(int)CatType.Income ]; } }
        public static string Expense  { get { return t[(int)CatType.Expense ]; } }
        public static string NetWorth { get { return t[(int)CatType.NetWorth]; } }
        public static string Xfr      { get { return t[(int)CatType.Xfr     ]; } }
        public static string Other    { get { return t[(int)CatType.Other   ]; } }

        public static string[] ToList() { return t; }
    }

    public class Categories
    {
        public int Id { get; set; }
        public string HouseholdId { get; set; }
        public string Name { get; set; }
        public CatType Type { get; set; }

        //public virtual Households Household { get; set; }
        public Categories()
        {
           
        }
    }

    /*
     * List of Categories to Seed
     * 
     * Asset
     * =====
     * Home
     * Autos
     * Furniture
     * Other
     * 
     * Debt
     * ====
     * CreditCard 1
     * CreditCard 2
     * Auto Loan
     * Home Loan
     * 
     * Income
     * ======
     * Paycheck
     * Consulting
     * Tax Refund
     * Other
     * 
     * Expense
     * =======
     * Allowance
     * Auto - Fuel
     * Auto - Maintenance
     * Birthdays
     * Business
     * Charity
     * Clearing
     * Clothing
     * Credit Card
     * Dental
     * Entertainment
     * Groceries
     * Home Maintenance
     * Gifts
     * HOA
     * Insurance - Health
     * Insurance - Home
     * Insurance - Auto
     * Loan Repayment
     * Medical
     * Miscellaneous
     * Other
     * Personal Care
     * Rent
     * School
     * Supplies
     * To Be Reimbursed
     * Utilities
     * Vacation
     * 
     * */
}
