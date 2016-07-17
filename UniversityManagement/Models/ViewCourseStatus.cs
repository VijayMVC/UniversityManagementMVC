using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class ViewCourseStatus
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public int CourseId { get; set; }
        public string CourseCode{ get; set; }
        public string CourseName{ get; set; }
        public int Semester { get; set; }
        public string SemesterName { get; set; }
        public string TeacherName{ get; set; }
        public string CourseStatus { get; set; }

    }
}