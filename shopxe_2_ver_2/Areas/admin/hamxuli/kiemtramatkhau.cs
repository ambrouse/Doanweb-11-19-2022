using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using shopxe_2.Models;
namespace shopxe_2.Areas.admin.hamxuli
{
    public class kiemtramatkhau
    {
        Database db = new Database();
        public int kiemtra(String name,String pass) {
            foreach (var i in db.admins)
            {
                if (i.ten.ToLower() == name.ToLower())
                {
                    if (i.pass == pass)
                    {
                        return 1;
                    }
                }
            }
            return -1;
        }
    }
}