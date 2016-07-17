using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagement.Models;
using UniversityManagement.Manager;


namespace UniversityManagement.Controllers
{
    public class DepartmentController : Controller
    {

        DepartmentManager aDepartmentManager = new DepartmentManager();
        // GET: Department

        public ActionResult DepartmentView()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            return View();
        }

        public ActionResult Department()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Department(Department aDepartment)
        {
            ViewBag.Message = aDepartmentManager.Save(aDepartment);
            return View();
        }
    }
}