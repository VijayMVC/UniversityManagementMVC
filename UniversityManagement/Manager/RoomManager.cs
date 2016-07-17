using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagement.DAL.Gateway;
using UniversityManagement.Models;
using UniversityManagement.DAL;

namespace UniversityManagement.Manager
{
    public class RoomManager
    {
        RoomGateway aRoomGateway = new RoomGateway();
     public string Save(ClassRoomAllocation aClassRoom)
        {
         try
         {
             if (aRoomGateway.isexist(aClassRoom))
             {
                 return "Please select different Time";
             }
             else if (aRoomGateway.Save(aClassRoom) > 0)
             {
                 return "Room Allocated Successfully";


             }
             else
             {
                 return "Room Allocation Failed";
             }

         }
         catch (Exception)
         {

             return "Room Allocation Failed";
         }
           
        }
    }
}