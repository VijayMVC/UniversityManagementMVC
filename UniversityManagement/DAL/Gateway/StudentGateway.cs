using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagement.Models;

namespace UniversityManagement.DAL.Gateway
{
    public class StudentGateway
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDbConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection();
        public List<StudentRegistration> Save(StudentRegistration aStudentRegistration)
        {
            connection.ConnectionString = connectionString;
            string Date = aStudentRegistration.StudentDate;
            string departMentName = "";
            string[] date = Date.Split('/');
            string year = date[2];
            string query1 = "SELECT DepartmentCode,DepartmentName FROM Department WHERE DepartmentID = '" + aStudentRegistration.StudentDepartmentId + "'";
            SqlCommand command1 = new SqlCommand(query1, connection);
            connection.Open();
            SqlDataReader reader = command1.ExecuteReader();
            string departmentCode = "";
            while (reader.Read())
            {
                departMentName = reader["DepartmentName"].ToString();
                departmentCode = reader["DepartmentCode"].ToString();
                
            }
            reader.Close();
            
            connection.Close();
            string query2 = "SELECT TOP 1 RegistrationId FROM Student ORDER BY StudentId DESC ";
            SqlCommand command2 = new SqlCommand(query2, connection);
            connection.Open();
            SqlDataReader reader2 = command2.ExecuteReader();
            string regCode = "";
            while (reader2.Read())
            {
                regCode = reader2["RegistrationId"].ToString();

            }
            reader.Close();

            connection.Close();
            string finalRegNum = "";
            int regNumber;
            if (regCode == "")
            {
                
                finalRegNum ="001";
            }
            else
            {
            string[] regcodes = regCode.Split('-');
            string last = regcodes[2];
            regNumber = Convert.ToInt32(last) + 1;
            finalRegNum = Convert.ToString(regNumber);
                if (finalRegNum.Length<2)
                {
                    finalRegNum = "00" + finalRegNum;

                }else if (finalRegNum.Length ==2)
                {
                    finalRegNum = "0" + finalRegNum;
                }
                 }
            





            
            String registrationId = departmentCode + "-" + year + "-"+finalRegNum;
            aStudentRegistration.RegistrationId = registrationId;
            aStudentRegistration.DepartmentName = departMentName;

            
           

            //string query = "INSERT INTO Student VALUES('" + re + "', '" + aDepartment.DepartmentName + "')";
            string query = "INSERT INTO Student VALUES(@RegistrationId, @StudentName, @StudentEmail, @StudentContactNo, @StudentDate, @StudentAddress, @StudentDepartmentId)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("RegistrationId", registrationId);
            command.Parameters.AddWithValue("StudentName", aStudentRegistration.StudentName);
            command.Parameters.AddWithValue("StudentEmail", aStudentRegistration.StudentEmail);
            command.Parameters.AddWithValue("StudentContactNo",aStudentRegistration.StudentContactNo );
            command.Parameters.AddWithValue("StudentDate", aStudentRegistration.StudentDate);
            command.Parameters.AddWithValue("StudentAddress", aStudentRegistration.StudentAddress);
            command.Parameters.AddWithValue("StudentDepartmentId", aStudentRegistration.StudentDepartmentId );
            List<StudentRegistration> aRegistrations = new List<StudentRegistration>();
           aRegistrations.Add(aStudentRegistration);
           


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return aRegistrations;
        }

        internal dynamic GetAllStudent()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM StudentWithDepartment";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<StudentRegistration> studentList = new List<StudentRegistration>();

            while (reader.Read())
            {
               StudentRegistration aStudentRegistration = new StudentRegistration();
                aStudentRegistration.StudentId = (int) reader["StudentId"];
                aStudentRegistration.RegistrationId = reader["RegistrationId"].ToString();
                aStudentRegistration.StudentName = reader["StudentName"].ToString();
                aStudentRegistration.StudentEmail = reader["StudentEmail"].ToString();
                aStudentRegistration.StudentContactNo = reader["StudentContactNo"].ToString();
                aStudentRegistration.StudentDate = reader["StudentDate"].ToString();
                aStudentRegistration.StudentAddress = reader["StudentAddress"].ToString();
                aStudentRegistration.StudentDepartmentId = (int)reader["StudentDepartmentId"];
                aStudentRegistration.DepartmentName = reader["DepartmentName"].ToString();
                studentList.Add(aStudentRegistration);
            }
            reader.Close();
            connection.Close();

            return studentList;
        }

        internal int EnrollCourse(EnrollCourse aEnrollCourse)
        {
            connection.ConnectionString = connectionString;

            //string query = "INSERT INTO Department VALUES('" + aDepartment.DepartmentCode + "', '" + aDepartment.DepartmentName + "')";
            string query = "INSERT INTO EnrollCourse VALUES(@StudentId, @StudentName, @Email, @DepartmentId, @DepartmentName,@CourseId,@Date,@CourseStatus)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("StudentId", aEnrollCourse.StudentId);
            command.Parameters.AddWithValue("StudentName", aEnrollCourse.StudentName );
            command.Parameters.AddWithValue("Email", aEnrollCourse.Email);
            command.Parameters.AddWithValue("DepartmentId", aEnrollCourse.DepartmentId);
            command.Parameters.AddWithValue("DepartmentName", aEnrollCourse.DepartmentName );
            command.Parameters.AddWithValue("CourseId", aEnrollCourse.CourseId );
            command.Parameters.AddWithValue("Date",  aEnrollCourse.Date);
            command.Parameters.AddWithValue("CourseStatus",  "Enrolled");
          


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal bool EnrolledCourseExist(int p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode='" + p + "'";
            string query = "SELECT * FROM EnrollCourse WHERE CourseId=@CourseId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CourseId", p);

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

        internal int SaveResult(StudentResult aStudentResult)
        {
            connection.ConnectionString = connectionString;


            string query = "INSERT INTO StudentResult VALUES(@StudentId, @CourseId, @Grade)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("StudentId", aStudentResult.StudentId);
            command.Parameters.AddWithValue("CourseId", aStudentResult.CourseId);
            command.Parameters.AddWithValue("Grade", aStudentResult.Grade);
            



            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal bool ResultAlreadySaved(int p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode='" + p + "'";
            string query = "SELECT * FROM StudentResult WHERE CourseId=@CourseId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CourseId", p);

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

        internal List<ViewStudentResult> GetAllStudentResult()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM StudentResultDetails ";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ViewStudentResult> studenResultList = new List<ViewStudentResult>();

            while (reader.Read())
            {
                ViewStudentResult aStudentResult = new ViewStudentResult();
                aStudentResult.StudentId = (int) reader["StudentId"];
                aStudentResult.StudentName = reader["StudentName"].ToString();
                aStudentResult.RegistrationId =  reader["RegistrationId"].ToString();
                aStudentResult.StudentEmail = reader["StudentEmail"].ToString();
                aStudentResult.DepartmentName = reader["DepartmentName"].ToString();
                aStudentResult.CourseId = (int)reader["CourseId"];
                aStudentResult.CourseCode = reader["CourseCode"].ToString();
                string s = reader["Grade"].ToString();
                if (s=="")
                {
                    aStudentResult.Grade = "Not Graded Yet";
                }
                else
                {
                    aStudentResult.Grade = s;
                }
                aStudentResult.CourseName = reader["CourseName"].ToString();
                studenResultList.Add(aStudentResult);
            }
            reader.Close();
            connection.Close();

            return studenResultList;
        }
    }
}