using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagement.Manager;
using UniversityManagement.Models;

namespace UniversityManagement.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        DepartmentManager aDepartmentManager = new DepartmentManager();
        CourseManager aCourseManager = new CourseManager();
        public ActionResult CourseEntry()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllSemester = aDepartmentManager.GetAllSemester();
            return View();
        }

        [HttpPost]
        public ActionResult CourseEntry(Course aCourse)
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllSemester = aDepartmentManager.GetAllSemester();
            ViewBag.Message=aCourseManager.Save(aCourse);
            return View();
        }

        public ActionResult CourseStatistics()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllCouseStatus = aCourseManager.GetAllCoursesStatus();
            return View();
        }
        public JsonResult GetCourseByDepartmentId(int departmentId)
        {
            var allCouseStatus = aCourseManager.GetAllCoursesStatus();
            var teacherList = allCouseStatus.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(teacherList, JsonRequestBehavior.AllowGet);
        }


    }
}