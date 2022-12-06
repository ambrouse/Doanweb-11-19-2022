namespace shopxe_2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("chat")]
    public partial class chat
    {
        public int id { get; set; }

        public int? iduser { get; set; }

        public int? idsanpham { get; set; }

        [StringLength(250)]
        public string tenuser { get; set; }

        [Column("chat")]
        [StringLength(255)]
        public string chat1 { get; set; }

        public int? danhgia { get; set; }
    }
}
