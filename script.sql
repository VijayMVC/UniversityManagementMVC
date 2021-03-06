USE [master]
GO
/****** Object:  Database [UniversityCRMSystem]    Script Date: 1/30/2016 3:09:43 AM ******/
CREATE DATABASE [UniversityCRMSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCRMSystem', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityCRMSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCRMSystem_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityCRMSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCRMSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCRMSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCRMSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCRMSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCRMSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCRMSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCRMSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCRMSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCRMSystem] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCRMSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCRMSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCRMSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCRMSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCRMSystem]
GO
/****** Object:  Table [dbo].[AllocatedRoom]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocatedRoom](
	[AllocatedRoomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NULL,
	[Day] [varchar](50) NULL,
	[Fromtime] [varchar](50) NULL,
	[Totime] [varchar](50) NULL,
	[AllocateStatus] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssignCourse]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssignCourse](
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CousreId] [int] NOT NULL,
	[CourseStatus] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[CourseCredit] [decimal](18, 0) NULL,
	[CourseDescription] [varchar](max) NULL,
	[DepartmentId] [int] NOT NULL,
	[Semester] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department_1] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[EnrollCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](50) NULL,
	[CourseId] [int] NULL,
	[Date] [varchar](50) NULL,
	[CourseStatus] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterID] [int] NOT NULL,
	[SemesterName] [varchar](50) NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationId] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[StudentEmail] [nvarchar](50) NULL,
	[StudentContactNo] [nvarchar](50) NULL,
	[StudentDate] [nvarchar](50) NULL,
	[StudentAddress] [nvarchar](50) NULL,
	[StudentDepartmentId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NULL,
	[Grade] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](50) NULL,
	[TeacherAddress] [varchar](50) NULL,
	[TeacherEmail] [varchar](50) NULL,
	[TeacherContactNo] [varchar](50) NULL,
	[TeacherDesignation] [int] NULL,
	[TeacherDepartmentId] [int] NULL,
	[TeacherCredit] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[StudentWithDepartment]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentWithDepartment]
AS

SELECT
S.StudentId,S.RegistrationId,S.StudentName,S.StudentEmail,S.StudentContactNo,S.StudentDate,S.StudentAddress,S.StudentDepartmentId, D.DepartmentName   
FROM Student S, Department D WHERE S.StudentDepartmentId = D.DepartmentID
GO
/****** Object:  View [dbo].[StudentWithEnrollCourse]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentWithEnrollCourse] AS SELECT E.StudentId, E.CourseStatus,E.CourseId,E.Date, S.StudentName, S.RegistrationId, S.StudentEmail, S.DepartmentName FROM EnrollCourse E LEFT JOIN StudentWithDepartment S ON E.StudentId = S.StudentId
GO
/****** Object:  View [dbo].[StudentEnrolled]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentEnrolled] AS SELECT E.StudentId, E.CourseStatus, E.CourseId, C.CourseCode, E.Date, E.StudentName, E.RegistrationId, E.StudentEmail, 
E.DepartmentName   FROM StudentWithEnrollCourse E LEFT JOIN  Course C ON E.CourseId = c.CourseID
GO
/****** Object:  View [dbo].[AllDeptWithCourse]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllDeptWithCourse] As SELECT distinct 
Department.DepartmentID, Department.DepartmentName,


	Course.CourseID,
      Course.CourseCode
      ,Course.CourseName
	   ,Course.Semester

	 

  FROM Course,Department
  where Department.DepartmentID=Course.DepartmentId 


GO
/****** Object:  View [dbo].[CourseWithAsignedTeacher]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[CourseWithAsignedTeacher] AS SELECT  distinct AssignCourse.DepartmentId, AssignCourse.TeacherId, Teacher.TeacherName, AssignCourse.CousreId From AssignCourse left join Teacher on AssignCourse.TeacherId = Teacher.TeacherId


GO
/****** Object:  View [dbo].[ViewCourseStatistics]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[ViewCourseStatistics] AS SELECT AllDeptWithCourse.DepartmentID ,AllDeptWithCourse.DepartmentName
      ,AllDeptWithCourse.CourseID
      ,AllDeptWithCourse.CourseCode
      ,AllDeptWithCourse.CourseName
      ,AllDeptWithCourse.Semester,
	  CourseWithAsignedTeacher.TeacherName
  FROM AllDeptWithCourse LEFT JOIN CourseWithAsignedTeacher ON AllDeptWithCourse.CourseID = CourseWithAsignedTeacher.CousreId


GO
/****** Object:  View [dbo].[AllDeptWithTeacher]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllDeptWithTeacher] AS SELECT Department.DepartmentID, Department.DepartmentName ,Teacher.TeacherId, Teacher.TeacherName, Teacher.TeacherCredit from Department LEFT JOIN Teacher ON Department.DepartmentID = Teacher.TeacherDepartmentId


GO
/****** Object:  View [dbo].[AllDeptWithTeacherAndCourse]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllDeptWithTeacherAndCourse] AS SELECT AllDeptWithTeacher.DepartmentID, AllDeptWithTeacher.DepartmentName ,AllDeptWithTeacher.TeacherId, AllDeptWithTeacher.TeacherName,AllDeptWithTeacher.TeacherCredit, Course.CourseID, Course.CourseCode,Course.CourseName,Course.CourseCredit from AllDeptWithTeacher  LEFT JOIN Course ON AllDeptWithTeacher.DepartmentID = Course.DepartmentId


GO
/****** Object:  View [dbo].[AllDeptInfo]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[AllDeptInfo] AS SELECT DISTINCT AllDeptWithTeacherAndCourse.DepartmentID, AllDeptWithTeacherAndCourse.DepartmentName ,
AllDeptWithTeacherAndCourse.TeacherId, AllDeptWithTeacherAndCourse.TeacherName,AllDeptWithTeacherAndCourse.TeacherCredit
,AssignCourse.CousreId AS AssignedCourseId, 
AllDeptWithTeacherAndCourse.CourseID as CourseTId, AllDeptWithTeacherAndCourse.CourseCode, AllDeptWithTeacherAndCourse.CourseName,
AllDeptWithTeacherAndCourse.CourseCredit FROM AllDeptWithTeacherAndCourse LEFT JOIN AssignCourse ON AllDeptWithTeacherAndCourse.TeacherId = AssignCourse.TeacherId


GO
/****** Object:  View [dbo].[StudentResultAndInfo]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentResultAndInfo]
AS
SELECT DISTINCT E.StudentId, E.StudentName, E.RegistrationId, E.StudentEmail, E.CourseId, E.CourseCode, E.CourseStatus, E.DepartmentName,
R.Grade
   FROM StudentEnrolled E LEFT JOIN StudentResult R ON E.StudentId = R.StudentId AND E.CourseId = R.CourseId
GO
/****** Object:  View [dbo].[StudentResultDetails]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW
[dbo].[StudentResultDetails] 
AS
SELECT S.StudentId, S.StudentName, S.RegistrationId, S.StudentEmail, S.DepartmentName, S.CourseId, S.CourseCode,
S.Grade, C.CourseName   FROM StudentResultAndInfo S LEFT JOIN  Course C ON S.CourseId = C.CourseID
GO
/****** Object:  View [dbo].[CourseWithRoom]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseWithRoom] As SELECT a.DepartmentId, a.CourseId,  c.CourseCode, c.CourseName, a.RoomId, r.RoomNumber, a.Day, a.Fromtime, a.Totime  FROM AllocatedRoom a, Course c, Room r WHERE a.CourseId = c.CourseID and r.RoomId = a.RoomId
GO
/****** Object:  View [dbo].[ClassRoomSchedul]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClassRoomSchedul] AS SELECT
	DepartmentID, 
	CourseId,
    CourseCode, 
    CourseName, 
   
    CONCAT('R. No: ',RoomNumber,', ',Day,', ',Fromtime,' - ',Totime, '<br/>' ) as ScheduleInfo
FROM CourseWithRoom
GO
/****** Object:  View [dbo].[SCheduleList]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SCheduleList] AS SELECT t1.CourseId,
       Units =REPLACE( (SELECT ScheduleInfo AS [data()]
           FROM ClassRoomSchedul t2
          WHERE t2.CourseId = t1.CourseId
          ORDER BY ScheduleInfo
            FOR XML PATH('')
            ), ' ', '')
      FROM ClassRoomSchedul t1
      GROUP BY CourseId ;
GO
/****** Object:  View [dbo].[CourseSchedule]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseSchedule] AS SELECT C.DepartmentId, S.CourseId, C.CourseName, C.CourseCode,  S.Units 
  FROM SCheduleList S, Course C Where S.CourseId = C.CourseID
GO
/****** Object:  View [dbo].[ViewCourseAllocation]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCourseAllocation] AS SELECT  DISTINCT  C.DepartmentId,  C.CourseId ,C.CourseName, C.CourseCode, C.Units, A.AllocateStatus FROM CourseSchedule C INNER JOIN AllocatedRoom A ON C.CourseId = A.CourseId And C.DepartmentId = A.DepartmentId
GO
/****** Object:  View [dbo].[FinalSchedule]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FinalSchedule] AS SELECT C.DepartmentId, C.CourseId, C.CourseName, C.CourseCode, V.Units as Schedule, V.AllocateStatus FROM  Course C LEFT JOIN ViewCourseAllocation V ON C.CourseId = V.CourseId
GO
/****** Object:  View [dbo].[FinalCourseStatistic]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FinalCourseStatistic] AS  SELECT DISTINCT V.DepartmentID, V.DepartmentName, V.CourseID, V.CourseCode,V.CourseName,V.Semester,V.TeacherName, A.CourseStatus FROM ViewCourseStatistics V LEFT JOIN AssignCourse A ON V.CourseID = A.CousreId
GO
/****** Object:  View [dbo].[FinalCourseStatisticDetails]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FinalCourseStatisticDetails]
AS
SELECT  F.DepartmentID, F.DepartmentName, F.CourseID,F.CourseCode, F.CourseName,F.Semester,S.SemesterName, F.TeacherName,F.CourseStatus FROM FinalCourseStatistic F LEFT JOIN Semester S ON F.Semester = S.SemesterID
GO
/****** Object:  View [dbo].[DepartmenInfo]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DepartmenInfo] As SELECT Department.DepartmentID, Department.DepartmentName, Teacher.TeacherId, Teacher.TeacherName, Teacher.TeacherCredit, Course.CourseID, Course.CourseCode,Course.CourseName,Course.CourseCredit FROM Teacher, Department, Course WHERE Teacher.TeacherDepartmentId = Department.DepartmentID AND Department.DepartmentID= Course.DepartmentId


GO
/****** Object:  View [dbo].[TeacherReamainnigCredit]    Script Date: 1/30/2016 3:09:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeacherReamainnigCredit] AS SELECT a.TeacherId, SUM(b.CourseCredit) AS TotalCredit
  FROM AssignCourse a
  INNER JOIN Course b
  ON a.CousreId = b.CourseID 
  GROUP BY A.TeacherId

GO
SET IDENTITY_INSERT [dbo].[AllocatedRoom] ON 

INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (1, 1, 2, 2, N'Sat', N'2:00 PM', N'3:30 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (2, 1, 4, 1, N'Sat', N'1:00 PM', N'2:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (3, 1, 2, 1, N'Sun', N'1:00 PM', N'2:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (4, 1, 2, 1, N'Tue', N'4:00 PM', N'5:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (5, 2, 3, 5, N'Mon', N'8:00 AM', N'9:00 AM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (6, 2, 3, 9, N'Wed', N'2:00 PM', N'3:00 AM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (7, 2, 3, 7, N'Mon', N'1:30 PM', N'5:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (8, 2, 3, 10, N'Tue', N'4:00 PM', N'7:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (9, 1, 5, 3, N'Mon', N'11:00 PM', N'12:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (11, 1, 5, 6, N'Sun', N'12:00 PM', N'1:00 PM', N'Allocated')
INSERT [dbo].[AllocatedRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [Day], [Fromtime], [Totime], [AllocateStatus]) VALUES (16, 1, 4, 1, N'Sun', N'1:00 AM', N'2:00 AM', N'Allocated')
SET IDENTITY_INSERT [dbo].[AllocatedRoom] OFF
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (2, 6, 8, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (2, 6, 7, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (1, 3, 2, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (1, 3, 4, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (2, 6, 3, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (1, 3, 6, N'Assigned')
INSERT [dbo].[AssignCourse] ([DepartmentId], [TeacherId], [CousreId], [CourseStatus]) VALUES (1, 3, 5, N'Assigned')
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (2, N'Cse-102', N'Computer Fandamentalsd', CAST(5 AS Decimal(18, 0)), N'Basic CSE', 1, 1)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (3, N'Cse-101d', N'Computer Fandamentalfg', CAST(5 AS Decimal(18, 0)), N'Basic CSE', 2, 6)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (4, N'Cse-105', N'Data Minning', CAST(3 AS Decimal(18, 0)), N'Data Integration', 1, 6)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (5, N'Cse-106', N'Calculas', CAST(3 AS Decimal(18, 0)), N'Basic CSE', 1, 5)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (6, N'Cse-111', N'Digital Image Processing', CAST(3 AS Decimal(18, 0)), N'Advanced CSE', 1, 8)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (7, N'MTH-104', N'Linear Algebra', CAST(3 AS Decimal(18, 0)), N'Md. Nurul Amin', 2, 2)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (8, N'MTH-112', N'Differential Calculas', CAST(3 AS Decimal(18, 0)), N'Math', 2, 7)
INSERT [dbo].[Course] ([CourseID], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [Semester]) VALUES (9, N'EEE 105', N'EEE 105 Electrical Circuits II', CAST(3 AS Decimal(18, 0)), N' Course Curriculum of the Department of Electrical and Electronic Engineering  Download or view PDF Version (192 KB)   Courses offered by EEE Department  Core Courses:  EEE 101 Electrical Circuits I 3 credits, 3 hours/week  Circuit variables and elements: Voltage, current, power, energy, independent and dependent sources, resistance. Basic laws: Ohm''s law, Kirchoff''s current and voltage laws. Simple resistive circuits: Series and parallel circuits, voltage and current division, wye-delta transformation. Techniques of circuit analysis: Nodal and mesh analysis including supernode and supermesh. Network theorems: Source transformation, Thevenin''s, Norton''s and superposition theorems with applications in circuits having independent and dependent sources, maximum power transfer condition and reciprocity theorem. Energy storage elements: Inductors and capacitors, series parallel combination of inductors and capacitors. Responses of RL and RC circuits: Natural and step responses.  Magnetic quantities and variables: Flux, permeability and reluctance, magnetic field strength, magnetic potential, flux density, magnetization curve. Laws in magnetic circuits: Ohm''s law and Ampere''s circuital law. Magnetic circuits: series, parallel and series-parallel circuits.   EEE 105 Electrical Circuits II 3 credits, 3 hours/week  Sinusoidal functions: Instantaneous current, voltage, power, effective current and voltage, average power, phasors and complex quantities, impedance, real and reactive power, power factor. Analysis of single phase AC circuits: Series and parallel RL, RC and RLC circuits, nodal and mesh analysis, application of network theorems in AC circuits, circuits with non-sinusoidal excitations, transients in AC circuits, passive filters. Resonance in AC circuits: Series and parallel resonance. Magnetically coupled circuits. Analysis of three phase circuits: Three phase supply, balanced and unbalanced circuits, power calculation.   EEE 106 Electrical Circuits Laboratory 1.5 credits, 3 hours/week  In this course students will perform experiments to verify practically the theories and concepts learned in EEE 101 and EEE 105.   EEE 110 Electrical Circuit Simulation Laboratory 1.5 credits, 3 hours/week  Simulation laboratory based on EEE 101 and EEE 105 theory courses. Students will verify the theories and concepts learned in EEE 101 and EEE 105 using simulation software like PSpice and Matlab. Students will also perform specific design of DC and AC circuits theoretically and by simulation.   EEE 201 Electronics I 3 credits, 3 hours/week  P-N junction as a circuit element: Intrinsic and extrinsic semiconductors, operational principle of p-n junction diode, contact potential, current-voltage characteristics of a diode, simplified DC and AC diode models, dynamic resistance and capacitance. Diode circuits: Half wave and full wave rectifiers, rectifiers with filter capacitor, characteristics of a Zener diode, Zener shunt regulator, clamping and clipping circuits. Bipolar Junction Transistor (BJT) as a circuit element: current components, BJT characteristics and regions of operation, BJT as an amplifier, biasing the BJT for discrete circuits, small signal equivalent circuit models, BJT as a switch. Single stage mid-band frequency BJT amplifier circuits: Voltage and current gain, input and output impedance of a common base, common emitter and common collector amplifier circuits. Metal Oxide Semiconductor Field Effect Transistor (MOSFET) as circuit element: structure and physical operation of an enhancement MOSFET, threshold voltage, Body effect, current-voltage characteristics of an enhancement MOSFET, biasing discrete and integrated MOS amplifier circuits, single-stage MOS amplifiers, MOSFET as a switch, CMOS inverter. Junction Field-Effect-Transistor (JFET): Structure and physical operation of JFET, transistor characteristics, pinch-off voltage. Differential and multistage amplifiers: Description of differential amplifiers, small-signal operation, differential and common mode gains, RC coupled mid-band frequency amplifier.   EEE 203 Energy Conversion I 3 credits, 3 hours/week  Transformer: Ideal transformer- transformation ratio, no-load and load vector diagrams; actual transformer- equivalent circuit, regulation, short circuit and open circuit tests. Three phase induction motor: Rotating magnetic field, equivalent circuit, vector diagram, torque-speed characteristics, effect of changing rotor resistance and reactance on torque-speed curves, motor torque and developed rotor power, no-load test, blocked rotor test, starting and braking and speed control. Single phase induction motor: Theory of operation, equivalent circuit and starting.   EEE 205 Energy Conversion II 3 credits, 3 hours/week  Synchronous Generator: excitation systems, equivalent circuit, vector diagrams at different loads, factors affecting voltage regulation, synchronous impedance, synchronous impedance method of predicting voltage regulation and its limitations. Parallel operation: Necessary conditions, synchronizing, circulating current and vector diagram. Synchronous motor: Operation, effect of loading under different excitation condition, effect of changing excitation, V-curves and starting. DC generator: Types, no-load voltage characteristics, build-up of a self excited shunt generator, critical field resistance, load-voltage characteristic, effect of speed on no-load and load characteristics and voltage regulation. DC motor: Torque, counter emf, speed, torque-speed characteristics, starting and speed regulation. Introduction to wind turbine generators Construction and basic characteristics of solar cells.   EEE 206 Energy Conversion Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 203 and EEE 205. In the second part, students will design simple systems using the principles learned in EEE 203 and EEE 205.   EEE 207 Electronics II 3 credits, 3 hours/week  Frequency response of amplifiers: Poles, zeros and Bode plots, amplifier transfer function, techniques of determining 3 dB frequencies of amplifier circuits, frequency response of single-stage and cascade amplifiers, frequency response of differential amplifiers. Operational amplifiers (Op-Amp): Properties of ideal Op-Amps, non-inverting and inverting amplifiers, inverting integrators, differentiator, weighted summer and other applications of Op-Amp circuits, effects of finite open loop gain and bandwidth on circuit performance, logic signal operation of Op-Amp, DC imperfections. General purpose Op-Amp: DC analysis, small-signal analysis of different stages, gain and frequency response of 741 Op-Amp. Negative feedback: properties, basic topologies, feedback amplifiers with different topologies, stability, frequency compensation. Active filters: Different types of filters and specifications, transfer functions, realization of first and second order low, high and bandpass filters using Op-Amps. Signal generators: Basic principle of sinusoidal oscillation, Op-Amp RC oscillators, LC and crystal oscillators. Power Amplifiers: Classification of output stages, class A, B and AB output stages.   EEE 208 Electronics Laboratory 1.5 credits, 3 hours/week  In this course students will perform experiments to verify practically the theories and concepts learned in EEE 201 and EEE 207.   EEE 209 Engineering Electromagnetics 3 credits, 3 hours/week  Static electric field: Postulates of electrostatics, Coulomb''s law for discrete and continuously distributed charges, Gauss''s law and its application, electric potential due to charge distribution, conductors and dielectrics in static electric field, flux density- boundary conditions; capacitance- electrostatic energy and forces, energy in terms of field equations, capacitance calculation of different geometries; boundary value problems- Poisson''s and Laplace''s equations in different co-ordinate systems. Steady electric current: Ohm''s law, continuity equation, Joule''s law, resistance calculation. Static Magnetic field: Postulates of magnetostatics, Biot-Savart''s law, Ampere''s law and applications, vector magnetic potential, magnetic dipole, magnetization, magnetic field intensity and relative permeability, boundary conditions for magnetic field, magnetic energy, magnetic forces, torque and inductance of different geometries. Time varying fields and Maxwell''s equations: Faraday''s law of electromagnetic induction, Maxwell''s equations - differential and integral forms, boundary conditions, potential functions; time harmonic fields and Poynting theorem. Plane electromagnetic wave: plane wave in loss less media- Doppler effect, transverse electromagnetic wave, polarization of plane wave; plane wave in lossy media- low-loss dielectrics, good conductors; group velocity, instantaneous and average power densities, normal and oblique incidence of plane waves at plane boundaries for different polarization.   EEE 210 Electronic Circuit Simulation Laboratory 1.5 credits, 3 hours/week  Simulation laboratory based on EEE 201 and EEE 207 theory courses. Students will verify the theories and concepts learned in EEE 201 and EEE 207 using simulation softwares like PSpice and Matlab. Students will also perform specific design of electronic circuits theoretically and by simulation.   EEE 212 Numerical Technique Laboratory 1.5 credits, 3 hours/week  Laboratory on numerical techniques using computer solution of differentiation and integration problems, transcendental equations, linear and non-linear differential equations and partial differential equations.   EEE 301Continuous Signals and Linear Systems 3 credits, 3 hours/week  Classification of signals and systems: signals- classification, basic operation on signals, elementary signals, representation of signals using impulse function; systems- classification. Properties of Linear Time Invariant (LTI) systems: Linearity, causality, time invariance, memory, stability, invertibility. Time domain analysis of LTI systems: Differential equations- system representation, order of the system, solution techniques, zero state and zero input response, system properties; impulse response- convolution integral, determination of system properties; state variable- basic concept, state equation and time domain solution. Frequency domain analysis of LTI systems: Fourier series- properties, harmonic representation, system response, frequency response of LTI systems; Fourier transformation- properties, system transfer function, system response and distortion-less systems. Applications of time and frequency domain analyses: solution of analog electrical and mechanical systems, amplitude modulation and demodulation, time-division and frequency-division multiplexing. Laplace transformation: properties, inverse transform, solution of system equations, system transfer function, system stability and frequency response and application.   EEE 303 Digital Electronics 3 credits, 3 hours/week  Introduction to number systems and codes. Analysis and synthesis of digital logic circuits: Basic logic functions, Boolean algebra, combinational logic design, minimization of combinational logic. Implementation of basic static logic gates in CMOS and BiCMOS: DC characteristics, noise margin and power dissipation. Power optimization of basic gates and combinational logic circuits. Modular combinational circuit design: pass transistor, pass gates, multiplexer, demultiplexer and their implementation in CMOS, decoder, encoder, comparators, binary arithmetic elements and ALU design. Programmable logic devices: logic arrays, field programmable logic arrays and programmable read only memory. Sequential circuits: different types of latches, flip-flops and their design using ASM approach, timing analysis and power optimization of sequential circuits. Modular sequential logic circuit design: shift registers, counters and their applications.   EEE 304 Digital Electronics Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 303. In the second part, students will design simple systems using the principles learned in EEE 303.   EEE 305 Power System I 3 credits, 3 hours/week  Network representation: Single line and reactance diagram of power system and per unit. Line representation: equivalent circuit of short, medium and long lines. Load flow: Gauss- Siedel and Newton Raphson Methods. Power flow control: Tap changing transformer, phase shifting, booster and regulating transformer and shunt capacitor. Fault analysis: Short circuit current and reactance of a synchronous machine. Symmetrical fault calculation methods: symmetrical components, sequence networks and unsymmetrical fault calculation. Protection: Introduction to relays, differential protection and distance protection. Introduction to circuit breakers. Typical layout of a substation. Load curves: Demand factor, diversity factor, load duration curves, energy load curve, load factor, capacity factor and plant factor.   EEE 306 Power System I Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 305. In the second part, students will design simple systems using the principles learned in EEE 305.   EEE 307 Electrical Properties of Materials 3 credits, 3 hours/week  Crystal structures: Types of crystals, lattice and basis, Bravais lattice and Miller indices. Classical theory of electrical and thermal conduction: Scattering, mobility and resistivity, temperature dependence of metal resistivity, Mathiessen''s rule, Hall effect and thermal conductivity. Introduction to quantum mechanics: Wave nature of electrons, Schrodinger''s equation, one-dimensional quantum problems- infinite quantum well, potential step and potential barrier; Heisenbergs''s uncertainty principle and quantum box. Band theory of solids: Band theory from molecular orbital, Bloch theorem, Kronig-Penny model, effective mass, density-of-states. Carrier statistics: Maxwell-Boltzmann and Fermi-Dirac distributions, Fermi energy. Modern theory of metals: Determination of Fermi energy and average energy of electrons, classical and quantum mechanical calculation of specific heat. Dielectric properties of materials: Dielectric constant, polarization- electronic, ionic and orientational; internal field, Clausius-Mosotti equation, spontaneous polarization, frequency dependence of dielectric constant, dielectric loss and piezoelectricity. Magnetic properties of materials: Magnetic moment, magnetization and relative permitivity, different types of magnetic materials, origin of ferromagnetism and magnetic domains. Introduction to superconductivity: Zero resistance and Meissner effect, Type I and Type II superconductors and critical current density.   EEE 309 Communication Theory 3 credits, 3 hours/week  Overview of communication systems: Basic principles, fundamental elements, system limitations, message source, bandwidth requirements, transmission media types, bandwidth and transmission capacity. Noise: Source, characteristics of various types of noise and signal to noise ratio. Information theory: Measure of information, source encoding, error free communication over a noisy channel, channel capacity of a continuous system and channel capacity of a discrete memoryless system. Communication systems: Analog and digital. Continuous wave modulation: Transmission types- base-band transmission, carrier transmission; amplitude modulation- introduction, double side band, single side band, vestigial side band, quadrature; spectral analysis of each type, envelope and synchronous detection; angle modulation- instantaneous frequency, frequency modulation (FM) and phase modulation (PM), spectral analysis, demodulation of FM and PM. Pulse modulation: Sampling- sampling theorem, Nyquist criterion, aliasing, instantaneous and natural sampling; pulse amplitude modulation- principle, bandwidth requirements; pulse code modulation (PCM)- quantization principle, quantization noise, non-uniform quantization, signal to quantization error ratio, differential PCM, demodulation of PCM; delta modulation (DM)- principle, adaptive DM; line coding- formats and bandwidths. Digital modulation: Amplitude-shift keying- principle, ON-OFF keying, bandwidth requirements, detection, noise performance; phase-shift keying (PSK)- principle, bandwidth requirements, detection, differential PSK, quadrature PSK, noise performance; frequency-shift keying (FSK)- principle, continuous and discontinuous phase FSK, minimum-shift keying, bandwidth requirements, detection of FSK. Multiplexing: Time-division multiplexing (TDM)- principle, receiver synchronization, frame synchronization, TDM of multiple bit rate systems; frequency-division multiplexing (FDM)- principle, de-multiplexing; wavelength-division multiplexing, multiple-access network- time-division multiple-access (TDMA), frequency-division multiple access (FDMA); code-division multiple-access (CDMA) - spread spectrum multiplexing, coding techniques and constraints of CDMA. Communication system design: design parameters, channel selection criteria and performance simulation.   EEE 310 Communication Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 309. In the second part, students will design simple systems using the principles learned in EEE 309.   EEE 311 Digital Signal Processing I 3 credits, 3 hours/week  Introduction to digital signal processing (DSP): Discrete-time signals and systems, analog to digital conversion, impulse response, finite impulse response (FIR) and infinite impulse response (IIR) of discrete-time systems, difference equation, convolution, transient and steady state response. Discrete transformations: Discrete Fourier series, discrete-time Fourier series, discrete Fourier transform (DFT) and properties, fast Fourier transform (FFT), inverse fast Fourier transform, z-transformation - properties, transfer function, poles and zeros and inverse z-transform. Correlation: circular convolution, auto-correlation and cross correlation. Digital Filters: FIR filters- linear phase filters, specifications, design using window, optimal and frequency sampling methods; IIR filters- specifications, design using impulse invariant, bi-linear z-transformation, least-square methods and finite precision effects.   EEE 312 Digital Signal Processing I Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 311. In the second part, students will design simple systems using the principles learned in EEE 311.   EEE 314 Electrical Services Design 1.5 credits, 3 hours/week  Wiring system design, drafting, estimation. Design for illumination and lighting. Electrical installations system design: substation, BBT and protection, air-conditioning, heating and lifts. Design for intercom, public address systems, telephone system and LAN. Design of security systems including CCTV, fire alarm, smoke detector, burglar alarm, and sprinkler system. A design problem on a multi-storied building.   EEE 315 Microprocessor and Interfacing 3 credits, 3 hours/week  Introduction to microprocessors. Intel 8086 microprocessor: Architecture, addressing modes, instruction sets, assembly language programming, system design and interrupt. Interfacing: programmable peripheral interface, programmable timer, serial communication interface, programmable interrupt controller, direct memory access, keyboard and display interface. Introduction to micro-controllers.   EEE 316 Microprocessor and Interfacing Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 315. In the second part, students will design simple systems using the principles learned in EEE 315.   EEE 400 Project/Thesis 2 credits, 6 hours/week for Level-4, Term-I 3 credits, 6 hours/week for Level-4, Term-II  Study of practical problems in the fields of electrical and electronic engineering.   EEE 401 Control System I 3 credits, 3 hours/week  Introduction to control systems. Linear system models: transfer function, block diagram and signal flow graph (SFG). State variables: SFG to state variables, transfer function to state variable and state variable to transfer function. Feedback control system: Closed loop systems, parameter sensitivity, transient characteristics of control systems, effect of additional pole and zero on the system response and system types and steady state error. Routh stability criterion. Analysis of feedback control system: Root locus method and frequency response method. Design of feedback control system: Controllability and observability, root locus, frequency response and state variable methods. Digital control systems: introduction, sampled data systems, stability analysis in Z-domain.   EEE 402 Control System I Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 401. In the second part, students will design simple systems using the principles learned in EEE 401.   EEE 413 Solid State Devices 3 credits, 3 hours/week  Semiconductors in equilibrium: Energy bands, intrinsic and extrinsic semiconductors, Fermi levels, electron and hole concentrations, temperature dependence of carrier concentrations and invariance of Fermi level. Carrier transport processes and excess carriers: Drift and diffusion, generation and recombination of excess carriers, built-in-field, Einstein relations, continuity and diffusion equations for holes and electrons and quasi-Fermi level. PN junction: Basic structure, equilibrium conditions, contact potential, equilibrium Fermi level, space charge, non-equilibrium condition, forward and reverse bias, carrier injection, minority and majority carrier currents, transient and AC conditions, time variation of stored charge, reverse recovery transient and capacitance. Bipolar Junction Transistor: Basic principle of pnp and npn transistors, emitter efficiency, base transport factor and current gain, diffusion equation in the base, terminal currents, coupled-diode model and charge control analysis, Ebers-Moll equations and circuit synthesis. Metal-semiconductor junction: Energy band diagram of metal semiconductor junctions, rectifying and ohmic contacts. MOS structure: MOS capacitor, energy band diagrams and flat band voltage, threshold voltage and control of threshold voltage, static C-V characteristics, qualitative theory of MOSFET operation, body effect and current-voltage relationship of a MOSFET. Junction Field-Effect-Transistor: Introduction, qualitative theory of operation, pinch-off voltage and current-voltage relationship.     Elective Courses  Interdisciplinary  EEE 421 Control System II 3 credits, 3 hours/week  Compensation using pole placement technique. State equations of digital systems with sample and hold, state equation of digital systems, digital simulation and approximation. Solution of discrete state equations: by z-transform, state equation and transfer function, state diagrams, state plane analysis. Stability of digital control systems. Digital simulation and digital redesign. Time domain analysis. Frequency domain analysis. Controllability and observability. Optimal linear digital regulator design. Digital state observer. Microprocessor control. Introduction to neural network and fuzzy control, adaptive control. HuControl, nonlinear control.   EEE 422 Control System II Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 421. In the second part, students will design simple systems using the principles learned in EEE 421.   EEE 423 Numerical Methods 3 credits, 3 hours/week  Introduction: Motivation and errors in numerical techniques. Taylor series. Finite difference calculus: Forward, backward, divided, and central difference and difference of a polynomial. Interpolation: Newton''s formula, Lagrange, spline, Chebyshev and inverse. Extrapolation. Nonlinear equations: Iteration, bisection, false position, Raphson, Secant and Muller''s methods. Simultaneous linear algebraic equations: Cramer''s rule, inversion of matrices, Gauss elimination, Gauss-Jordan method, factorization and Gauss-Siedel iteration methods. Curve Fitting: Linear and polynomial regression, fitting power, exponential and trigonometric functions. Ordinary differential equations: Initial value problem, Taylor''s series method, Picard''s method of successive approximation, Euler''s method and Runge Kutta method. Boundary value problems. Numerical integration: general quadrature formula, trapezoidal rule and Simpson''s rule. Numerical differentiation.   EEE 424 Numerical Methods Laboratory 1.5 credits, 3 hours/week  Students will perform experiments to verify practically the theories and concepts learned in EEE 423.   EEE 425 Biomedical Instrumentation 3 credits, 3 hours/week  Human body: Cells and physiological systems. Bioelectricity: genesis and characteristics. Measurement of bio-signals: Ethical issues, transducers, amplifiers and filters. Electrocardiogram: electrocardiography, phono cardiograph, vector cardiograph, analysis and interpretation of cardiac signals, cardiac pacemakers and defibrillator. Blood pressure: systolic, diastolic mean pressure, electronic manometer, detector circuits and practical problems in pressure monitoring. Blood flow measurement: Plethymography and electromagnetic flow meter. Measurement and interpretation: electroencephalogram, cerebral angiograph and cronical X-ray. Brain scans. Electromayogram (EMG). Tomograph: Positron emission tomography and computer tomography. Magnetic resonance imaging. Ultrasonogram. Patient monitoring system and medical telemetry. Effect of electromagnetic fields on human body.   EEE 426 Biomedical Instrumentation Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 425. In the second part, students will design simple systems using the principles learned in EEE 425.   EEE 427 Measurement and Instrumentation 3 credits, 3 hours/week  Introduction: Applications, functional elements of a measurement system and classification of instruments. Measurement of electrical quantities: Current and voltage, power and energy measurement. Current and potential transformer. Transducers: mechanical, electrical and optical. Measurement of non-electrical quantities: Temperature, pressure, flow, level, strain, force and torque. Basic elements of DC and AC signal conditioning: Instrumentation amplifier, noise and source of noise, noise elimination compensation, function generation and linearization, A/D and D/A converters, sample and hold circuits. Data Transmission and Telemetry: Methods of data transmission, DC/AC telemetry system and digital data transmission. Recording and display devices. Data acquisition system and microprocessor applications in instrumentation.   EEE 428 Measurement and Instrumentation Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 427. In the second part, students will design simple systems using the principles learned in EEE 427.     Communication Group  EEE 331 Random Signals and Processes 3 credits, 3 hours/week  Probability and random variables. Distribution and density functions and conditional probability. Expectation: moments and characteristic functions. Transformation of a random variable. Vector random variables. Joint distribution and density. Independence. Sums of random variables. Random Processes. Correlation functions. Process measurements. Gaussian and Poisson random processes. Noise models. Stationarity and Ergodicity. Spectral Estimation. Correlation and power spectrum. Cross spectral densities. Response of linear systems to random inputs. Introduction to discrete time processes, Mean-square error estimation, Detection and linear filtering.   EEE 431 Digital Signal Processing II 3 credits, 3 hours/week  Spectral estimation: Nonparametric methods - discrete random processes, autocorrelation sequence, periodogram; parametric method-autoregressive modeling, forward/backward linear prediction, Levinson-Durbin algorithm, minimum variance method and Eigenstructure method I and II. Adaptive signal processing: Application, equalization, interference suppression, noise cancellation, FIR filters, minimum mean-square error criterion, least mean-square algorithm and recursive least square algorithm. Multirate DSP: Interpolation and decimation, poly-phase representation and multistage implementation. Perfect reconstruction filter banks: Power symmetric, alias-free multi-channel and tree structured filter banks. Wavelets: Short time Fourier transform, wavelet transform, discrete time orthogonal wavelets and continuous time wavelet basis.   EEE 433 Microwave Engineering 3 credits, 3 hours/week  Transmission lines: Voltage and current in ideal transmission lines, reflection, transmission, standing wave, impedance transformation, Smith chart, impedance matching and lossy transmission lines. Waveguides: general formulation, modes of propagation and losses in parallel plate, rectangular and circular waveguides. Microstrips: Structures and characteristics. Rectangular resonant cavities: Energy storage, losses and Q. Radiation: Small current element, radiation resistance, radiation pattern and properties, Hertzian and halfwave dipoles. Antennas: Mono pole, horn, rhombic and parabolic reflector, array, and Yagi-Uda antenna.   EEE 434 Microwave Engineering Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 433. In the second part, students will design simple systems using the principles learned in EEE 433.   EEE 435 Optical Fiber Communication 3 credits, 3 hours/week  Introduction. Light propagation through optical fiber: Ray optics theory and mode theory. Optical fiber: Types and characteristics, transmission characteristics, fiber joints and fiber couplers. Light sources: Light emitting diodes and laser diodes. Detectors: PIN photo-detector and avalanche photo-detectors. Receiver analysis: Direct detection and coherent detection, noise and limitations. Transmission limitations: Chromatic dispersion, nonlinear refraction, four wave mixing and laser phase noises. Optical amplifier: Laser and fiber amplifiers, applications and limitations. Multi-channel optical system: Frequency division multiplexing, wavelength division multiplexing and co-channel interference.   EEE 437 Digital Communication 3 credits, 3 hours/week  Introduction: Communication channels, mathematical model and characteristics. Probability and stochastic processes. Source coding: Mathematical models of information, entropy, Huffman code and linear predictive coding. Digital transmission system: Base band digital transmission, inter-symbol interference, bandwidth, power efficiency, modulation and coding trade-off. Receiver for AWGN channels: Correlation demodulator, matched filter demodulator and maximum likelihood receiver. Channel capacity and coding: Channel models and capacities and random selection of codes. Block codes and conventional codes: Linear block codes, convolution codes and coded modulation. Spread spectrum signals and system.   EEE 438 Digital Communication Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 437. In the second part, students will design simple systems using the principles learned in EEE 437.   EEE 439 Mobile Cellular Communication 3 credits, 3 hours/week  Introduction: Concept, evolution and fundamentals. Analog and digital cellular systems. Cellular Radio System: Frequency reuse, co-channel interference, cell splitting and components. Mobile radio propagation: Propagation characteristics, models for radio propagation, antenna at cell site and mobile antenna. Frequency Management and Channel Assignment: Fundamentals, spectrum utilization, fundamentals of channel assignment, fixed channel assignment, non-fixed channel assignment, traffic and channel assignment. Handoffs and Dropped Calls: Reasons and types, forced handoffs, mobile assisted handoffs and dropped call rate. Diversity Techniques: Concept of diversity branch and signal paths, carrier to noise and carrier to interference ratio performance. Digital cellular systems: Global system for mobile, time division multiple access and code division multiple access.   EEE 441 Telecommunication Engineering 3 credits, 3 hours/week  Introduction: Principle, evolution, networks, exchange and international regulatory bodies. Telephone apparatus: Microphone, speakers, ringer, pulse and tone dialing mechanism, side-tone mechanism, local and central batteries and advanced features. Switching system: Introduction to analog system, digital switching systems - space division switching, blocking probability and multistage switching, time division switching and two dimensional switching. Traffic analysis: Traffic characterization, grades of service, network blocking probabilities, delay system and queuing. Modern telephone services and network: Internet telephony, facsimile, integrated services digital network, asynchronous transfer mode and intelligent networks. Introduction to cellular telephony and satellite communication.     Electronics Group  EEE 351 Analog Integrated Circuits 3 credits, 3 hours/week  Review of FET amplifiers: Passive and active loads and frequency limitation. Current mirror: Basic, cascode and active current mirror. Differential Amplifier: Introduction, large and small signal analysis, common mode analysis and differential amplifier with active load. Noise: Introduction to noise, types, representation in circuits, noise in single stage and differential amplifiers and bandwidth. Band-gap references: Supply voltage independent biasing, temperature independent biasing, proportional to absolute temperature current generation and constant transconductance biasing. Switch capacitor circuits: Sampling switches, switched capacitor circuits including unity gain buffer, amplifier and integrator. Phase Locked Loop (PLL): Introduction, basic PLL and charge pumped PLL.   EEE 451 Processing and Fabrication Technology 3 credits, 3 hours/week  Substrate materials: Crystal growth and wafer preparation, epitaxial growth technique, molecular beam epitaxy, chemical vapor phase epitaxy and chemical vapor deposition (CVD). Doping techniques: Diffusion and ion implantation. Growth and deposition of dielectric layers: Thermal oxidation, CVD, plasma CVD, sputtering and silicon-nitride growth. Etching: Wet chemical etching, silicon and GaAs etching, anisotropic etching, selective etching, dry physical etching, ion beam etching, sputtering etching and reactive ion etching. Cleaning: Surface cleaning, organic cleaning and RCA cleaning. Lithography: Photo-reactive materials, pattern generation, pattern transfer and metalization. Discrete device fabrication: Diode, transistor, resistor and capacitor. Integrated circuit fabrication: Isolation - pn junction isolation, mesa isolation and oxide isolation. BJT based microcircuits, p-channel and n-channel MOSFETs, complimentary MOSFETs and silicon on insulator devices. Testing, bonding and packaging.   EEE 453 VLSI I 3 credits, 3 hours/week  VLSI technology: Top down design approach, technology trends and design styles. Review of MOS transistor theory: Threshold voltage, body effect, I-V equations and characteristics, latch-up problems, NMOS inverter, CMOS inverter, pass-transistor and transmission gates. CMOS circuit characteristics and performance estimation: Resistance, capacitance, rise and fall times, delay, gate transistor sizing and power consumption. CMOS circuit and logic design: Layout design rules and physical design of simple logic gates. CMOS subsystem design: Adders, multiplier and memory system, arithmetic logic unit. Programmable logic arrays. I/O systems. VLSI testing.   EEE 454 VLSI I Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 453. In the second part, students will design simple systems using the principles learned in EEE 453.   EEE 455 Compound Semiconductor and Hetero-Junction Devices 3 credits, 3 hours/week  Compound semiconductor: Zinc-blend crystal structures, growth techniques, alloys, band gap, density of carriers in intrinsic and doped compound semiconductors. Hetero-Junctions: Band alignment, band offset, Anderson''s rule, single and double sided hetero-junctions, quantum wells and quantization effects, lattice mismatch and strain and common hetero-structure material systems. Hetero-Junction diode: Band banding, carrier transport and I-V characteristics. Hetero-junction field effect transistor: Structure and principle, band structure, carrier transport and I-V characteristics. Hetero-structure bipolar transistor (HBT): Structure and operating principle, quasi-static analysis, extended Gummel-Poon model, Ebers-Moll model, secondary effects and band diagram of a graded alloy base HBT.   EEE 457 VLSI II 3 credits, 3 hours/week  VLSI MOS system design: Layout extraction and verification, full and semi-full custom design styles and logical and physical positioning. Design entry tools: Schematic capture and HDL. Logic and switch level simulation. Static timing. Concepts and tools of analysis, solution techniques for floor planning, placement, global routing and detailed routing. Application specific integrated circuit design including FPGA.   EEE 458 VLSI II Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 457. In the second part, students will design simple systems using the principles learned in EEE 457.   EEE 459 Optoelectronics 3 credits, 3 hours/week  Optical properties in semiconductor: Direct and indirect band-gap materials, radiative and non-radiative recombination, optical absorption, photo-generated excess carriers, minority carrier life time, luminescence and quantum efficiency in radiation. Properties of light: Particle and wave nature of light, polarization, interference, diffraction and blackbody radiation. Light emitting diode (LED): Principles, materials for visible and infrared LED, internal and external efficiency, loss mechanism, structure and coupling to optical fibers. Stimulated emission and light amplification: Spontaneous and stimulated emission, Einstein relations, population inversion, absorption of radiation, optical feedback and threshold conditions. Semiconductor Lasers: Population inversion in degenerate semiconductors, laser cavity, operating wavelength, threshold current density, power output, hetero-junction lasers, optical and electrical confinement. Introduction to quantum well lasers. Photo-detectors: Photoconductors, junction photo-detectors, PIN detectors, avalanche photodiodes and phototransistors. Solar cells: Solar energy and spectrum, silicon and Schottkey solar cells. Modulation of light: Phase and amplitude modulation, electro-optic effect, acousto-optic effect and magneto-optic devices. Introduction to integrated optics.   EEE 461 Semiconductor Device Theory 3 credits, 3 hours/week  Lattice vibration: Simple harmonic model, dispersion relation, acoustic and optical phonons. Band structure: Isotropic and anisotropic crystals, band diagrams and effective masses of different semiconductors and alloys. Scattering theory: Review of classical theory, Fermi-Golden rule, scattering rates of different processes, scattering mechanisms in different semiconductors, mobility. Different carrier transport models: Drift-diffusion theory, ambipolar transport, hydrodynamic model, Boltzman transport equations, quantum mechanical model, simple applications.     Power Group  EEE 371 Power System II 3 credits, 3 hours/week  Transmission lines cables: overhead and underground. Stability: swing equation, power angle equation, equal area criterion, multi-machine system, step by step solution of swing equation. Factors affecting stability. Reactive power compensation. Flexible AC transmission system (FACTS). High voltage DC transmission system. Power quality: harmonics, sag and swell.   EEE 471 Energy Conversion III 3 credits, 3 hours/week  Special machines: series universal motor, permanent magnet DC motor, unipolar and bipolar brush less DC motors, stepper motor and control circuits. Reluctance and hysteresis motors with drive circuits, switched reluctance motor, electro static motor, repulsion motor, synchros and control transformers. Permanent magnet synchronous motors. Acyclic machines: Generators, conduction pump and induction pump. Magneto hydrodynamic generators. Fuel Cells, thermoelectric generators, flywheels. Vector control, linear motors and traction. Photovoltaic systems: stand alone and grid interfaced. Wind turbine generators: induction generator, AC-DC-AC conversion.   EEE 473 Power Electronics 3 credits, 3 hours/week  Power semiconductor switches and triggering devices: BJT, MOSFET, SCR, IGBT, GTO, TRIAC, UJT and DIAC. Rectifiers: Uncontrolled and controlled single phase and three phase. Regulated power supplies: Linear-series and shunt, switching buck, buckboost, boost and Cuk regulators. AC voltage controllers: single and three phase. Choppers. DC motor control. Single phase cycloconverter. Inverters: Single phase and three phase voltage and current source. AC motor control. Stepper motor control. Resonance inverters. Pulse width modulation control of static converters.   EEE 474 Power Electronics Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 473. In the second part, students will design simple systems using the principles learned in EEE 473.   EEE 475 Power Plant Engineering 3 credits, 3 hours/week  Power plants: general layout and principles, steam turbine, gas turbine, combined cycle gas turbine, hydro and nuclear. Power plant instrumentation. Selection of location: Technical, economical and environmental factors. Load forecasting. Generation scheduling: deterministic and probabilistic. Electricity tariff: formulation and types.   EEE 477 Power System Protection 3 credits, 3 hours/week  Purpose of power system protection. Criteria for detecting faults: over current, differential current, difference of phase angles, over and under voltages, power direction, symmetrical components of current and voltages, impedance, frequency and temperature. Instrument transformers: CT and PT. Electromechanical, electronic and digital Relays: basic modules, over current, differential, distance and directional. Trip circuits. Unit protection schemes: Generator, transformer, motor, bus bar, transmission and distribution lines. Miniature circuit breakers and fuses. Circuit breakers: Principle of arc extinction, selection criteria and ratings of circuit breakers, types - air, oil, SF6 and vacuum.   EEE 478 Power System Protection Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 477. In the second part, students will design simple systems using the principles learned in EEE 477.   EEE 479 Power System Reliability 3 credits, 3 hours/week  Review of probability concepts. Probability distribution: Binomial, Poisson, and Normal. Reliability concepts: Failure rate, outage, mean time to failure, series and parallel systems and redundancy. Markov process. Probabilistic generation and load models. Reliability indices: Loss of load probability and loss of energy probability. Frequency and duration. Reliability evaluation techniques of single area system.   EEE 481 Power System Operation and Control 3 credits, 3 hours/week  Principles of power system operation: SCADA, conventional and competitive environment. Unit commitment, static security analysis, state estimation, optimal power flow, automatic generation control and dynamic security analysis.   EEE 483 High Voltage Engineering 3 credits, 3 hours/week  High voltage DC: Rectifier circuits, voltage multipliers, Van-de-Graaf and electrostatic generators. High voltage AC: Cascaded transformers and Tesla coils. Impulse voltage: Shapes, mathematical analysis, codes and standards, single and multi-stage impulse generators, tripping and control of impulse generators. Breakdown in gas, liquid and solid dielectric materials. Corona. High voltage measurements and testing. Over-voltage phenomenon and insulation coordination. Lightning and switching surges, basic insulation level, surge diverters and arresters.   EEE 484 High Voltage Engineering Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 483. In the second part, students will design simple systems using the principles learned in EEE 483.     Computer Group  EEE 493 Microprocessor System Design 3 credits, 3 hours/week  Review of 80x86 family of microprocessors. Instructions and data access methods in a 32 bit microprocessor; Representation of operands and operators; Instruction formats; Designing Arithmetic Logic Unit; Processor design: single bus, multi-bus architecture; Control Unit Design: hardwired, micro-programmed and pipe line; VLSI implementation of a microprocessor or part of a microprocessor design.   EEE 494 Microprocessor System Design Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in EEE 493. In the second part, students will design simple systems using the principles learned in EEE 493.   EEE 495 Real Time Computer System 3 credits, 3 hours/week  Introduction to real time system; Classification of real time process; Real time scheduling; Real time programming; Implementation; Operating systems; Real time I/O. Real Time design methodologies. Modeling for real time systems. Reliable and Safe design for critical applications.  Review of Microprocessor fundamentals and programmable input/output devices and systems for PC. Application examples: digital controls, robotics, on line systems, communication with real world signals and automatic control using feedback, feed-forward and adaptive control, control algorithm implementation.     Courses offered by other Departments to EEE students  Computer Science and Engineering Department  CSE 109 Computer Programming 3 credits, 3 hours/week  Introduction to digital computers. Programming languages, algorithms and flow charts. Structured Programming using C: Variables and constants, operators, expressions, control statements, functions, arrays, pointers, structure unions, user defined data types, input-output and files. Object-oriented Programming using C++: introduction, classes and objects; polyorphism; function and operator overloading; inheritance.   CSE 110 Computer Programming Sessional 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in CSE 109. In the second part, students will learn program design.   CSE 451 Computer Networks 3 credits, 3 hours/week  Switching and multiplexing; ISO, TCP-IP and ATM reference models. Different Data Communication Services: Physical Layer- wired and wireless transmission media, Cellular Radio: Communication satellites; Data Link Layer: Elementary protocols, sliding window protocols. Error detection and correction, HDLC, DLL of internet, DLL of ATM; Multiple Access protocols, IEEE.802 Protocols for LANs and MANs, Switches, Hubs and Bridges; High speed LAN; Network layer: Routing, Congestion control, Internetworking, Network layer in internet: IP protocol, IP addresses, ARP; NI in ATM transport layer: transmission control protocol. UDP, ATM adaptation layer; Application layer: Network security; Email, Domain Name System; Simple Network Management Protocol; HTTP and World Wide Web.   CSE 452 Computer Networks Laboratory 1.5 credits, 3 hours/week  This course consists of two parts. In the first part, students will perform experiments to verify practically the theories and concepts learned in CSE 451. In the second part, students will design systems using the principles learned in CSE 451.   CSE 453 Computer Architecture 3 credits, 3 hours/week  Instructions and data access methods; Arithmetic Logic Unit (ALU) design: arithmetic and logical operations, floating point operations; Processor design: data paths- single cycle and multi cycle implementations; Control Unit design: hardware and micro-programmed Pipeline- pipelined data path and control, hazards and exceptions. Memory organization: cache, virtual memory; Buses; Multiprocessors, type of multiprocessor performance, single bus multiprocessors, clusters.   CSE 491 Multimedia Communications 3 credits, 3 hours/week  Types of media. Multimedia signal characteristic: sampling, digital representation, signal formats. Signal coding and compression: entropy coding, transform coding, vector quantization. Coding standards: H.26x, LPEG, MPEG. Multimedia communication networks: network topologies and layers, LAN, MAN, WAN, PSTN, ISDN, ATM, internetworking devices, the internet and access technologies, enterprise networks, wireless LANs and wireless multimedia. Entertainment networks: cable, satellite and terrestrial TV networks, ADSL and VDSL, high speed modems. Transport protocols: TCP, UDP, IP, Ipv4, Ipv6, FTP, RTP and RTCP, use of MPLS and WDMA. Multimedia synchronization, security, QoS and resource management. Multimedia applications: The WWW, Internet telephony, teleconferencing, HDTV, email and e-commerce.     Civil Engineering Department  CE 152 Engineering Drawing 1.5 credits, 3 hours/week  Introduction- lettering, numbering and heading; instrument and their use; sectional views and isometric views of solid geometrical figures. Plan, elevation and section of multistoried building; building services drawings; detailed drawing of lattice towers.     Mechanical Engineering  ME 267 Mechanical Engineering Fundamentals 3 credits, 3 hours/week  Introduction to sources of energy: Steam generating units with accessories and mountings; steam turbines.  Introduction to internal combustion engines and their cycles, gas turbines.  Refrigeration and air conditioning: applications; refrigerants, different refrigeration methods.  Fluid machinery: impulse and reaction turbines; centrifugal pumps, fans, blowers and compressors.  Basics of conduction and convection: critical thickness of insulation.   ME 268 Mechanical Engineering Fundamentals Sessional 1.5 credits, 3 hours/week  Sessional based on ME 267.     Industrial and Production Engineering  IPE 493 Industrial Management 3 credits, 3 hours/week  Management Functions and Organization: Evolution, management function: organization, theory and structure, span of control, authority delegation, manpower planning.  Personal Management: Importance, need hierarchy, motivation, leadership, wage incentives, performance appraisal, participative management.  Operation Management: Production planning and control (PPC) functions, quantitative methods applied in production, quality management, location and layout planning safety and loss management.  Cost and Financial Management: Elements of cost products, cost analysis, investment analysis, benefit cost analysis, risk analysis.  Management Accounting: Cost planning and control, budget and budgetary control.  Marketing Management: Concepts, strategy, sales promotion, patent laws.  Technology Management: Management of innovation and changes, technology life cycle.  Case studies.     Physics Department  PHY 121 Waves and Oscillations, Optics and Thermal Physic 3 credits, 3 hours/week  Waves and oscillations: Differential equation of simple harmonic oscillator, total energy and average energy, combination of simple harmonic oscillations, spring mass system, torsional pendulum; two body oscillation, reduced mass, damped oscillation, forced oscillation, resonance, progressive wave, power and intensity of wave, stationary wave, group and phase velocities.  Optics: Defects of images: spherical aberration, astigmatism, coma, distortion, curvature, chromatic aberration. Theories of light; Interference of light: Young''s double slit experiment, displacement of fringes and its uses, Fresnel bi-prism, interference in thin films, Newton''s rings, interferometers; Diffraction: Diffraction by single slit, diffraction from a circular aperture, resolving power of optical instruments, diffraction at double slit and N-slits, diffraction grating; polarization: Production and analysis of polarized light, Brewster''s law, Malus law, polarization by double refraction, Nicol prism, optical activity, Polarimeters.  Thermal Physics: Heat and work- the first law of thermodynamics and its applications; Kinetic Theory of gases- Kinetic interpretation of temperature, specific heats of ideal gases, equipartition of energy, mean free path, Maxwell''s distribution of molecular speeds, reversible and irreversible processes, Carnot''s cycle, second law thermodynamics, Carnot''s theorem, entropy, Thermodynamic functions, Maxwell relations, Clausius and Clapeyron equation.   PHY 102 Physics Sessional 1.5 credits, 3 hours/week  Laboratory experiments based on PHY121.   PHY 123 Electricity and Magnetism, Modern Physics and Mechanics 3 credits, 3 hours/week  Electricity and Magnetism: Electric charge and Coulomb''s law, Electric field, concept of electric flux and the Gauss''s law- some applications of Gauss''s law, Gauss''s law in vector form, Electric potential, relation between electric field and electric potential, capacitance and dielectrics, gradient, Laplace''s and Poisson''s equations, Current, Current density, resistivity, the magnetic field, Ampere''s law, Biot-Savart law and their applications, Laws of electromagnetic induction- Maxwell''s equation.  Modern Physics: Galilean relativity and Einstein''s special theory of relativity; Lorentz transformation equations, Length contraction, Time dilation and mass-energy relation, photoelectric effect, Compton effect; De Broglie matter waves and its success in explaining Bohr''s theory, Pauli''s exclusion principle, Constituent of atomic nucleus, Nuclear binding energy, different types of radioactivity, radioactive decay law; Nuclear reactions, nuclear fission, nuclear fusion, atomic power plant.  Mechanics: Linear momentum of a particle, linear momentum of a system of particles, conservation of linear momentum, some applications of the momentum principle; Angular momentum of a particle, angular momentum of a system of particles, Kepler''s law of planetary motion, the law of universal Gravitation, the motion of planets and satellites, introductory quantum mechanics; Wave function; Uncertainty principle, postulates, Schrodinger time independent equation, expectation value, Probability, Particle in a zero potential, calculation of energy.   PHY 104 Physics Sessional 1.5 credits, 3 hours/week  Laboratory experiments based on PHY 123.     Chemistry Department  CHEM 101 Chemistry I 3 credits, 3 hours/week  Atomic Structure, quantum numbers, electronic configuration, periodic table. Properties and uses of noble gases. Different types of chemical bonds and their properties. Molecular structures of compounds. Selective organic reactions.  Different types of solutions and their compositions. Phase rule, phase diagram of monocomponent system. Properties of dilute solutions. Thermochemistry, chemical kinetics, chemical equilibria. Ionization of water and pH concept. Electrical properties of solution.   CHEM 114 Inorganic, Quantitative Analysis Sessional 1.5 credits, 3 hours/week  Volumetric analysis: acid-base titration, oxidation-reduction titrations, determination of Fe, Cu and Ca volumetrically.     Mathematics Department  MATH 157 Calculus I 3 credits, 3 hours/week  Differential Calculus: Limits, continuity and differentiability. Successive differentiation of various types of functions. Leibnitz''s theorem. Rolle''s theorem, Mean value theorem, Taylor''s and Maclaurin''s theorems in finite and infinite forms. Lagrange''s form of remainders. Cauchy''s form of remainders. Expansion of functions, evaluation of indeterminate forms of L'' Hospital''s rule. Partial differentiation. Euler''s theorem. Tangent and normal. Subtangent and subnormal in cartesian and polar co-ordinates. Determination of maximum and minimum values of functions. Curvature. Asymptotes. Curve tracing.  Integral Calculus: Integration by the method of substitution. Standard integrals. Integration by successive reduction. Definite integrals, its properties and use in summing series. Walli''s formulae. Improper integrals. Beta function and Gamma function. Area under a plane curve and area of a region enclosed by two curves in cartesian and polar co-ordinates. Volumes and surface areas of solids of revolution.   MATH 159 Calculus II 3 credits, 3 hours/week  Complex Variable: Complex number system. General functions of a complex variable. Limits and continuity of a function of complex variable and related theorems. Complex differentiation and the Cauchy-Riemann equations. Infinite series. Convergence and uniform convergence. Line integral of a complex function. Cauchy''s integral formula. Liouville''s theorem. Taylor''s and Laurent''s theorem. Singular points. Residue. Cauchy''s residue theorem.  Vector Analysis: Multiple product of vectors. Linear dependence and independence of vectors. Differentiation and integration of vectors together with elementary applications. Line, surface, and volume integrals. Gradient of a scalar function, divergence and curl of a vector function, various formulae. Integral forms of gradient, divergence and curl. Divergence theorem. Stoke''s theorem, Green''s theorem and Gauss''s theorem.   MATH 257 Ordinary and Partial Differential Equations 3 credits, 3 hours/week  Ordinary Differential Equations: Degree and order of ordinary differential equations, formation of differential equations. Solution of first order differential equations by various methods. Solution of general linear equations of second and higher orders with constant coefficients. Solution of homogeneous linear equations. Solution of differential equations of the higher order when the dependent or independent variables are absent. Solution of differential equation by the method based on the factorization of the operators. Frobenius method.  Partial Differential Equations: Introduction. Linear and non-linear first order equations. Standard forms. Linear equations of higher order. Equations of the second order with variable coefficients. Wave equations. Particular solution with boundary and initial conditions.   MATH 259 Linear Algebra 3 credits, 3 hours/week  Introduction to systems of linear equations. Gaussian elimination. Definition of matrices. Algebra of matrices. Transpose of a matrix and inverse of matrix. Factorization. Determinants. Quadratic forms. Matrix polynomials. Euclidean n-space. Linear transformation from IRn to IRm. Properties of linear transformation from IRn to IRm . Real vector spaces and subspaces. Basis and dimension. Rank and nullity. Inner product spaces. Gram-Schmidt process and QR-decomposition. Eigenvalues and eigenvectors. Diagonalization. Linear transformations. Kernel and Range. Application of linear algebra to electric networks.   MATH 357 Probability and Statistics 3 credits, 3 hours/week  Introduction. Sets and probability. Random variable and its probability distributions. Treatment of grouped sampled data. Some discrete probability distributions. Normal distribution. Sampling theory. Estimation theory. Tests of hypotheses. Regression and correlation. Analysis of variance.     Humanities Department  HUM 127 Sociology 3 credits, 3 hours/week  Introduction: Society, Science and Technology- an overview; Scientific Study of Society; Social Elements, Society, Community, Association and Institution; Mode of Production and Society Industrial Revolution, Development of Capitalism.  Culture and Socialization: Culture; Elements of Culture; Technology and Culture; Cultural Lag; Socialization and Personality; Family; Crime and Deviance; Social Control. Technology, Society and Development; Industrialization and Development; Development and Dependency Theory; Sustainable Development; Development and Foreign Borrowing; Technology Transfer and Globalization, Modernity and Environment; Problem and Prospects.  Pre-industrial, Industrial and Post-industrial Society: Common Features of Industrial Society; Development and Types of Social Inequality in Industrial Society; Poverty, Technology and Society; Social Stratification and Social Mobility; Rural and Urban Life, and their Evaluation.  Population and Society: Society and Population; Fertility. Mortality and Migration; Science, Technology and Human Migration; Theories of Population Growth-Demographic Transition Theory, Malthusian Population Theory; Optimum Population Theory; Population Policy.   HUM 135 English 3 credits, 3 hours/week  General discussion: Introduction, various approaches to learning English.  Grammatical Problems: Construction of sentences, grammatical errors, sentence variety and style, conditionals, vocabulary and diction.  Reading Skill: Discussion readability, scan and skin reading, generating ideas through purposive reading, reading of selected stories.  Writing Skill: Principles of effective writing; Organization, planning and development of writing; Composition, precis writing, amplification.  General strategies for the writing process: Generating ideas, identifying audiences and purposes, construction arguments, stating problems, drafting and finalizing.  Approaches to Communication: Communication today, business communication, different types of business communication.  Listening Skill: The phonemic systems and correct English pronunciation.  Speaking Skill: Practicing dialogue; Story telling; Effective oral presentation.  Report Writing: Defining a report, classification of reports, structure of a report, and writing of reports.   HUM 137 Professional Ethics 3 credits, 3 hours/week  Definition and scopes of Ethics. Different branches of Ethics. Social change and the emergence of new technologies. History and development of Engineering Ethics. Science and Technology- necessity and application. Study of Ethics in Engineering. Applied Ethics in engineering.  Human qualities of an engineer. Obligation of an engineer to the clients. Attitude of an engineer to other engineers. Measures to be taken in order to improve the quality of engineering profession.  Ethical Expectations: Employers and Employees; inter-professional relationship: Professional Organization- maintaining a commitment of Ethical standards. Desired characteristics of a professional code. Institutionalization of Ethical conduct.   HUM 272 Developing English Skills Laboratory 1.5credits, 3 hours/week  Grammar: Tense, article, preposition, subject-verb agreement, clause, conditional and sentence structure.  Vocabulary building: correct and precise diction, affixes, level of appropriateness. Colloquial and standard, informal and formal.  Developing reading skill: Strategies of reading- skimming, scanning, predicting, inferencing; Analyzing and interpreting variety of texts; Practicing comprehension from literary and nonliterary texts.  Developing writing skill: Sentences, sentence variety, generating sentences; Clarity and correctness of sentences, linking sentences to form paragraphs, writing paragraphs, essays, reports, formal and informal letters.  Listening skill and note taking: Listening to recorded texts and class lectures and learning to take useful notes based on listening.  Developing speaking skill: Oral skills including communicative expressions for personal identification, life at home, giving advice and opinion, instruction and directions, requests, complains, apologies, describing people and places, narrating events.   HUM 277 Fundamentals of Economics 3 credits, 3 hours/week  Introduction to economics. Economics and engineering. Different economic systems. Fundamental economic problems. Basic elements of demand, supply and product market. Theory of utility and preferences, consumer''s surplus. Theory of production and cost. Theory of the firm and market structure. Optimization.  Introducing macroeconomics. National income accounting, the simple Keynesian analysis of national income, employment and inflation. Savings, investment and decision making. Fiscal policy and monetary policy- money and interest rate, income and spending.  Economics of development and planning.   HUM 279 Financial and Managerial Accounting 3 credits, 3 hours/week  Financial Accounting: Objectives and importance of accounting, branches of accounting, accounting as an information system, computerized system and applications in accounting. Recording System: Double entry mechanism, accounts and their classification, accounting equation, accounting cycle journal, ledger, trial balance. Preparation of financial statements considering adjusting and closing entries. Accounting concepts and conventions. Financial statements analysis and interpretation: ration analysis- tests for profitability, liquidity, solvency and overall measure.  Costs and Management Accounting: Cost concept and classification. Segregation and mixed cost. Overhead cost: meaning and classification, allocation of overhead cost, overhead recovery method. Job order costing: preparation of job cost sheet and quotation price. Inventory valuation: absorption costing and variable costing technique. Cost volume profit analysis: meaning, breakeven analysis, contribution margin approach, sensitivity analysis. Short-term investment decisions: Relevant and differential cost analysis; Linear programming. Long-term investment decisions: Capital budgeting, various techniques of evaluation of capital investment, investment appraisal under uncertainty, risk management, capital rationing. Concept of working capital, need for working capital, management of cash, stock debtors.     Courses offered by EEE Department to other Departments  Computer Science and Engineering  EEE 163 Introduction to Electrical Engineering 3 credits, 3 hours/week Level 1 Term II  Fundamental electrical concepts and measuring units. Direct current: voltage, current, resistance and power. Laws of electrical circuits and methods of network analysis; Introduction to magnetic circuits. Alternating Current: instantaneous and rms values of current, voltage and power, average power for various combination of R, L and C circuits, phasor representation of sinusoidal quantities.   EEE 164 Introduction to Electrical Engineering Sessional 1.5 credits, 3 hours/week Level 1 Term II  Laboratory experiments based on EEE153.   EEE 263 Electronic Devices and Circuits 4 credits, 4 hours/week Level 2 Term I  Introduction to semiconductors, p-type and n-type semiconductors; p-n junction diode characteristics; Diode applications: Half wave and full wave rectifiers, clipping and clamping circuits, regulated power supply using Zener diode.  Bipolar Junction Transistor (BJT): principle of operation, I-V characteristics; Transistor circuit configurations ( CE, CB, CC), BJT biasing, load lines; BJTs at low frequencies: Hybrid model, h parameters, simplified hybrid model; small signal analysis of single and multi stage amplifiers, frequency response of BJT amplifiers.  Field-Effect-Transistor (FET): principle of operation of JFET and MOSFET; Depletion and Enhancement type NMOS and PMOS; biasing of FETs; low and high frequency models of FETs, switching circuits using FETs; Introduction to CMOS.  Operational Amplifiers (Op-Amps): linear applications of Op-Amps, gain, input and output impedances, active filters, frequency response and noise.  Introduction to feedback, Oscillators, silicon controlled rectifier (SCR), TRIAC, DIAC and UJT: characteristics and applications; Introduction to IC fabrication processes.   EEE 264 Electronic Devices and Circuits Sessional 1.5 credits, 3 hours/week Level 2 Term I  Laboratory experiments based on EEE 263.   EEE 269 Electrical Drives and Instrumentation 3 credits, 3 hours/week 3 Level 2 Term II  Introduction to three phase circuits, alternators and transformers; Principles of operation of DC, synchronous, induction, universal and stepper motors; Thyristor and microprocessor based speed control of motors.  Instrumentation amplifiers: differential, logarithmic, and chopper amplifiers; frequency and voltage measurements using digital techniques; recorders and display devices, spectrum analyzers and logic analyzers; data acquisition and interfacing to microprocessor based systems; Transducers: terminology, types, principles and application of photovoltaic, piezoelectric, thermoelectric, variable resistance and optoelectronic transducers; Noise reduction in instrumentation.   EEE 270 Electrical Drives and Instrumentation Sessional 1.5 credits, 3 hours/week Level 2 Term II  Laboratory experiments based on EEE 269.     Civil Engineering  EEE 165 Basic Electrical Technology 3 credits, 3 hours/week Level 1 Term II  Electrical units and standards. Electrical networks and circuit solution: series, parallel, node and mesh analysis. Instantaneous current, voltage and power, effective current and voltage, average power. Sinusoidal single phase RLC circuits: phasor algebra, balanced three phase circuits. Electrical wiring for residential and commercial loads. Introduction to transformers and induction motors.   EEE 166 Basic Electrical Technology Sessional 1.5 credits, 3 hours/week Level 1 Term II  Laboratory experiments based on EEE 165.     Water Resources Engineering  EEE 165 Basic Electrical Technology 3 credits, 3 hours/week evel 1 Term II  Electrical units and standards. Electrical networks and circuit solution: series, parallel, node and mesh analysis. Instantaneous current, voltage and power, effective current and voltage, average power. Sinusoidal single phase RLC circuits: phasor algebra, balanced three phase circuits. Electrical wiring for residential and commercial loads. Introduction to transformers and induction motors.   EEE 166 Basic Electrical Technology Sessional 1.5 credits, 3 hours/week Level 1 Term II  Laboratory experiments based on EEE 165.     Mechanical Engineering  EEE 159 Fundamentals of Electrical Engineering 3 credits, 3 hours/week Level 1 Term I  Laws of Electric Circuit: Ohm''s law, Kirchhoff''s voltage and current laws, delta wye transformation. Electrical networks: network analysis methods of branch and loop currents, method of node pair voltages, Thevenin''s and Norton''s theorems, magnetic concepts and units: magnetic field, right hand rule, magnetic flux density, Biot-Savart law, magnetic field intensity, measurement of magnetic flux, energy of magnetic field, characteristic of ferromagnetic materials, theory of ferromagnetism, B-H curve, hysteresis loss, eddy current and eddy current loss, total core loss, introduction to magnetic circuits. Electromagnetic forces: forces upon a current carrying conductor and charges particle moving in a magnetic field. Electromagnetic torque; electric motor. Electromagnetic induction and emf; Lenz''s law, Blv rule, elementary ac generator.  General concepts and definitions. Instantaneous current, voltage and power, R, L, C, RL, RC, and RLC branches, Effective value, average value, form factor, crest factor, power real and reactive. Introduction to vector algebra. Impedance in polar and Cartesian forms. Sinusoidal single phase circuit analysis. Impedance in series, parallel branches, series parallel circuits. Network analysis- Thevenin''s theorem. Balanced poly phase circuits: three phase, four wire system of generated emfs, three phase three wire systems, balanced Y loads, balanced delta loads, power in balanced systems, power factor.   EEE 160 Fundamentals of Electrical Engineering Sessional 1.5 credits, 3 hours/week Level 1 Term I  Laboratory experiments based on EEE 159. EEE 259 Electrical and Electronic Technology 4 credits, 4 hours/week Level 2 Term I  Balanced three phase circuit analysis and power measurement. Single phase transformer- equivalent circuit and laboratory testing, introduction to three phase transformers. DC generator principle, types, performances and characteristics. DC Motor: principles, types of motor, performances, speed control, starters and characteristics. AC Machines: three phase induction motor principles, equivalent circuit. Introduction to synchronous machines and fractional horse power motors.  Semiconductor diode, transistor characteristics, equivalent circuits, self biasing circuits, emitter follower amplifiers, push pull amplifier. Introduction to silicon controlled rectifier and its application. Oscilloscope. Transducers: strain, temperature, pressure, speed and torque measurement.   EEE 260 Electrical and Electronic Technology Sessional 1.5 credits, 3 hours/week Level 2 Term I  Laboratory experiments based on EEE 259.     Chemical Engineering  EEE155 Electrical Engineering Fundamentals 3 credits, 3 hours/week Level 1 Term I  Electrical units and standards, electrical networks and circuit theorems, introduction to measurement and instrumentations.  Alternating current, RLC series, parallel circuits, magnetic concepts and magnetic circuits.   EEE 156 Electrical Engineering Fundamentals Sessional 1.5 credits, 3 hours/week Level 1 Term I  Laboratory experiments based on EEE 155.   EEE 267 Electrical and Electronic Technology 3 credits, 3 hours/week Level 2 Term I  Balanced three phase circuits. Introduction to single phase and three phase transformers. Principles of construction, operation and applications of DC generator, DC motor, synchronous generator, synchronous motor and induction motor. Semiconductor diode, transistors, operational amplifiers (Op-Amps), silicon controlled rectifiers (SCRs): principles of operation and applications. Oscilloscope. Transducers: temperature, pressure, flow rate, speed and torque measurements.   EEE 268 Electrical and Electronic Technology Sessional 1.5 credits, 3 hours/week Level 2 Term I  Laboratory experiments based on EEE 267.     Materials and Metallurgical Engineering  EEE155 Electrical Engineering Fundamental 3 credits, 3 hours/week Level 1 Term I  Electrical units and standards, electrical networks and circuit theorems, introduction to measurement and instrumentations.  Alternating current, RLC series, parallel circuits, magnetic concepts and magnetic circuits.   EEE 156 Electrical Engineering Fundamentals Sessional 1.5 credits, 3 hours/week Level 1 Term I  Laboratory experiments based on EEE 155.   EEE 267 Electrical and Electronic Technology 3 credits, 3 hours/week Level 2 Term II  Balanced three phase circuits. Introduction to single phase and three phase transformers. Principles of construction, operation and applications of DC generator, DC motor, synchronous generator, synchronous motor and induction motor. Semiconductor diode, transistors, operational amplifiers (Op-Amps), silicon controlled rectifiers (SCRs): principles of operation and applications. Oscilloscope. Transducers: temperature, pressure, flow rate, speed and torque measurements.     Naval Architecture and Marine Engineering  EEE 161 Electrical Engineering Principles 3 credits, 3 hours/week Level 1 Term II  Direct Current: Theorems of electric circuit, electrical network analysis, measuring instruments.  Alternating current: AC quantities and waveforms, phasor algebra, AC circuit analysis, three phase circuits. Transformers: Single phase and three phase, auto transformer.  Fundamentals of DC generators, DC motors: principle and operation.   EEE 261 Electrical and Electronic Technology for Marine Engineers 3 credits, 3 hours/week Level 2 Term II  Three phase induction motors. AC generators, synchronous motor, speed control of three phase motors.  Diodes, BJTs, diode and BJT circuits, BJT, MOSFET and SCR as power switching devices, controlled rectifiers and inverters.  Radar and wireless equipments, electronic navigation aids, LORAN, RDF and Decca Chain.   EEE 262 Electrical and Electronic Technology for Marine Engineers Sessional 1.5 credits, 3 hours/week Level 2 Term II  Laboratory experiments based on EEE 261.     Industrial and Production Engineering  EEE 167 Basic Electrical and Electronic Circuits 4 credits, 4 hours/week Level 1 Term II  Direct Current Circuits: laws and theorems, DC network analysis.  Alternating current: AC quantities and sinusoidal waveforms, phasors, AC circuit analysis: series and parallel branches -RL, RC and RLC. Balanced three phase circuits.  Semiconductor diode: operation, characteristics and applications. Introduction to bipolar transistor (BJTs): characteristics, common emitter (CE), common base (CB) and common collector (CC) amplifier configurations.   EEE 168 Basic Electrical and Electronic Circuits Sessional 1.5 credits, 3 hours/week Level 1 Term II  Laboratory experiments based on EEE 167.   EEE 271 Electrical Machines and Electronics 3 credits, 3 hours/week Level 2 Term I  Single phase transformer. DC motor: principle and applications. Three phase induction motor: principle and applications. Introduction to synchronous motors and fractional horse power motors.  Introduction to operational amplifiers (Op-Amps) and applications. Silicon controlled rectifier (SCR): operation and characteristics. Power control using SCR. Transducers: strain, temperature, pressure, speed and torque measurements.   EEE 272 Electrical Machines and Electronics Sessional 1.5 credits, 3 hours/week Level 2 Term I  Laboratory experiments based on EEE 271.     Architecture  EEE 373 Building Services III: Electrical 2 credits, 2 hours/week Level 3 Term II  Electrical units and standards, electrical networks and circuit theorems, alternating current (AC) RLC series and parallel circuits, introduction to electrical wiring for residential, commercial and industrial installations and buildings, illumination and different types of lighting.', 7, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE', N'Computer Science And Engineering')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (2, N'MTH', N'Mathematics')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (3, N'PHY', N'Physics')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (4, N'PHA', N'Pharmachy')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (5, N'IR-101', N'International Relation')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName]) VALUES (7, N'EEE', N'Electrical And Electronics Engineering ')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (1, 1, N'ss', N'sss@gg', 1, N'Computer Science', 5, N'01/26/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (2, 8, N'Md. Abdullad', N'ab@gmail.com', 2, N'Mathematics', 3, N'01/26/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (3, 5, N'asdf', N'addd', 1, N'Computer Science', 4, N'01/27/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (4, 1, N'Rony', N'zkrony001@gmail.com', 1, N'Computer Science And Engineering', 4, N'01/23/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (5, 1, N'Rony', N'zkrony001@gmail.com', 1, N'Computer Science And Engineering', 2, N'01/28/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (6, 8, N'Md. Abdullad', N'ab@gmail.com', 2, N'Mathematics', 7, N'01/29/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (7, 1, N'Rony', N'zkrony001@gmail.com', 1, N'Computer Science And Engineering', 6, N'01/29/2016', N'Enrolled')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [StudentName], [Email], [DepartmentId], [DepartmentName], [CourseId], [Date], [CourseStatus]) VALUES (8, 8, N'Md. Abdullad', N'ab@gmail.com', 2, N'Mathematics', 8, N'01/29/2016', N'Enrolled')
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (1, N'CS-101')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (2, N'CS-102')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (3, N'CS-103')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (4, N'CS-104')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (5, N'MAT-101')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (6, N'MAT-102')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (7, N'MAT-103')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (8, N'MAT-104')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (9, N'PHY-101')
INSERT [dbo].[Room] ([RoomId], [RoomNumber]) VALUES (10, N'PHY-102')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([SemesterID], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (1, N'CSE-2016-001', N'Rony', N'zkrony001@gmail.com', N'22', N'01/23/2016', N'sadfa', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (2, N'CSE-2016-002', N'ss', N'sss@gg', N'22', N'01/23/2016', N'sadfa', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (3, N'CSE-2016-003', N'ssgggggggggggggggg', N'ggggggggggggg', N'666', N'01/23/2016', N'sadfa', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (4, N'MTH-2016-004', N'uuuuuuuuuuu', N'gggggggglll', N'454', N'01/23/2016', N'bbbb', 2)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (5, N'CSE-2016-005', N'asdf', N'addd', N'343', N'01/23/2016', N'ddd', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (6, N'CSE-2016-006', N'asdf', N'addd', N'343', N'01/23/2016', N'ddd', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (7, N'CSE-2016-007', N'asdf', N'addd', N'343', N'01/23/2016', N'ddd', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (8, N'MTH-2016-008', N'Md. Abdullad', N'ab@gmail.com', N'236584', N'01/26/2016', N'Dhaka', 2)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (9, N'CSE-2016-009', N'Rony', N'sss@gg', N'01714694335', N'01/29/2016', N'Dhaka', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (10, N'MTH-2016-010', N'Rony', N'sss@gg', N'22', N'01/15/2016', N'ppp', 2)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (11, N'MTH-2016-011', N'Samad', N'samad@gmail.com', N'012365', N'01/30/2016', N'Mirpur', 2)
INSERT [dbo].[Student] ([StudentId], [RegistrationId], [StudentName], [StudentEmail], [StudentContactNo], [StudentDate], [StudentAddress], [StudentDepartmentId]) VALUES (12, N'EEE-2016-012', N'Md Firoj', N'firoj@gmail.com', N'236584', N'01/30/2016', N'Rampura', 7)
SET IDENTITY_INSERT [dbo].[Student] OFF
INSERT [dbo].[StudentResult] ([StudentId], [CourseId], [Grade]) VALUES (1, 5, N'A+')
INSERT [dbo].[StudentResult] ([StudentId], [CourseId], [Grade]) VALUES (1, 4, N'A')
INSERT [dbo].[StudentResult] ([StudentId], [CourseId], [Grade]) VALUES (1, 2, N'A-')
INSERT [dbo].[StudentResult] ([StudentId], [CourseId], [Grade]) VALUES (8, 3, N'B')
INSERT [dbo].[StudentResult] ([StudentId], [CourseId], [Grade]) VALUES (0, 0, N'default')
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (3, N'Mr. A', N'Dhaka', N'zkrony002@gmail.com', N'13236', 1, 1, 30)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (4, N'34', N'34', N'34', N'334', 1, 1, 30)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (5, N'inul', N'Dhaka', N'asdf@Gmail.com', N'13236', 1, 2, 30)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (6, N'Abdul Hadi', N'Dhaka', N'sss@gg', N'13236', 2, 2, 5)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (7, N'Mr. A', N'Dhaka', N'zkrony00r1@gmail.com', N'13236', 1, 1, 30)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [TeacherDesignation], [TeacherDepartmentId], [TeacherCredit]) VALUES (8, N'Mr. A', N'Dhaka', N'zkrony001@gmail.com', N'13236', 1, 1, 30)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 1/30/2016 3:09:43 AM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 1/30/2016 3:09:43 AM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course_1] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 1/30/2016 3:09:43 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_Department] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 1/30/2016 3:09:43 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_Department_1] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Semester]    Script Date: 1/30/2016 3:09:43 AM ******/
ALTER TABLE [dbo].[Semester] ADD  CONSTRAINT [IX_Semester] UNIQUE NONCLUSTERED 
(
	[SemesterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UniversityCRMSystem] SET  READ_WRITE 
GO
