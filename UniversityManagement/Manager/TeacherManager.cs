using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagement.DAL.Gateway;
using UniversityManagement.Models;

namespace UniversityManagement.Manager
{
    public class TeacherManager
    {
        TeacherGateway aTeacherGateway = new TeacherGateway();
        public List<Designation> GetAllDesignation()
        {
            return aTeacherGateway.GetAllDesignation();
        }

        internal string SaveTeacher(Teacher aTeacher)
        {
            try
            {
                if (aTeacherGateway.IsExistTeacherEmail(aTeacher.Email))
                {
                    return "Email Already Exist";
                }
                else
                    if (aTeacherGateway.SaveTeacher(aTeacher)>0)
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

        public List<Teacher> GetAllTeacher()
        {
            return aTeacherGateway.GetAllTeacher();
        }

        internal string AssignCourse(AsignCourse asignCourse)
        {
            try
            {
                if (aTeacherGateway.IsExistCourseId(asignCourse.CourseId))
                {
                    return "Course already Assigned";
                }

                else if (aTeacherGateway.AssignCourse(asignCourse) > 0)
                {
                    return "CousreAssigned";
                }
                else
                {
                    return "Cousre Assigned Failed";
                }

            }
            catch (Exception)
            {

                return "Cousre Assigned Failed";
            }
            
        }

        internal string GettAllRemainningCredit(int teacherId)
        {
            return aTeacherGateway.TeacherRemainningCredit(teacherId);
        }

        public string UnassigneAllCourses()
        {
            if (aTeacherGateway.UnassignedAllCourse() >0)
            {
                return "Unassigned Succesfully";

            }
            else
            {
                return "Unassigned Failed";
            }
           
        }
    }
}