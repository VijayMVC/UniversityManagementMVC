using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagement.Manager;
using UniversityManagement.Models;

namespace UniversityManagement.Controllers
{
    
    public class StudentController : Controller
    {
        DepartmentManager aDepartmentManager = new DepartmentManager();
        StudentManager aStudentManager = new StudentManager();
        CourseManager aCourseManager = new CourseManager();
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EnrollCourse()
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();
            return View();
        }
        [HttpPost]
public ActionResult EnrollCourse(EnrollCourse aEnrollCourse)
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();
            ViewBag.message = aStudentManager.EnrollCourse(aEnrollCourse);
            return View();
        }

        public ActionResult StudentRegistration()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            return View();
        }

        [HttpPost]
        public ActionResult StudentRegistration(StudentRegistration aStudentRegistration)
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AfterRegistration = aStudentManager.Save(aStudentRegistration);
            return View();

        }
        public JsonResult GettAllInfoByStudentId(int studentId)
        {
            var courses = aStudentManager.GetAllStudent();

            var courseList = courses.Where(a => a.StudentId == studentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }


        public JsonResult GettAllCourseByDepartmentId(int departmentId)
        {
            var courses = aCourseManager.GetAllCourses();

            var courseList = courses.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }
        public JsonResult GetAllEnrollCourseByStudentId(int studentId)
        {
            var courses = aCourseManager.GetAllEnrollCourse();

            var courseList = courses.Where(a => a.StudentId == studentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }

        public ActionResult SaveResult()
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();
            return View();
        }

        [HttpPost]
        public ActionResult SaveResult(StudentResult aStudentResult)
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();
            ViewBag.Message = aStudentManager.SaveResult(aStudentResult);
            return View();
        }

        public ActionResult ViewResult()
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();
            
            return View();
        }
        [HttpPost]
        public ActionResult ViewResult(String s)
        {
            ViewBag.AllStudent = aStudentManager.GetAllStudent();

            return View();
        }
        public JsonResult GetAllStudentResultByStudentId(int studentId)
        {
            var result = aStudentManager.GetAllStudentResult();

            var courseList = result.Where(a => a.StudentId == studentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }
    }
}