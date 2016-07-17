using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class AsignCourse
    {
        public int DepartmentId { get; set; }
        public int TeacherId { get; set; }
        public int CreditToTake { get; set; }

        public int RemainningCredit { get; set; }
        public int CourseId { get; set; }

        public string CourseName { get; set; }

        public string CourseCredit { get; set; }
        public string CourseStatus { get; set; }
    }
}