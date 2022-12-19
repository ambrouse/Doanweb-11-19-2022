using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace shopxe_2
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               name: "trangchu",
               url: "Trang-chu",
               defaults: new { controller = "Trangchu", action = "Index", id = UrlParameter.Optional }
           );

            routes.MapRoute(
               name: "dangnhap",
               url: "Trang-chu/Dangnhap-Dangky",
               defaults: new { controller = "Dangnhap", action = "Index", id = UrlParameter.Optional }
           );
            
            

            routes.MapRoute(
               name: "danhsach",
               url: "Trang-chu/Danh-sach-xe",
               defaults: new { controller = "Danhsachxe", action = "Danhsachxemoinhat", id = UrlParameter.Optional }
           );

            routes.MapRoute(
               name: "timkiem",
               url: "Trang-chu/Tim-kiem/{id}",
               defaults: new { controller = "Danhsachxe", action = "timkiem", id = UrlParameter.Optional }
           );

            routes.MapRoute(
              name: "loai",
              url: "Trang-chu/Danh-sach-xe-loai/{id}",
              defaults: new { controller = "Danhsachxe", action = "Danhsachxeloai", id = UrlParameter.Optional }
          );

            routes.MapRoute(
              name: "giohang",
              url: "Trang-chu/Gio-hang/{id}",
              defaults: new { controller = "Giohang", action = "index", id = UrlParameter.Optional }
          );

            routes.MapRoute(
              name: "chitiet",
              url: "Trang-chu/Chi-tiet-xe/{id}",
              defaults: new { controller = "Chitiet", action = "index", id = UrlParameter.Optional }
          );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Trangchu", action = "Index", id = UrlParameter.Optional }
            );
            
        }
    }
}
