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
    //public static class ExtendEnum<CatType>{};

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

    //public class CT<T>
    //{
    //    public T tType;
    //    public Enum tt;
    //    public string[] tlist = null;
    //    public Type enumlist = typeof(T);
        
    //    public CT()
    //    {
    //        string[] names = Enum.GetNames(typeof(T));
    //        tlist = names;
    //    }
    //}
}