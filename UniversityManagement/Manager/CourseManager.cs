using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagement.DAL.Gateway;
using UniversityManagement.Models;

namespace UniversityManagement.Manager
{
    public class CourseManager
    {
        
        CourseGateway aCourseGateway = new CourseGateway();
        internal string Save(Course aCourse)
        {
            try
            {
                if (aCourseGateway.IsExistCourseCode(aCourse.CourseCode))
                {
                    return "Course Code Already Exist";
                }
                else if (aCourseGateway.IsExistCourseName(aCourse.CourseName))
                {
                    return "Course Name Already Exist";
                }
                else
                    if (aCourseGateway.Save(aCourse) > 0)
                    {
                        return "Save Successfully";
                    }
                    else
                    {
                        return "Save Failed";
                    }

            }
            catch (Exception)
            {

                return "Save Failed";
            }
                
           
        }





        public List<Course> GetAllCourses()
            
        {
           
            return aCourseGateway.GetAllCourses();
        }

        public List<EnrollCourse> GetAllEnrollCourse()
        {
            return aCourseGateway.GetAllEnrollCourse();
        }

        public List<ViewCourseStatus> GetAllCoursesStatus()
        {
            return aCourseGateway.GetAllCoursesStatus();
        }

        internal List<ViewCourseSchedule> GetAllCourseSchedule()
        {
            return aCourseGateway.GetAllCourseSchedule();
        }



        internal dynamic UnallocateAllRoom()
        {
            if (aCourseGateway.UnallocateClassRoom()>0)
            {
                return "Class Room Unallocated";
            }
            else
            {
                return "Unallocated Failed";
            }
        }
    }
}