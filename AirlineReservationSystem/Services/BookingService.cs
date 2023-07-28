﻿using FlightBookingSystem.Models;
using FlightBookingSystem.Repository;


namespace FlightBookingSystem.Services
{
    public class BookingService
    {

        private readonly IBookingRepository _bookingRepository;

        public BookingService(IBookingRepository bookingRepository)
        {
            _bookingRepository = bookingRepository;
        }

        public int AddNewBooking(Bookings booking)
        {
            return _bookingRepository.CreateNewBooking(booking);
        }

        public int EditBooking(Bookings booking)
        {
            return _bookingRepository.UpdateBooking(booking);
        }

        public int CancelBooking(int Id)
        {
            return _bookingRepository.CancelBookingbyId(Id);
        }

        public int CheckInBooking(int Id)
        {
            return _bookingRepository.CheckInBooking(Id);
        }

        public List<Bookings> GetAllBookings()
        {
            return _bookingRepository.GetAllBookings();
        }

        public List<Bookings> GetAllCustomerBookings(int CID)
        {
            return _bookingRepository.GetAllCustBookings(CID);
        }

        public Bookings GetBookingById(int Id)
        {
            return _bookingRepository.GetBookingById(Id);
        }
    }
    
}
