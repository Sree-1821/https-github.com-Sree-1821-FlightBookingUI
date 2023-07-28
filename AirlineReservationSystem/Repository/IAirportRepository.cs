using FlightBookingSystem.Models;


namespace FlightBookingSystem.Repository
{
    public interface IAirportRepository
    {
        int AddNewAirport(Airports airports);
        List<Airports> GetAllAirports();
        Airports GetAirportById(string Id);
        int UpdateAirports(Airports airports);
    }
    
}