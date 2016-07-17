using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagement.Manager;
using UniversityManagement.Models;

namespace UniversityManagement.Controllers
{
    public class ClassRoomController : Controller
    {
        DepartmentManager aDepartmentManager = new DepartmentManager();
        CourseManager aCourseManager = new CourseManager();
        RoomManager aRoomManager = new RoomManager();
        //
        // GET: /ClassRoom/
        public ActionResult Index()
        {
           
            return View();


        }

        public ActionResult UnAllocateClassRoom()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UnAllocateClassRoom(string unallocate)
        {
            ViewBag.Message = aCourseManager.UnallocateAllRoom();
            return View();
        }

        public ActionResult ViewClassRoomAllocation()
        {
            
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            return View();
        }

        public JsonResult GetCourseScheduleByDepartmentId(int departmentId)
        {
            List<ViewCourseSchedule> aCourseSchedules = aCourseManager.GetAllCourseSchedule();
            var courseScheduleList = aCourseSchedules.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(courseScheduleList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AllocateClassRoom()
        {
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllClassRoom = aDepartmentManager.GetAllClassRoom();
            return View();
        }
        [HttpPost]
        public ActionResult AllocateClassRoom(ClassRoomAllocation aClassRoom)
        {
            ViewBag.Message = aRoomManager.Save(aClassRoom);
            ViewBag.AllDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.AllClassRoom = aDepartmentManager.GetAllClassRoom();
            return View();
        }

        public JsonResult GettAllCourseByDepartmentId(int departmentId)
        {
            var courses = aCourseManager.GetAllCourses();

            var courseList = courses.Where(a => a.DepartmentId == departmentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);


        }

    }
}