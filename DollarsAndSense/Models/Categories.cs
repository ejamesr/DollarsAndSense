using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    /// <summary>
    /// Add functionality to enum CatType
    /// </summary>
    public static class ExtendCatType
    {
        private static int length;
        private static string[] Types = null;
        private static string[] TypesUpper = null;
        static ExtendCatType()
        {
            string[] genericTypes = Enum.GetNames(typeof(CatType));
        
            length = genericTypes.Length - 1;
            Types =  new string[length];
            TypesUpper = new string[length];
            int i;
            // Create upper-case list to use for converting strings to type
            for (i = 0; i < length; i++)
            {
                Types[i] = genericTypes[i + 1];
                TypesUpper[i] = Types[i].ToUpper();
            }
        }
        public static int Val(this CatType type)
        {
            return (int)type;
        }
        public static string Str(this CatType type)
        {
            return type.ToString();
        }
        public static string[] ToList(this CatType type) { return Types; }
        public static int Length(this CatType type) { return length; }
        public static bool ToEnum(this CatType T, string str, out CatType type)
        {
            string Str = str.ToUpper();
            int i;
            for (i = 0; i < TypesUpper.Length; i++)
            {
                if (TypesUpper[i].Equals(Str))
                {
                    type = (CatType)(i + 1);
                    return true;
                }
            }
            // Couldn't find it, so show false
            //type = CatType.Income;
            type = CatType.Income;
            return false;
        }
    }

    public enum CatType
    {
        E = 0,
        Income,
        Expense,
        Asset,
        Liability,
        Other
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

    public class CT<T>
    {
        public T tType;
        public Enum tt;
        public string[] tlist = null;
        public Type enumlist = typeof(T);
        
        public CT()
        {
            string[] names = Enum.GetNames(typeof(T));
            tlist = names;
        }
    }
}