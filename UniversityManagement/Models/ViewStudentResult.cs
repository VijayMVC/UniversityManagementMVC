using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class ViewStudentResult
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string RegistrationId { get; set; }
        public string StudentEmail { get; set; }
        public string DepartmentName { get; set; }

        public int CourseId { get; set; }
        public string CourseCode { get; set; }
        public string Grade { get; set; }
        public string CourseName { get; set; }
    }
}