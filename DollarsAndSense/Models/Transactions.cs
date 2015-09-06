using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    public class Transactions
    { 
        public int Id { get; set; }
        public int AccountId { get; set; }
        public int CategoryId { get; set; }
        public string UpdatedByUserId { get; set; }
        public decimal Amount { get; set; }
        public decimal AbsAmount { get; set; }
        public decimal ReconciledAmount { get; set; }
        public decimal AbsReconciledAmount { get; set; }
        public DateTimeOffset Date { get; set; }
        public string Description { get; set; }
        public Nullable<DateTimeOffset> Updated { get; set; }

        public virtual Accounts Account { get; set; }
        public virtual Categories Category { get; set; }
        public virtual ApplicationUser UpdatedByUser { get; set; }
    }
}