using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    // This includes the reconciliation information for each account for each month
    public class Reconciliations
    {
        // This is the Id used in the Transactions register to show it's reconciled
        public int Id { get; set; }
        public DateTimeOffset StatementDate { get; set; }
        public DateTimeOffset Updated { get; set; }
        public int BankAccountId { get; set; }
        public decimal BeginBal { get; set; }
        public decimal EndBal { get; set; }
        public bool IsReconciled { get; set; }
    }
}