namespace shopxe_2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("phanquyen")]
    public partial class phanquyen
    {
        public int id { get; set; }

        public int? iduser { get; set; }

        public int? idquyen { get; set; }
    }
}
