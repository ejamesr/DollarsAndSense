using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.ModelViews
{
    public class HouseholdUser
    {
        // Info for User and Household...
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public string HouseholdId { get; set; }
        public string HouseholdName { get; set; }
    }
}