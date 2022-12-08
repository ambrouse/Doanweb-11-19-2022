using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using shopxe_2.Models;
namespace shopxe_2.Areas.admin.hamxuli
{
    public class maping_admin
    {
        public int Them(shopxe_2.Models.admin model) {
            Database db = new Database();
            try
            {
                db.admins.Add(model);
                db.SaveChanges();
                return 1;

            }
            catch (Exception e)
            {
                return -1;
            }
        }
        public int Capnhat(shopxe_2.Models.admin model)
        {
            Database db = new Database();
            try
            {
                var capnhat = db.admins.Find(model.id);
                capnhat.id = model.id;
                capnhat.ten = model.ten;
                capnhat.pass = model.pass;
                db.SaveChanges();
                
                return 1;

            }
            catch (Exception e)
            {
                return -1;
            }
        }
        public int Xoa(int id)
        {
            Database db = new Database();
            try
            {
                var xoa = db.admins.Find(id);
                db.admins.Remove(xoa);
                db.SaveChanges();
                return 1;

            }
            catch (Exception e)
            {
                return -1;
            }
        }
    }
}