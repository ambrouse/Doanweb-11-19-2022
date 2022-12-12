using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using shopxe_2.Models;
namespace shopxe_2.Areas.admin.hamxuli
{
    public class kiemtradangnhap : AuthorizeAttribute
    {
        public int id { get; set; }
        public int id_2 { get; set; }
        public int id_3 { get; set; }
        public int id_4 { get; set; }
        public int id_5 { get; set; }
        public override void OnAuthorization(AuthorizationContext context)
        {
            
            var user = (shopxe_2.Models.admin)HttpContext.Current.Session["ad"];
            //kiem tra dang nhap
            if (user != null)
            {
                Database db = new Database();
                int count = db.phanquyens.Where(c => c.iduser == user.id && 
                (c.idquyen == id|| c.idquyen == id_2|| c.idquyen == id_3|| c.idquyen == id_4 || c.idquyen==id_5)).Count();
                if (count > 0)
                {return;}
                else
                {context.Result = new RedirectToRouteResult(new RouteValueDictionary(new{
                        Controller = "Quanlyadmin",
                        action = "khongcoquyen",areas = "admin"}));}}else{
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new{
                        Controller = "Dangnhap",
                        action = "Index",areas = "admin"}));}
        }
    }
}