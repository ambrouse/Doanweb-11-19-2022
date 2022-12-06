using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Models;
namespace shopxe.Controllers
{
    public class DanhsachxeController : Controller
    {
        // GET: Danhsachxe
        public ActionResult Index( )
        {
                return RedirectToAction("Danhsachxemoinhat");
        }
        public ActionResult Danhsachxemoinhat(String page) {
            Database db = new Database();
            if (String.IsNullOrEmpty(page) || page == "1")
            {
                return View(db.sanphams.OrderByDescending(c => c.id).Take(9).ToList());
            }
            else {
                int x = int.Parse(page)*9-9;
                return View(db.sanphams.OrderByDescending(c => c.id).Skip(x).Take(9).ToList());
            }
        }

        public ActionResult timkiem(String name) {
            Database db = new Database();
            var list = db.sanphams.Where(x => x.ten.ToLower().Contains(name.ToLower()));
            return View(list);
        }
        public ActionResult Danhsachxeloai(String loai) {
            Database db = new Database();
            int loai_ = int.Parse(loai);
            var list = db.sanphams.Where(x => x.loai == loai_);
            return View("timkiem",list);
        }

    }
}