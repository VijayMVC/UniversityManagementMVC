using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagement.Manager;
using UniversityManagement.Models;

namespace UniversityManagement.Controllers
{
    public class TeacherController : Controller
    {
        TeacherManager aTeacherManager = new TeacherManager();
        DepartmentManager aDepartmentManager = new DepartmentManager();
        CourseManager aCourseManager = new CourseManager();
        // GET: Teacher
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UnAssignCourses()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UnAssignCourses( String unassigned)
        {
            ViewBag.Message = aTeacherManager.UnassigneAllCourses();
            return View();
        }

        public ActionResult TestAssignCourse()
        {
            return View();
        }

        [HttpPost]
        public ActionResult TestAssignCourse(AsignCourse asignCourse)
        {
            return View();
        }


        public ActionResult AssignCourse()
        {
            ViewBag.AllTeacher = aTeacherManager.GetAllTeacher();
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
           
            return View();
        }

        [HttpPost]
        public ActionResult AssignCourse(AsignCourse asignCourse)
        {
            ViewBag.AllTeacher = aTeacherManager.GetAllTeacher();
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.Message = aTeacherManager.AssignCourse(asignCourse);

            return View();
        }

        public JsonResult GetTeachersByDepartmentId(int departmentId)
        {
            var teachers = aTeacherManager.GetAllTeacher();
            var teacherList = teachers.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(teacherList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GettAllCourseByDepartmentId(int departmentId)
        {
            var courses = aCourseManager.GetAllCourses();

            var courseList = courses.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }
        public JsonResult GetAllCouseByCourseId(int courseId)
        {
            var courses = aCourseManager.GetAllCourses();

            var courseList = courses.Where(a => a.CourseId == courseId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);
        }

        public string GettRemainningCreditByTeacherId(int cropName)
        {
            string teacherCredit = aTeacherManager.GettAllRemainningCredit(cropName);

            return teacherCredit;

        }

        public ActionResult SaveTeacher()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllDesignation = aTeacherManager.GetAllDesignation();


            return View();
        }
        [HttpPost]
        public ActionResult SaveTeacher(Teacher aTeacher)
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllDesignation = aTeacherManager.GetAllDesignation();
            ViewBag.Message = aTeacherManager.SaveTeacher(aTeacher);


            return View();
        }

       
    }
}