using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class Course
    {
        public int CourseId { set; get; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string CourseCredit { get; set; }
        public string CourseDescription { get; set; }

        public int DepartmentId { get; set; }
        public int SemesterId { get; set; }
    }
}