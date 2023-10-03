using System;
using System.Collections.Generic;

namespace ShoppingManagementWeb.Models
{
    public partial class Production
    {
        public Production()
        {
            Registations = new HashSet<Registation>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public int ProductQuantity { get; set; }
        public long ProductListPrice { get; set; }
        public long ProductSalePrice { get; set; }
        public string ProductInformation { get; set; } = null!;
        public int ProductCategoryId { get; set; }

        public virtual ProductCategory ProductCategory { get; set; } = null!;
        public virtual ICollection<Registation> Registations { get; set; }
    }
}
