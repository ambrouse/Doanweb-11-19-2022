using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Models;
namespace shopxe_2.Controllers
{
    public class GiohangController : Controller
    {
        // GET: Giohang
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("index", "Dangnhap");
            }

            user u = (user)Session["user"];
            Database db = new Database();
            
            return View(db.chitietdonhangs.Where(c=> c.iddonhang==u.id).ToList());
        }
        public ActionResult Themsanpham(int id) {
            if (Session["user"] == null)
            {
                return RedirectToAction("index", "Dangnhap");
            }

            Database db = new Database();
            chitietdonhang model = new chitietdonhang();
            var sp = db.sanphams.Find(id);
            user u = (user)Session["user"];

            model.ten = sp.ten;
            model.idsanpham = sp.id;
            model.iddonhang = u.id;
            model.dongia = sp.gia;
            model.soluong = 1;

            foreach(var i in db.chitietdonhangs.Where(c=> c.iddonhang==u.id).ToList()) {
                if (i.idsanpham==model.idsanpham) {
                    return RedirectToAction("index");
                }
            }

            db.chitietdonhangs.Add(model);
            db.SaveChanges();
            return RedirectToAction("index");
        }
        public ActionResult update(int id,int soluong) {
            Database db = new Database();
            if (soluong <= 0) {
                return RedirectToAction("index");
            }
            var update = db.chitietdonhangs.FirstOrDefault(c => c.idsanpham == id);
            update.soluong = soluong;
            db.SaveChanges();
            return RedirectToAction("index");
        }
        public ActionResult Delete(int id) {
            Database db = new Database();
            var xoa = db.chitietdonhangs.Find(id);
            db.chitietdonhangs.Remove(xoa);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}