using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Areas.admin.hamxuli;
using shopxe_2.Models;

namespace shopxe_2.Areas.admin.Controllers
{
    public class QuanlyhangController : Controller
    {
        // GET: admin/Quanlyhang
        [kiemtradangnhap(id = 1, id_2 = 5, id_3 = 6, id_4 = 7, id_5 = 8)]
        public ActionResult Index()
        {
            Database db = new Database();
                return View(db.hangs.ToList());
        }
        [kiemtradangnhap(id = 5, id_2 = 4, id_3 = 8, id_4 = 10, id_5 = 11)]
        public ActionResult Them()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Them(hang model)
        {
            
            maping_hang h = new maping_hang();
            if (String.IsNullOrEmpty(model.ten))
            {
                ViewBag.err = "Vui lòng nhập tên";
            }
            if (h.Them(model) == -1)
            {
                ViewBag.err = "Đã có lỗi xảy ra hãy thao tác lại";
            }
            else
            {
                h.Them(model);
                


            }
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id = 5, id_2 = 2, id_3 = 7, id_4 = 9, id_5 = 11)]
        public ActionResult Capnhat(int id)
        {
            return View(new maping_hang().chitiet(id));
        }
        [HttpPost]
        public ActionResult Capnhat(hang model)
        {
            maping_hang h = new maping_hang();
            if (String.IsNullOrEmpty(model.ten))
            {
                ViewBag.err = "Vui lòng nhập tên";
            }
            if (h.capnhat(model) == -1)
            {
                ViewBag.err = "Đã có lỗi xảy ra hãy thao tác lại";
            }
            else
            {
                h.capnhat(model);
            }
            return RedirectToAction("Index");
        }
        [kiemtradangnhap(id = 5, id_2 = 3, id_3 = 6, id_4 = 9, id_5 = 10)]
        public ActionResult Xoa(int id)
        {
            var l = new maping_loai();
            if (l.xoa(id) == -1)
            {
                ViewBag.err = "Đã có lỗi xảy ra hãy thao tác lại";
            }
            else
            {
                l.xoa(id);
            }
            return RedirectToAction("index");

        }
    }
}