using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 商城百媚.Models;

namespace 商城百媚.Controllers
{
    public class HomeController : Controller
    {
        ChangDBEntities6 db = new ChangDBEntities6();
        public ActionResult Index()
        {
            return View();
        }
        //分类查询
        //默认排序
        public ActionResult News()
        {
            List<Category> nan = db.Categories.Where(c => c.ParentID == 5).ToList();
            int[] nanid = new int[nan.Count];
            for (int i = 0; i < nanid.Length; i++)
            {
                nanid[i] = nan[i].CateID;
            }
            var product3 = from p in db.Products where (nanid).Contains(p.CateID) select p;
            ViewBag.Product3 = product3.Take(5).ToList();
            return View();
        }
        //热销
        public ActionResult Xiao()
        {
           
            List<Category> nan = db.Categories.Where(c => c.ParentID == 6).ToList();
            int[] nanid = new int[nan.Count];
            for (int i = 0; i < nanid.Length; i++)
            {
                nanid[i] = nan[i].CateID;
            }
            var product3 = from p in db.Products where (nanid).Contains(p.CateID) select p;
            ViewBag.Product3 = product3.Take(5).ToList();
            return View();
        }
        //价格
        public ActionResult Price()
        {
            
            List<Category> nan = db.Categories.Where(c => c.ParentID == 7).ToList();
            int[] nanid = new int[nan.Count];
            for (int i = 0; i < nanid.Length; i++)
            {
                nanid[i] = nan[i].CateID;
            }
            var product3 = from p in db.Products where (nanid).Contains(p.CateID) select p;
            ViewBag.Product3 = product3.Take(5).ToList();
            return View();
        }
        //折扣
        public ActionResult Zhe()
        {
            
            List<Category> nan = db.Categories.Where(c => c.ParentID == 8).ToList();
            int[] nanid = new int[nan.Count];
            for (int i = 0; i < nanid.Length; i++)
            {
                nanid[i] = nan[i].CateID;
            }
            var product3 = from p in db.Products where (nanid).Contains(p.CateID) select p;
            ViewBag.Product3 = product3.Take(5).ToList();
            return View();
        }

        /// <summary>
        /// 退出
        /// </summary>
        public ActionResult Logout()
        {
            MyAuthentication.LogOut();
            return Redirect("/Shou/Index");
        }
    }
}