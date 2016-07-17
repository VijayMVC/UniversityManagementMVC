using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class StudentRegistration
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string RegistrationId { get; set; }
        public string StudentEmail { get; set; }
        public string StudentContactNo { get; set; }
        public string StudentDate { get; set; }
        public string StudentAddress { get; set; }
        public int StudentDepartmentId{ get; set; }

        public string  DepartmentName { get; set; }

    }
}