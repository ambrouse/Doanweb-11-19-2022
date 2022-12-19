using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using shopxe_2.Models;
namespace shopxe_2.Models.hamxuly
{
    public class kiemtradangnhap
    {
        public bool kiemtra(String email) {
            Database db = new Database();
            if (email == null)
            {
                return false;
            }
            foreach (var i in db.users.ToList()) {
                if (email.ToLower().Equals(i.email.ToLower())) {
                    return true;
                }
            }
            return false;
        
        }
    }
}