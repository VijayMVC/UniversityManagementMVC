using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagement.Models;
using UniversityManagement.DAL.Gateway;

namespace UniversityManagement.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway aDepartmentGateway = new DepartmentGateway();
        public string Save(Department aDepartment)
        {
            try
            {
                if (aDepartmentGateway.IsExistDepartmentCode(aDepartment.DepartmentCode))
                {
                    return "Department Code Already Exist";
                }
                else if (aDepartmentGateway.IsExistDepartmentName(aDepartment.DepartmentName))
                {
                    return "Department Name Already Exist";
                }
                else
                    if (aDepartmentGateway.Save(aDepartment) > 0)
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

        internal List<Department> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }

        internal List<Semester> GetAllSemester()
        {
           return aDepartmentGateway.GetAllSemester();
        }

        internal List<ClassRoom> GetAllClassRoom()
        {
            return aDepartmentGateway.GetAllClassRoom();
        }
    }
}