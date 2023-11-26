public class ParkLocator {
    public static String[] country(string name){
        ParkService.ParksImplPort parks =  new ParkService.ParksImplPort();
        return parks.byCountry(name);
    }
}