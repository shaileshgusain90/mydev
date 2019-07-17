public class sampleCon {
    String country = 'None';
        
    public PageReference test() {
        return null;
    }
        
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','None'));
        options.add(new SelectOption('Commercial','Commercial'));
        options.add(new SelectOption('Rolloff','Rolloff'));
        return options;
    }
        
    public String getCountry() {
        return country;
    }
        
    public void setCountry(String country) {
        this.country = country;
    }
}