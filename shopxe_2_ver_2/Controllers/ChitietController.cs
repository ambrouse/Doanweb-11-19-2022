using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe_2.Models;
namespace shopxe.Controllers
{
    public class ChitietController : Controller
    {
        // GET: admin/Chitiet
        public ActionResult Index(int id)
        {
            Database db = new Database();
            var x = db.sanphams.Find(id);
            return View(x);
        }
        [HttpPost]
        public ActionResult index(int id, int danhgia, String chat) {
            if (Session["user"] == null) {
                return RedirectToRoute(new { controller = "Dangnhap", action = "index" });
            }
            if (danhgia < 0 || danhgia > 10) {
                return RedirectToRoute(new { controller = "Chitiet", action = "index", id = id });

            }
            if (String.IsNullOrEmpty(chat)) {
                return RedirectToRoute(new { controller = "Chitiet", action = "index", id = id });

            }
            Database db = new Database();
            user u =(user)Session["user"];
            chat ch = new chat();
            int? dg=0;

            if (db.chats.Where(c => c.iduser == u.id&&c.idsanpham==id).Count() > 0) {
                var update = db.chats.FirstOrDefault(c=>c.iduser==u.id&&c.idsanpham==id);
                update.chat1 = chat;
                update.danhgia = danhgia;
                update.tenuser = u.ten;
                if (db.chats.Where(c => c.idsanpham == id).Count() > 0)
                {
                    dg = (db.sanphams.Find(id).danhgia + danhgia) / 2;
                }
                else {
                    dg = danhgia;
                }
                    db.sanphams.Find(id).danhgia = dg;
                    db.SaveChanges();
                    return RedirectToRoute(new { controller = "Chitiet", action = "index", id = id });
            }
            else {
                ch.chat1 = chat;
                ch.idsanpham = id;
                ch.danhgia = danhgia;
                ch.iduser = u.id;
                ch.tenuser = u.ten;

                db.chats.Add(ch);
                if (db.chats.Where(c => c.idsanpham == id).Count() > 0)
                {
                    dg = (db.sanphams.Find(id).danhgia + danhgia) / 2;
                }
                else
                {
                    dg = danhgia;
                }
                db.sanphams.Find(id).danhgia = dg;
                db.SaveChanges();
                
            }


            return RedirectToRoute(new { controller = "Chitiet", action = "index",id=id});
        }
    }
}