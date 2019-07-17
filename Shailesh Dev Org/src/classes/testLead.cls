@istest
public class testLead{

  static  testMethod void testy(){

Lead ld = new Lead();

ld.LastName = 'abcd';
ld.FirstName = 'lop';
ld.Company = 'comp';
ld.Email = 'sha@gmail.com';

insert ld;

leadT Ld3 = new LeadT();
ld3.LastName = 'abcd';
ld3.FirstName = 'lop';
ld3.CompanyName = 'comp';
ld3.Email = 'sha@gmail.com';

ld3.save();

}
}