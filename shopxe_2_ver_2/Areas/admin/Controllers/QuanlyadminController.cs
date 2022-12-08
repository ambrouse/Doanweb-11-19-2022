using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Areas.admin.hamxuli;
using shopxe_2.Models;

namespace shopxe_2.Areas.admin.Controllers
{
    public class QuanlyadminController : Controller
    {
        // GET: admin/Quanlyadmin
        [kiemtradangnhap(id =5)]
        public ActionResult Index()
        {
            Database db = new Database();
            return View(db.admins);
        }
        [kiemtradangnhap(id=5)]
        public ActionResult Them()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Them(Models.admin model,int quyen_)
        {
            maping_admin h = new maping_admin();
            if (String.IsNullOrEmpty(model.ten))
            {
                ViewBag.err = "Nhập thiếu dữ liệu";
            }
            if (String.IsNullOrEmpty(model.pass))
            {
                ViewBag.err = "Nhập thiếu dữ liệu";
            }
            else
            {
                h.Them(model);
                Database db = new Database();
                phanquyen p = new phanquyen();
                p.iduser = db.admins.FirstOrDefault(c => c.ten == model.ten && c.pass == model.pass).id;
                p.idquyen = quyen_;
                db.phanquyens.Add(p);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id = 5)]
        public ActionResult Capnhat(int id)
        {
            Database db = new Database();
            return View(db.admins.Find(id));
        }
        [HttpPost]
        public ActionResult Capnhat(shopxe_2.Models.admin model, int quyen_)
        {
            maping_admin h = new maping_admin();
            if (String.IsNullOrEmpty(model.ten))
            {
                ViewBag.err = "Nhập thiếu dữ liệu";
            }
            else
            {
                h.Capnhat(model);

                Database db = new Database();
                phanquyen p = db.phanquyens.FirstOrDefault(c=>c.iduser == model.id);
                db.phanquyens.Remove(p);


                phanquyen b = new phanquyen();
                b.iduser = model.id;
                b.idquyen = quyen_;
                db.phanquyens.Add(b);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id = 5)]
        public ActionResult Xoa(int id)
        {
            var l = new maping_admin();
            if (l.Xoa(id) == -1)
            {
                ViewBag.err = "Đã có lỗi xảy ra hãy thao tác lại";
            }
            else
            {
                l.Xoa(id);
                Database db = new Database();
                phanquyen p = db.phanquyens.FirstOrDefault(c=>c.iduser==id);

                db.phanquyens.Remove(p);
                db.SaveChanges();
                
            }
            return RedirectToAction("index");

        }
        public ActionResult khongcoquyen()
        {
            return View();
        }
    }
}