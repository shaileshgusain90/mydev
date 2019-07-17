public class Test_ReadExcel_Cls 
{
 public string nameFile{get;set;}
 public Blob contentFile{get;set;}
 public Test_ReadExcel_Cls()
 {
 
 }
public Pagereference ReadFile()
{system.debug('FFFFFFFFFFFFFFFFFFF'+contentFile);
nameFile=contentFile.toString();
system.debug('nameFile'+nameFile);
return null;
}
}