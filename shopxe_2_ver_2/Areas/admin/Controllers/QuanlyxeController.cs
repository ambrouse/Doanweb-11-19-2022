
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Models;
using shopxe_2.Areas.admin.hamxuli;

namespace shopxe_2.Areas.admin.Controllers
{
    public class QuanlyxeController : Controller
    {
        // GET: admin/Quanlydulieu
        [kiemtradangnhap(id =1,id_2 =5,id_3 =6,id_4 =7,id_5 =8)]
        public ActionResult Index(String name)
        {
            Database db = new Database();
            if (String.IsNullOrEmpty(name)) {
                return View(db.sanphams.ToList());  
            }
            return View(db.sanphams.Where(c => c.ten.ToLower().Contains(name.ToLower())).ToList());
        }
        [kiemtradangnhap(id =5,id_2 =4,id_3 =8,id_4 =10,id_5 =11)]
        public ActionResult Them() {
            return View(new sanpham());
        }
        [HttpPost]
        public ActionResult Them(sanpham model, HttpPostedFileBase file_1, HttpPostedFileBase file_2) {
            Database db = new Database();
            if (file_1 == null || file_2 == null)
            {
                ViewBag.err = "Chưa nhập ảnh";
                return View(model);
            }
            if (String.IsNullOrEmpty(model.ten)) {
                ViewBag.err = "Vui lòng nhập tên";
                return View(model);
            }
            if (model.gia <= 0) {
                ViewBag.err = "Giá trị phải lớn hơn 0";
                return View(model);
            }
            String x = Server.MapPath("/imgxe/");
            var chuyendoi = new chuyendoi();
            String y_1 = x + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
            String y_2 = x + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
            file_1.SaveAs(y_1);
            file_2.SaveAs(y_2);
            model.imgurl_1 = "/imgxe/" + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
            model.imgurl_2 = "/imgxe/" + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
            db.sanphams.Add(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id =5,id_2 =2,id_3 =7,id_4 =9,id_5 =11)]
        public ActionResult Update(int id) {
            Database db = new Database();
            var update = db.sanphams.Find(id);
            return View(update);
        }
        [HttpPost]
        public ActionResult Update(sanpham model, HttpPostedFileBase file_1, HttpPostedFileBase file_2)
        {
            Database db = new Database(); var update = db.sanphams.Find(model.id);
            if (String.IsNullOrEmpty(model.ten)) {
                ViewBag.err = "Vui lòng nhập tên";
                return View(model);    
            }
            if (file_1 == null && file_2 == null)
            {
                update.ten = model.ten;
                update.gia = model.gia;
                update.loai = model.loai;
                update.hang = model.hang;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (file_1 == null || file_2 == null)
            {
                ViewBag.err = "Nếu muốn đổi ảnh thì phải đổi cả hai";
                return View();
            }
            System.IO.File.Delete(Server.MapPath(update.imgurl_1)); System.IO.File.Delete(Server.MapPath(update.imgurl_2));
            var chuyendoi = new chuyendoi();
            String x = Server.MapPath("/imgxe/");
                String y_1 = x + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
                String y_2 = x + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
                file_1.SaveAs(y_1);
                file_2.SaveAs(y_2);
                update.imgurl_1 = "/imgxe/" + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
                update.imgurl_2 = "/imgxe/" + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
            update.ten = model.ten;
            update.gia = model.gia;
            update.loai = model.loai;
            update.hang = model.hang;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id =5,id_2 =3,id_3 =6,id_4 =9,id_5 =10)]
        public ActionResult Delete(int id) {
            Database db = new Database(); var delete = db.sanphams.Find(id);
            System.IO.File.Delete(Server.MapPath(delete.imgurl_1)); System.IO.File.Delete(Server.MapPath(delete.imgurl_2));
            db.sanphams.Remove(delete);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}