using FlightBookingSystem.Models;


namespace FlightBookingSystem.Repository
{
    public interface IAdminRepository
    {
        int AddNewAdmin(Admin admin);
        Admin GetAdminById(int Id);
        int UpdateAdmin(Admin admin);
        int ChangePasswordAdmin(Login creds, string newPassword);
    }
    
}