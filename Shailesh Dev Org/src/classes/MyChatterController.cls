public class MyChatterController{

public Object TextSegementType{get{return ConnectApi.MessageSegmentType.text;}}
public Object MentionSegementType{get{return ConnectApi.MessageSegmentType.Mention;}}
    public string UserStatus{get;set;}
    public string profileImageUrl{get;set;}
    public String post{get;set;}
    public String AddAfeedPost{get;set;}
    public connectApi.FeedItemPage feedItemPage{get;set;}            
    
   // list<newsFeed> myFeed = new list<NewsFeed>();
    list<user> lstuser;
    public MyChatterController(){
        init();
        }
      public void  init(){
      feedItemPage = connectApi.chatterFeeds.getFeedItemsFromFeed(null,connectApi.Feedtype.news,'me');    
      lstuser = [select FullPhotourl from user where id =:userinfo.getUserId()];  
        
      profileImageUrl = lstuser[0].FullPhotoUrl;
        
      
          
      }
    //list of everyone whome we are following
    public List<EntitySubscription> getfollowing(){
        List<EntitySubscription> followingEs =[select id,parentid,parent.name from EntitySubscription where subscriberid=:UserInfo.getUserId()];
     return followingEs;
    }
    //All users who are following
    public list<Entitysubscription> Getfollowers(){
    
    List<EntitySubscription> followers=[select id,subscriber.name from EntitySubscription where parentid =:Userinfo.getUserId()];
        
      return followers;  
        
    }
  /*  public void DoUserStatus(){
   
        User users =[select id, CurrentStatus__c from User where id=:Userinfo.getUserId()];
        users.CurrentStatus__c = UserStatus;
        update users;
        Apexpages.addMessage(new apexPages.Message(ApexPages.Severity.INFO,'Status Updated'));
        UserStatus='';
    } */
    
    public void AddPost() //post from vfPage.
    { 
    
    feedItem fpost = new FeedItem();
        fpost.parentId = UserInfo.getUserId();
        fpost.Body = AddAFeedpost;
        insert fpost;
    
       ApexPages.addMessage(new ApexPages.Message(
            ApexPages.Severity.INFO, 'Successfully Posted to Wall'));
        AddAFeedPost = '';
        init();
    
    }
    
    
    
    
}