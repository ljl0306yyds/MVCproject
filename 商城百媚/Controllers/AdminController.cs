
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;
using 商城百媚.Models;

namespace 商城百媚.Controllers
{
   
    public class AdminController : Controller
    {
        // GET: Admin
        ChangDBEntities6 db = new ChangDBEntities6();
        //首页
        [AdminAuthentication]
        public ActionResult Index(int? id, string pname="")
        {
            var list = db.Products.Where(p => p.Title.Contains(pname));

            int pageIndex = id ?? 1;
            PagedList<Product> mPage = list.AsQueryable().OrderByDescending(x => x.PostTime).ToPagedList(pageIndex, 10);
            return View(mPage);
        }
        //商品上架
        [AdminAuthentication]
        public ActionResult Add()
        {
            return View(new Product());
        }
        //下拉框
        //商品接受表单数据
        [HttpPost]
        [AdminAuthentication]
        public ActionResult Add(Product product, HttpPostedFileBase Photo)
        {
            if (ModelState.IsValid)
            {
                if (Photo != null)
                {
                    product.Photo = Photo.FileName;
                    Photo.SaveAs(Server.MapPath("/image/" + product.Photo));
                }

                db.Products.Add(product);
                if (db.SaveChanges() > 0)
                {
                    return RedirectToAction("Index");
                }
            }
            return View();
        }
        //修改商品
        [AdminAuthentication]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CateID = new SelectList(db.Categories, "CateID", "CateName", product.CateID);
            return View(product);
        }

        [HttpPost]
        [AdminAuthentication]
        public ActionResult Edit([Bind(Include = "ProductID,Title,CateID,MarketPrice,Price,Content,PostTime,Stock,Photo")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CateID = new SelectList(db.Categories, "CateID", "CateName", product.CateID);
            return View(product);
        }

        [HttpPost]
        [AdminAuthentication]
        public ActionResult Detail(Product product)
        {
            if (ModelState.IsValid)
            {             
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();            
                return RedirectToAction("Index");
          }
            return View(product);
        }

        //商品删除
        [AdminAuthentication]
        public ActionResult Del(int id)
        {
            var product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("index");
        }

        //管理员登录
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(string UserName, string UserPwd)
        {
            if (ModelState.IsValid)
            {
                var user = db.AdminUsers.SingleOrDefault(u => u.UserName.Trim() == UserName.Trim() && u.Pwd.Trim() == UserPwd.Trim());
                if (user != null)
                {
                    MyAuthentication.SetCookie(user.UserName, user.SuID.ToString(), "admin");
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "账号或密码错误！");
                return View();
            }
            return View();
        }
       // 退出
        public ActionResult Logi()
        {
            MyAuthentication.LogOut();
            return RedirectToAction("Index");
        }

        //订单列表
        [AdminAuthentication]
        public ActionResult Ding(int? id,int? states)
        {
            List<Order>list;
            if(states == null)
            {
                list = db.Orders.Include(o => o.Delivery).Include(o => User)
                    .OrderByDescending(o => o.Orderdate).ToList();
            }
            else
            {
                list = db.Orders.Where(o => o.States == states).Include(o => o.Delivery)
                    .Include(o => o.User).OrderByDescending(o => o.Orderdate).ToList();
            }
            int pageIndex = id ?? 1;
            PagedList<Order> mPage = list.AsQueryable().ToPagedList(pageIndex, 5);
            return View(mPage);
        }

        //订单详情
        [AdminAuthentication]
        public ActionResult Details(int? id)
        {
            Order order = db.Orders.Find(id);
            return View(order);
        }

        /// <summary>
        /// 发货
        /// </summary>
        [AdminAuthentication]
        public ActionResult Send(int id)
        {
            Order o = db.Orders.Find(id);
            o.States = 2;
            db.SaveChanges();
            return Redirect("/Admin/Ding");
        }
    }
}