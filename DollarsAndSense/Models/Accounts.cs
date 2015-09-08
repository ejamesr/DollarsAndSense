using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models 
{
    public class Accounts
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string AccountNumber { get; set; }
        public string Description { get; set; }
        public decimal CheckbookBalance { get; set; }
        public decimal ReconciledBalance { get; set; }
        public string HouseholdId { get; set; }
    }
}