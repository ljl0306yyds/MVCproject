using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using 商城百媚.Models;

namespace 商城百媚.Controllers
{
    public class ShouController : Controller
    {
        ChangDBEntities6 db = new ChangDBEntities6();
        // GET: Shou
        //首页
        public ActionResult Index(int ?id)
        {
            //衣服
            List<Category> cates = db.Categories.Where(c => c.ParentID == 4).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(4).ToList();
            //裤子
            List<Category> cate = db.Categories.Where(c => c.ParentID == 5).ToList();
            int[] cateid = new int[cate.Count];
            for (int i = 0; i < cateid.Length; i++)
            {
                cateid[i] = cate[i].CateID;
            }
            var product2 = from p in db.Products where (cateid).Contains(p.CateID) select p;
            ViewBag.Product2 = product2.Take(3).ToList();
            //鞋子
            List<Category> nan = db.Categories.Where(c => c.ParentID == 6).ToList();
            int[] nanid = new int[nan.Count];
            for (int i = 0; i < nanid.Length; i++)
            {
                nanid[i] = nan[i].CateID;
            }
            var product3 = from p in db.Products where (nanid).Contains(p.CateID) select p;
            ViewBag.Product3 = product3.Take(3).ToList();
            Product product = db.Products.Find(id);
            return View(product);
        }

        //衣服
        public ActionResult Gril()
        {
            List<Category> cates = db.Categories.Where(c => c.ParentID == 4).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(5).ToList();
            return View();
        }
        //鞋子
        public ActionResult Boys()
        {
           
            List<Category> cates = db.Categories.Where(c => c.ParentID == 6).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(5).ToList();
            return View();
        }


        //手表
        public ActionResult Beauty()
        {
            List<Category> cates = db.Categories.Where(c => c.ParentID == 7).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(5).ToList();
            return View();
        }
        //裙子
        public ActionResult Furniture()
        {
            List<Category> cates = db.Categories.Where(c => c.ParentID == 8).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(5).ToList();
            return View();
        }
        //裤子
        public ActionResult Child()
        {
            List<Category> cates = db.Categories.Where(c => c.ParentID == 5).ToList();
            int[] cateids = new int[cates.Count];
            for (int i = 0; i < cateids.Length; i++)
            {
                cateids[i] = cates[i].CateID;
            }
            var product1 = from p in db.Products where (cateids).Contains(p.CateID) select p;
            ViewBag.Product1 = product1.Take(5).ToList();
            return View();
        }

        //搜索
        public ActionResult Search(string pname)
        {
            ViewBag.search = pname;
            //模糊查询
            var products = from product in db.Products where product.Title.Contains(pname) select product;
            return View(products.ToList());
        }
        //登录
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string name, string pwd)
        {
            var user = db.Users.SingleOrDefault(u => u.UserName.Trim() == name.Trim() && u.Pwd.Trim() == pwd.Trim());
            if (user != null)
            {
                MyAuthentication.SetCookie(user.Nick, user.UserID.ToString(), "user");
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "账号或密码错误！");
            return View();
        }
        //注册
        public ActionResult Reg()
        {
            return View(new User());
        }
        //接收注册页面的数据
        [HttpPost]
        public ActionResult Reg(User user)
        {
            try
            {
                using (ChangDBEntities6 db = new ChangDBEntities6())
                {
                    if (db.Users.Any(x =>x.UserName == user.UserName))
                    {
                        TempData["msg"] = "该用户名已被注册！";
                        return View();
                    }

                    if (ModelState.IsValid)
                    {
                        db.Users.Add(user);
                        if (db.SaveChanges() > 0)
                        {
                            return Content("<script>alert('注册成功！');location.href='/shou/login'</script>");
                        }
                    }
                    return View("Reg");
                }
            }
            catch (Exception)
            {
                TempData["msg"] = "注册失败";
            }
            return View();
        }
    }
}
