public class myClass{
 
 
 public myClass(){
 parse();
 }
public class Car {
    public String make;
    public String year;
}

public void parse() {        
    Car c = (Car)JSON.deserializeStrict(
        '{"make":"SFDC","year":"2020"}',
        Car.class);
        system.debug('!!!!!!!!!!!!!!!!' + c);
    System.assertEquals(c.make, 'SFDC');
    System.assertEquals(c.year, '2020');
}
}