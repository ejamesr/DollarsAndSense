using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.ModelViews
{
    /// <summary>
    /// Lots of fields, useful for Test view
    /// </summary>
    public class TestAccountsModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string HouseholdId { get; set; }
        public decimal ReconciledBalance { get; set; }
        public decimal CheckbookBalance { get; set; }
    }
}