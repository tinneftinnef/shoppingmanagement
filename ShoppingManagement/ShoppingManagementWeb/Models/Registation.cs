using System;
using System.Collections.Generic;

namespace ShoppingManagementWeb.Models
{
    public partial class Registation
    {
        public int RegistrationId { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public long TotalMoney { get; set; }

        public virtual Production Product { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
