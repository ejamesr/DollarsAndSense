using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DollarsAndSense.ModelViews
{
    /// <summary>
    /// Lots of fields, useful for Test view
    /// </summary>
    public class TestHouseholdsModel
    {
        public int Id { get; set; }
        public string HouseholdId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string UserId { get; set; }
        public SelectList Households { get; set; }
    }
}