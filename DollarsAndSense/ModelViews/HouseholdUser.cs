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
        public string Name { get; set; }
        public string Email { get; set; }

        public string HousholdId { get; set; }
        public string HouseholdName { get; set; }
    }
}