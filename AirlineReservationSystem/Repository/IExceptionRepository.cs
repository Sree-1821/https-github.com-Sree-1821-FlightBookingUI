namespace FlightBookingSystem.Repository
{
    public interface IExceptionRepository
    {
        public Task CreateLog(Exception ex, object requestBody);

    }
    
}