namespace shopxe_2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("quyen")]
    public partial class quyen
    {
        public int id { get; set; }

        [StringLength(250)]
        public string ten { get; set; }
    }
}
