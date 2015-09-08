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
        public string AccountNum { get; set; }
        public string Desc { get; set; }

        public TestAccountsModel() { }
        public TestAccountsModel(string s)
        {
            Name = s;
            HouseholdId = s;
            ReconciledBalance = 0;
            CheckbookBalance = 0;
            AccountNum = s;
            Desc = s;
        }
    }
}