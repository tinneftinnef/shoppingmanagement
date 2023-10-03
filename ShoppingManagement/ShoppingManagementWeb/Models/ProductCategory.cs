using System;
using System.Collections.Generic;

namespace ShoppingManagementWeb.Models
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
            Productions = new HashSet<Production>();
        }

        public int ProductCateId { get; set; }
        public string CateName { get; set; } = null!;

        public virtual ICollection<Production> Productions { get; set; }
    }
}
