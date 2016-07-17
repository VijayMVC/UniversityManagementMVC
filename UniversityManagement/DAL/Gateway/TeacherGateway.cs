using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagement.Models;

namespace UniversityManagement.DAL.Gateway
{
    public class TeacherGateway
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDbConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection();
        internal List<Designation> GetAllDesignation()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM Designation";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Designation> designationList = new List<Designation>();

            while (reader.Read())
            {
                Designation aDesignation = new Designation();
                aDesignation.DesignationId = (int)reader["DesignationId"];
                aDesignation.DesignationName = reader["DesignationName"].ToString();
                designationList.Add(aDesignation);
            }
            reader.Close();
            connection.Close();

            return designationList;
        }

        internal bool IsExistTeacherEmail(string p)
        {
            connection.ConnectionString = connectionString;

           
            string query = "SELECT TeacherEmail FROM Teacher WHERE TeacherEmail=@TeacherEmail";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("TeacherEmail", p);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                connection.Close();
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }

        internal int SaveTeacher(Teacher aTeacher)
        {
            connection.ConnectionString = connectionString;


            string query = "INSERT INTO Teacher VALUES(@TeacherName, @TeacherAddress, @TeacherEmail, @TeacherContactNo, @TeacherDesignation, @TeacherDepartmentId, @TeacherCredit)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("TeacherName", aTeacher.TeacherName);
            command.Parameters.AddWithValue("TeacherAddress", aTeacher.Address);
            command.Parameters.AddWithValue("TeacherEmail", aTeacher.Email);
            command.Parameters.AddWithValue("TeacherContactNo", aTeacher.ContactNo);
            command.Parameters.AddWithValue("TeacherDesignation", aTeacher.DesignationId);
            command.Parameters.AddWithValue("TeacherDepartmentId", aTeacher.DepartmentId);
            command.Parameters.AddWithValue("TeacherCredit", aTeacher.CreditToTake);


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal List<Teacher> GetAllTeacher()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM Teacher";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Teacher> teacherList = new List<Teacher>();

            while (reader.Read())
            {
                Teacher aTeacher = new Teacher();
                aTeacher.TeacherId = (int)reader["TeacherId"];
                aTeacher.TeacherName = reader["TeacherName"].ToString();
                aTeacher.Address = reader["TeacherAddress"].ToString();
                aTeacher.Email = reader["TeacherEmail"].ToString();
                aTeacher.ContactNo = reader["TeacherContactNo"].ToString();
                aTeacher.DesignationId = (int)reader["TeacherDesignation"];
                aTeacher.DepartmentId = (int) reader["TeacherDepartmentId"];
                aTeacher.CreditToTake = (int) reader["TeacherCredit"];
                teacherList.Add(aTeacher);
            }
            reader.Close();
            connection.Close();

            return teacherList;
        }

        internal int AssignCourse(AsignCourse asignCourse)
        {
            connection.ConnectionString = connectionString;
            string courseStatus = "Assigned";


            string query = "INSERT INTO AssignCourse VALUES(@DepartmentId, @TeacherId, @CousreId, @CourseStatus)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("DepartmentId", asignCourse.DepartmentId);
            command.Parameters.AddWithValue("TeacherId", asignCourse.TeacherId);
            command.Parameters.AddWithValue("CousreId", asignCourse.CourseId);
            command.Parameters.AddWithValue("CourseStatus", courseStatus);
            


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal string TeacherRemainningCredit(int teacherId)
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM TeacherReamainnigCredit Where TeacherId = '"+teacherId+"'";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            String remainningCredit = "";

            while (reader.Read())
            {
                remainningCredit = reader["TotalCredit"].ToString();
            }
            reader.Close();
            connection.Close();

            return remainningCredit;
        }

        internal bool IsExistCourseId(int p)
        {
            connection.ConnectionString = connectionString;


            string query = "SELECT * FROM AssignCourse WHERE CousreId=@CousreId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CousreId", p);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                connection.Close();
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }

        public int UnassignedAllCourse()
        {
            connection.ConnectionString = connectionString;


            string query = "UPDATE AssignCourse SET CourseStatus='Unassigned' WHERE CourseStatus='Assigned';";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }
    }
}