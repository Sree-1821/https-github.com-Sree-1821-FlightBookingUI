using FlightBookingSystem.Models;


namespace FlightBookingSystem.Repository
{
    public interface IMailService
    {
        void SendEmail(MailRequest mailRequest);
    }
}