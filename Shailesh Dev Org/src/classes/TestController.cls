@isTest
public class TestController{
     
    public static testMethod void testMeth(){
        
        Account ac = new Account();
        ac.Name = 'shailesh';
       
        
        insert ac;
        contact con = new Contact();
        con.LastName = 'gusain';
        con.Phone = '999997870';
        con.Email = 'shailesh.gusain@gmail.com';
        con.AccountId = ac.Id;
        insert con;
        account acc= [select id, accountNumber from account where id=:ac.id];
        acc.AccountNumber = '8989898980';
        update acc;
       ContactDetailsController conD = new ContactDetailsController();
       conD.phone='1223567';
        conD.CName='sjiad';
        
        conD.Email='knitiosh@DWSDF.COM';
        
       ConD.getOptions();
            conD.getContact();
        ConD.save();
         
     
       
        
    }

    
    
  }