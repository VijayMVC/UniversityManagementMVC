using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagement.Models;

namespace UniversityManagement.DAL.Gateway
{
    public class DepartmentGateway
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDbConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection();


        public bool IsExistDepartmentCode(string p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode='" + p + "'";
            string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode=@DepartmentCode";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("DepartmentCode", p);

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

        public bool IsExistDepartmentName(string p)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentName FROM Department WHERE DepartmentName = '" + p + "'";
            string query = "SELECT DepartmentName FROM Department WHERE DepartmentName = @DepartmentName";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("DepartmentName", p);

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

        internal int Save(Department aDepartment)
        {
            connection.ConnectionString = connectionString;

            //string query = "INSERT INTO Department VALUES('" + aDepartment.DepartmentCode + "', '" + aDepartment.DepartmentName + "')";
            string query = "INSERT INTO Department VALUES(@DepartmentCode, @DepartmentName)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("DepartmentCode", aDepartment.DepartmentCode);
            command.Parameters.AddWithValue("DepartmentName", aDepartment.DepartmentName);


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;

        }

        internal List<Department> GetAllDepartment()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT * FROM Department";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Department> departmentList = new List<Department>();

            while (reader.Read())
            {
                Department aDepartment = new Department();
                aDepartment.DepartmentId = (int) reader["DepartmentId"];
                aDepartment.DepartmentCode = reader["DepartmentCode"].ToString();
                aDepartment.DepartmentName = reader["DepartmentName"].ToString();
                departmentList.Add(aDepartment);
            }
            reader.Close();
            connection.Close();

            return departmentList;
        }


        internal List<Semester> GetAllSemester()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT SemesterID, SemesterName FROM Semester";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Semester> semesterList = new List<Semester>();

            while (reader.Read())
            {
                Semester aSemester = new Semester();
                aSemester.SemesterId = (int)reader["SemesterID"];
                aSemester.SemesterName = reader["SemesterName"].ToString();
                semesterList.Add(aSemester);
            }
            reader.Close();
            connection.Close();

            return semesterList;
        }

        internal List<ClassRoom> GetAllClassRoom()
        {
            connection.ConnectionString = connectionString;
            string query = "SELECT RoomId, RoomNumber FROM Room";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ClassRoom> roomList = new List<ClassRoom>();

            while (reader.Read())
            {
                ClassRoom aClassRoom = new ClassRoom();
                aClassRoom.RoomId = (int) reader["RoomId"];
                aClassRoom.RoomNumber = reader["RoomNumber"].ToString();
               roomList.Add(aClassRoom);
            }
            reader.Close();
            connection.Close();

            return roomList;
        }
    }
}