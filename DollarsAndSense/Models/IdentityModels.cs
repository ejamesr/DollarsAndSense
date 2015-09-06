using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace DollarsAndSense.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public string HouseholdId { get; set; }
        public string Name { get; set; }
        //public bool IsDeleted { get; set; }
        //public bool IsLockedOut { get; set; }
        //public string PasswordResetToken { get; set; }
        //public DateTimeOffset PasswordResetExpiry { get; set; }
        //public DateTimeOffset LockoutEndDate { get; set; }

        // If declared here, should not declare in ApplicationDbContext below...
        //public virtual Households Households { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
            // Add custom user claims here
            return userIdentity;
        }

        public ApplicationUser(){
            //this.TransactionsUpdated = new HashSet<Transaction>();
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }
        
        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        public DbSet<Households> Households { get; set; }
        public DbSet<Invitations> Invitations { get; set; }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<Transactions> Transactions { get; set; }
        public DbSet<BudgetItems> BudgetItems { get; set; }
        public DbSet<Accounts> Accounts { get; set; }
    }
}