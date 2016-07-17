using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using UniversityManagement.Models;

namespace UniversityManagement.DAL.Gateway
{
    public class CourseGateway
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDbConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection();
        internal bool IsExistCourseCode(string p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode='" + p + "'";
            string query = "SELECT CourseCode FROM Course WHERE CourseCode=@CourseCode";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CourseCode", p);

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

        internal bool IsExistCourseName(string p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentName FROM Department WHERE DepartmentName = '" + p + "'";
            string query = "SELECT CourseName FROM Course WHERE CourseName = @CourseName";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CourseName", p);

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

        internal int Save(Course aCourse)
        {
            connection.ConnectionString = connectionString;

            //string query = "INSERT INTO Department VALUES('" + aDepartment.DepartmentCode + "', '" + aDepartment.DepartmentName + "')";
            string query = "INSERT INTO Course VALUES(@CourseCode, @CourseName, @CourseCredit, @CourseDescription, @DepartmentId, @SemesterId)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("CourseCode", aCourse.CourseCode);
            command.Parameters.AddWithValue("CourseName", aCourse.CourseName);
            command.Parameters.AddWithValue("CourseCredit",aCourse.CourseCredit);
            command.Parameters.AddWithValue("CourseDescription", aCourse.CourseDescription);
            command.Parameters.AddWithValue("DepartmentId", aCourse.DepartmentId);
            command.Parameters.AddWithValue("SemesterId", aCourse.SemesterId);


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal List<Course> GetAllCourses()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM Course";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Course> courseList = new List<Course>();

            while (reader.Read())
            {
                Course aCourse = new Course();
                aCourse.CourseId = (int) reader["CourseID"];
                aCourse.CourseCode = reader["CourseCode"].ToString();
                aCourse.CourseName = reader["CourseName"].ToString();
                aCourse.CourseCredit = reader["CourseCredit"].ToString();
                aCourse.CourseDescription = reader["CourseDescription"].ToString();
                aCourse.DepartmentId = (int)reader["DepartmentId"];
                aCourse.SemesterId = (int) reader["Semester"];

                courseList.Add(aCourse);
            }
            reader.Close();
            connection.Close();

            return courseList;
        }

        internal List<ViewCourseStatus> GetAllCoursesStatus()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM FinalCourseStatisticDetails";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ViewCourseStatus> viewCourseList = new List<ViewCourseStatus>();

            while (reader.Read())
            {
                ViewCourseStatus viewCourseStatus = new ViewCourseStatus();
                viewCourseStatus.DepartmentId = (int)reader["DepartmentID"];
                viewCourseStatus.DepartmentName = reader["DepartmentName"].ToString();
                viewCourseStatus.CourseId = (int)reader["CourseID"];
                viewCourseStatus.CourseCode = reader["CourseCode"].ToString();
                viewCourseStatus.CourseName = reader["CourseName"].ToString();
                viewCourseStatus.Semester = (int) reader["Semester"];
                viewCourseStatus.SemesterName = reader["SemesterName"].ToString();
                //viewCourseStatus.TeacherName = reader["TeacherName"].ToString();
                string s = reader["TeacherName"].ToString();
                String courseStatus = reader["CourseStatus"].ToString();
                if (courseStatus =="")
                {
                    viewCourseStatus.TeacherName = "Not Assigned Yet";
                }
                else
                {
                    viewCourseStatus.TeacherName = s;
                }


                viewCourseList.Add(viewCourseStatus);
            }
            reader.Close();
            connection.Close();

            return viewCourseList;
        }

        internal List<ViewCourseSchedule> GetAllCourseSchedule()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM FinalSchedule";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ViewCourseSchedule> viewCourseScheduleList = new List<ViewCourseSchedule>();

            while (reader.Read())
            {
                ViewCourseSchedule aCourseSchedule = new ViewCourseSchedule();
                aCourseSchedule.DepartmentId = (int) reader["DepartmentId"];
                aCourseSchedule.CourseId = (int) reader["CourseId"];
                aCourseSchedule.CourseName = reader["CourseName"].ToString();
                aCourseSchedule.CourseCode = reader["CourseCode"].ToString();
                string s = WebUtility.HtmlDecode(reader["Schedule"].ToString());
                String enrolledStatus = reader["AllocateStatus"].ToString();
                if (enrolledStatus == "")
                {
                    s = "Not Scheduled Yet";
                    aCourseSchedule.ScheduleInfo = s;
                }
                else
                {
                    aCourseSchedule.ScheduleInfo = s;
                    
                }
               


                viewCourseScheduleList.Add(aCourseSchedule);
            }
            reader.Close();
            connection.Close();

            return viewCourseScheduleList;
        }

        internal List<EnrollCourse> GetAllEnrollCourse()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM StudentEnrolled Where CourseStatus = 'Enrolled'";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<EnrollCourse> enrollCourseList = new List<EnrollCourse>();

            while (reader.Read())
            {
                EnrollCourse aEnrollCourse = new EnrollCourse();
                aEnrollCourse.StudentId = (int) reader["StudentId"];
                aEnrollCourse.StudentName = reader["StudentName"].ToString();
                aEnrollCourse.Email = reader["StudentEmail"].ToString();
                aEnrollCourse.DepartmentName = reader["DepartmentName"].ToString();
                aEnrollCourse.CourseId = (int) reader["CourseId"];
                aEnrollCourse.Date = reader["Date"].ToString();
                aEnrollCourse.CourseCode = reader["CourseCode"].ToString();


               enrollCourseList.Add(aEnrollCourse);
            }
            reader.Close();
            connection.Close();

            return enrollCourseList;
        }

        internal int UnallocateClassRoom()
        {
            connection.ConnectionString = connectionString;


            string query = "UPDATE AllocatedRoom SET AllocateStatus='Unallocated' WHERE AllocateStatus='Allocated';";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }
    }
}