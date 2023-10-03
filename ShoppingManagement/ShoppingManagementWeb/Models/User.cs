using System;
using System.Collections.Generic;

namespace ShoppingManagementWeb.Models
{
    public partial class User
    {
        public User()
        {
            Registations = new HashSet<Registation>();
            Wallets = new HashSet<Wallet>();
        }

        public int UserId { get; set; }
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string FullName { get; set; } = null!;
        public string? Email { get; set; }
        public string? Address { get; set; }
        public int Roles { get; set; }
        public bool Status { get; set; }

        public virtual ICollection<Registation> Registations { get; set; }
        public virtual ICollection<Wallet> Wallets { get; set; }
    }
}
