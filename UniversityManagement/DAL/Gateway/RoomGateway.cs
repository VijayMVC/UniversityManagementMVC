using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagement.Models;

namespace UniversityManagement.DAL.Gateway
{
    public class RoomGateway
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDbConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection();
        public int Save(ClassRoomAllocation aClassRoom)
        {
            connection.ConnectionString = connectionString;

            //string query = "INSERT INTO AllocatedRoom VALUES('" + aDepartment.DepartmentCode + "', '" + aDepartment.DepartmentName + "')";
            string query = "INSERT INTO AllocatedRoom VALUES(@DepartmentId, @CourseId, @RoomId, @Day, @Fromtime, @Totime, @AllocateStatus)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("DepartmentId", aClassRoom.DepartmentId);
            command.Parameters.AddWithValue("CourseId", aClassRoom.CourseId );
             command.Parameters.AddWithValue("RoomId", aClassRoom.RoomId);
             command.Parameters.AddWithValue("Day", aClassRoom.Day);
             command.Parameters.AddWithValue("Fromtime", aClassRoom.Fromtime);
             command.Parameters.AddWithValue("Totime", aClassRoom.Totime);
            command.Parameters.AddWithValue("AllocateStatus", "Allocated");


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        internal bool isexist(ClassRoomAllocation aClassRoom)
        {
            connection.ConnectionString = connectionString;

            //string query = "SELECT DepartmentCode FROM Department WHERE DepartmentCode='" + p + "'";
            string query = "SELECT * FROM AllocatedRoom WHERE RoomId = @RoomId and Day = @Day and Fromtime=@Fromtime";
            SqlCommand command = new SqlCommand(query, connection);
            
            command.Parameters.AddWithValue("RoomId", aClassRoom.RoomId);
            command.Parameters.AddWithValue("Day", aClassRoom.Day);
            command.Parameters.AddWithValue("Fromtime", aClassRoom.Fromtime);
            

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
    }
}