using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models 
{
    public class Households
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string HouseholdId { get; set; }

        //public virtual Households Household { get; set; }
    }
}