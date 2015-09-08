using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Owin;
using Owin;
using DollarsAndSense.Models;

[assembly: OwinStartup(typeof(DollarsAndSense.Startup))]

namespace DollarsAndSense
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            // Do some code here to test things...
            var x = CatType.E.ToList();
            var y = CatType.Expense.ToString();
            var z = CatType.Expense.Val();
            CatType newType;
            var a = CatType.E.ToEnum("Liability", out newType);

            CT<CatType> testVar = new CT<CatType>();
            Array enums = Enum.GetValues(testVar.enumlist);
            Enum e = new CatType();
        }
    }
}
