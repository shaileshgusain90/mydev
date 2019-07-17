public class contactGridController{

 @remoteAction
 public static list<contact> getAllContact(){
    
    list<contact> con = [Select id , name from Contact]; 
 
 return con;
 }

 
 }