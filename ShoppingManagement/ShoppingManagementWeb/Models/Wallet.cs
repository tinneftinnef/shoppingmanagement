using System;
using System.Collections.Generic;

namespace ShoppingManagementWeb.Models
{
    public partial class Wallet
    {
        public int WalletId { get; set; }
        public int UserId { get; set; }
        public long LastMoneyIn { get; set; }
        public DateTime LastTimePushMoney { get; set; }

        public virtual User User { get; set; } = null!;
    }
}
