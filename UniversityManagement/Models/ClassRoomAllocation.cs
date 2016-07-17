using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagement.Models
{
    public class ClassRoomAllocation
    {
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public int RoomId { get; set; }
        public string Day { get; set; }
        public string Fromtime { get; set; }
        public string Totime { get; set; }
        


    }
}