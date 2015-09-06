using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DollarsAndSense.Models
{
    public class Invitations
    {
        public int Id { get; set; }              
        public string FromUserId { get; set; }
        public string ToEmail { get; set; }

        //public virtual ApplicationUser FromUser { get; set; }
    }
}