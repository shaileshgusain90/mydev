public class UseController{

Public string Email{get;set;}
Public string FirstName{get;set;}
Public string LastName{get;set;}
Public string CommunityNickname{get;set;}
Public string Passwd{get;set;}
account acc = [select id,name from account where name='dgfdfgdgd'];
public UseController()
{
User u = new User();
u.Username = Email;
u.FirstName = FirstName;
u.LastName = LastName;
u.Email = Email;
// u.IsPortalSelfRegistered = true;
u.CommunityNickname = communityNickname;
String pwdd = Passwd;
system.debug('<< before create user >>');
String userId = Site.createPortalUser(u, acc.id, pwdd);

}


}