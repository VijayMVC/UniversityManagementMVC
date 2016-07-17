using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Ajax.Utilities;
using UniversityManagement.DAL.Gateway;
using UniversityManagement.Models;

namespace UniversityManagement.Manager
{
    public class StudentManager
    {
        StudentGateway aStudentGateway = new StudentGateway();
        public List<StudentRegistration> Save(StudentRegistration aStudentRegistration)
        {
            try
            {
               return aStudentGateway.Save(aStudentRegistration);
               
              
            }
            catch (Exception)
            {
                return Exception;
            }
           
             
        }

        public List<StudentRegistration> Exception { get; set; }

        public List<StudentRegistration> GetAllStudent()
        {
            return aStudentGateway.GetAllStudent();
        }

        internal dynamic EnrollCourse(EnrollCourse aEnrollCourse)
        {
            if (aStudentGateway.EnrolledCourseExist(aEnrollCourse.CourseId))
            {
                return "Course Already Enrolled";
            }
            
            else if (aStudentGateway.EnrollCourse(aEnrollCourse) > 0)
            {
                return "Enrolled Successfull";
            }
            else
            {
                return "Enrolled failed";
            }
        }

        internal string SaveResult(StudentResult aStudentResult)
        {
            if (aStudentGateway.ResultAlreadySaved(aStudentResult.CourseId))
            {
                return "Result Already Saved";
            }
            else if (aStudentGateway.SaveResult(aStudentResult)>0)
            {
                return "result Saved";
            }
            else
            {
                return "Save Failed";
            }
        }

        public List<ViewStudentResult> GetAllStudentResult()
        {
            return aStudentGateway.GetAllStudentResult();
        }
    }
}