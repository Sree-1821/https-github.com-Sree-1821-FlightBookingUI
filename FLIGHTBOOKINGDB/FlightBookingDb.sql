CREATE DATABASE [FlightBookingDb]
go
use [FlightBookingDb]
go
CHECKPOINT create table Airports
(
    AirportId varchar(10) primary key not null,
    Name varchar(20) not null,
    City varchar(10) not null,
    Country varchar(10) not null
)
go create table Flights
(
    FlightNo int not null primary key IDENTITY(11021,5),
    FlightId varchar(10) not null,
    Name varchar(20) not null,
    Start varchar(10) not null Foreign key references Airports,
    Destination varchar(10) not null Foreign key references Airports,
    Arrival DateTime not null default CURRENT_TIMESTAMP,
    Departure DateTime not null default CURRENT_TIMESTAMP,
    TotalSeats int default 0,
    AvailableSeats int default 0,
    Fare float default 1500.00,
    IsActive bit default 1,
    Outdated bit default 0,
    cancelled bit default 0
)
go create table Customers
(
    CustomerID int not null primary key IDENTITY(451275,6),
    FirstName varchar(50) not null, 
    LastName varchar(50) not null, 
    Age int not null default 18,
    Gender varchar(10) not null,
    EmailID varchar(25) unique not null,
    MobileNumber varchar(10) unique not null, 
    Username varchar(15) not null unique,
    [Password] varchar(16) not null
) CREATE NONCLUSTERED INDEX NCI_Cust_Email
ON dbo.Customers(EmailID) CREATE NONCLUSTERED INDEX NCI_Cust_MobNum
ON dbo.Customers(MobileNumber) CREATE NONCLUSTERED INDEX NCI_Cust_UsNa
ON dbo.Customers(Username)
go create table [Admin]
(
    AdminId int not null primary key IDENTITY(11101,3),
    FirstName varchar(50) not null, 
    LastName varchar(50) not null, 
    EmailId varchar(25) unique not null,
    Username varchar(15) not null,
    [Password] varchar(16) not null,
    [Role] varchar(20) not null
)
go create table [Users]
(
    Username varchar(15) not null primary key,
    FirstName varchar(50) not null, 
    LastName varchar(50) not null, 
    UserId int not null,
    EmailId varchar(25) unique not null,
    [Password] varchar(16) not null,
    [Role] varchar(20) not null
)
go create table Bookings
(
    BookingID int not null primary key IDENTITY(104515545,6),
    FlightNo int not null Foreign key references Flights,
    CustomerID int not null Foreign key references Customers,
    Seats int not null,
    BookingAmount float not null,
    Arrival DateTime default CURRENT_TIMESTAMP,
    Departure DateTime default CURRENT_TIMESTAMP,
    [Status] varchar(50) default 'In Progress',
    IsCancelled bit default 0,
    IsCheckedIn bit default 0,
    Outdated bit default 0
)
go create table ExceptionLog
(
    Id int not null primary key IDENTITY(11101,3),
    [DataTime] DateTime default CURRENT_TIMESTAMP,
    ErrorDescription varchar(max) default '',
    Data varchar(100) default '',
    StackTrace varchar(max) default ''
)
go INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'CFA', N'CFIA', N'USA', N'California')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'CHI', N'CIA', N'INDIA', N'Chennai')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'DLI', N'DIA', N'INDIA', N'New Delhi')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'HYD', N'JNIA', N'INDIA', N'Hyderabad')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'KOL', N'KIA', N'INDIA', N'Kolkata')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'LAS', N'LAIA', N'USA', N'LasAngeles')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'MUM', N'CST', N'INDIA', N'Mumbai')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'NYC', N'JFKIA', N'USA', N'New York')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'THI', N'TTD', N'INDIA', N'Tirupati')
INSERT INTO [dbo].[Airports] ([AirportID], [Name], [Country], [City]) VALUES (N'VJW', N'VJA', N'INDIA', N'Vijayawada') SET IDENTITY_INSERT [dbo].[Flights] ON
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1001, N'SW-1515', N'Sky', N'NYC', N'MUM', N'2023-08-18 19:59:21', N'2023-08-18 19:59:21', 100, 5, 1500)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1002, N'SW-1515', N'Sky', N'NYC', N'MUM', N'2023-08-18 19:59:21', N'2023-08-18 19:59:21', 270, 180, 4500)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1003, N'SW-1616', N'Sky', N'NYC', N'MUM', N'2023-08-19 19:59:21', N'2023-08-19 19:59:21', 21, 0, 20000)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1004, N'SW-1518', N'Sky', N'NYC', N'MUM', N'2023-08-18 19:59:21', N'2023-08-18 21:59:21', 500, 200, 2000)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1005, N'SW-1515', N'Sky', N'MUM', N'NYC', N'2023-07-21 13:00:11', N'2023-07-21 14:00:11', 120, 100, 1000)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1006, N'SW-1515', N'Sky', N'HYD', N'NYC', N'2023-07-30 20:00:11', N'2023-07-21 23:00:11', 150, 110, 5000)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1007, N'SW-1213', N'Sky', N'NYC', N'MUM', N'2023-07-30 17:35:00', N'2023-07-30 18:35:00', 120, 100, 1500)
INSERT INTO [dbo].[Flights] ([FlightNo], [FlightID], [Name], [Start], [Destination], [Arrival], [Departure], [TotalSeats], [AvailableSeats], [Fare]) VALUES (1008, N'SW-3543', N'Sky', N'THI', N'MUM', N'2023-08-02 12:30:00', N'2023-08-02 13:30:00', 160, 150, 2000)
SET IDENTITY_INSERT [dbo].[Flights] OFF 
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12345, N'Sai', N'S', 25, N'Female', N'sai@gmail.com', N'9855125851', N'sai123', N'12345')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12346, N'Kella', N'K', 21, N'Female', N'kella@gmail.com', N'9855125854', N'kella123', N'67890')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12347, N'Sreya', N'P', 22, N'Female', N'sreya@gmail.com', N'9585845554', N'sreya123', N'09876')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12348, N'Swapna', N'M', 22, N'Female', N'swapna@gmail.com', N'9581247515', N'swapna123', N'54321')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12349, N'Rashmi', N'Darshan', 22, N'Female', N'rashmi@gmail.com', N'924512531', N'rashmi123', N'9494')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12340, N'Priya', N'Y', 25, N'Female', N'priya@gmail.com', N'9855157851', N'priya123', N'9191')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12341, N'Gowthami', N'N', 22, N'Female', N'gow@gmail.com', N'9524524821', N'gow123', N'8181')
INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [Gender], [EmailID], [MobileNumber], [Username], [Password]) VALUES (12342, N'Lucky', N'L', 25, N'Female', N'lucky@gmail.com', N'9595578412', N'lucky123', N'0000')
SET IDENTITY_INSERT [dbo].[Customers] OFF SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT INTO [dbo].[Admin] ([AdminId], [FirstName], [LastName], [EmailId], [Username], [Password], [Role]) VALUES (1110, N'user123', N'23', N'user@gmail.com', N'user123', N'123', N'Admin')
INSERT INTO [dbo].[Admin] ([AdminId], [FirstName], [LastName], [EmailId], [Username], [Password], [Role]) VALUES (1111, N'SS', N'G', N'ns@gmail.com', N'user789', N'456', N'Admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF 
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'sai123', N'Sai', N'S', N'sai@gmail.com', N'12345', N'Customer', 12345)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'kella123', N'Kella', N'K', N'kella@gmail.com', N'67890', N'Customer', 12346)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'sreya123', N'Sreya', N'P', N'sreya@gmail.com', N'09876', N'Customer', 12347)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'swapna123', N'Swapna', N'M', N'swapna@gmail.com', N'54321', N'Customer', 12348)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'rashmi123', N'Rashmi', N'Darshan', N'rashmi@gmail.com', N'9494', N'Customer', 12349)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'priya123', N'Priya', N'Y', N'priya@gmail.com', N'9191', N'Customer', 12340)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'gow123', N'Gowthami', N'N', N'gow@gmail.com', N'8181', N'Customer', 12341)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'lucky123', N'Lucky', N'L', N'lucky@gmail.com', N'0000', N'Customer', 12342)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES (N'user123', N'user123', N'23', N'user@gmail.com', N'123', N'Admin', 1110)
INSERT INTO [dbo].[Users] ([Username], [FirstName], [LastName], [EmailId], [Password], [Role], [UserId]) VALUES ( N'user789',N'SS', N'G', N'ns@gmail.com', N'456', N'Admin',1111)   SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105121, 1001, 12345, 5, 14512, N'2023-07-20 19:59:21', N'2023-07-20 21:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105122, 1001, 12345, 5, 14512, N'2023-07-20 19:59:21', N'2023-07-20 21:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105123, 1001, 12345, 5, 14512, N'2023-07-21 19:32:00', N'2023-07-21 19:32:00', N'Inprogress')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105124, 1001, 12345, 5, 7500, N'2023-07-21 19:47:17', N'2023-07-21 19:47:17', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105125, 1001, 12345, 5, 7500, N'2023-07-21 19:50:58', N'2023-07-21 19:50:58', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105126, 1001, 12345, 10, 15000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Cancel')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105127, 1001, 12345, 5, 7500, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Booked')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105128, 1001, 12345, 5, 7500, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105129, 1003, 12346, 5, 100000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105120, 1003, 12347, 5, 100000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Booked')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105112, 1003, 12348, 5, 100000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Booked')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105113, 1005, 12348, 10, 45000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Booked')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105114, 1005, 12348, 10, 45000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105115, 1005, 12348, 6, 27000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105116, 1005, 12348, 5, 22500, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105117, 1005, 12348, 2, 9000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105118, 1005, 12348, 6, 27000, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'Cancelled')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105119, 1005, 12348, 5, 22500, N'2023-07-20 19:59:21', N'2023-07-20 19:59:21', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105120, 1005, 12348, 10, 45000, N'2024-07-20 19:59:21', N'2024-07-20 19:59:21', N'CheckedIn')
INSERT INTO [dbo].[Bookings] ([BookingID], [FlightNo], [CustomerID], [Seats], [BookingAmount], [Arrival], [Departure], [Status]) VALUES (949105111, 1001, 12348, 5, 7500, N'2024-07-20 19:59:21', N'2024-07-20 19:59:21', N'Booked')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
go create PROCEDURE [dbo].[DeleteOldFlights]
        -- Add the parameters for the stored procedure here
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
            UPDATE Flights
            SET outdated = 1
            WHERE Arrival < CURRENT_TIMESTAMP;
            -- Insert statements for procedure here
        END
go create PROCEDURE [dbo].[Fullybooked]
        -- Add the parameters for the stored procedure here
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
            UPDATE Flights
            SET isActive = 0
            WHERE AvailableSeats <= 0;
            -- Insert statements for procedure here
END
go create PROCEDURE [dbo].[FullyNotbooked]
        -- Add the parameters for the stored procedure here
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
            UPDATE Flights
            SET isActive = 1
            WHERE AvailableSeats > 0;
            -- Insert statements for procedure here
END
go create PROCEDURE [dbo].[DeleteOldBookings]
        -- Add the parameters for the stored procedure here
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
            UPDATE Bookings
            SET outdated = 1
            WHERE Arrival < CURRENT_TIMESTAMP;
            -- Insert statements for procedure here
        END
go 
--EXEC [dbo].[DeleteOldFlights]
--EXEC [dbo].[DeleteOldBookings]
--EXEC [dbo].[Fullybooked]
--Select * from Flights has context menu
SELECT * from Customers