public with sharing class NodeJsonController {   
  public static String node; 
  public static list<String> uploadToken {get;set;}
public static list<String>  Sou {get;set;}
  public static list<String> PcaUri {get;set;}
  public static String PARENT {get;set;}
  public static String Note {get;set;}
  public  static String ISO  {get;set;}   
  public  static String ISO14  {get;set;} 
  public  static String IOS14  {get;set;} 
  public  static  String IDPCA  {get;set;} 
  public static String DESIGNATION{get;set;}
  public Static String DEFINITION{get;set;}
  public static list<Wrapper> WrapperList {get;set;}
  
  
   public NodeJsonController(){
      node();
   } 
   
 public static void node(){ 
  
   WrapperList = new list<Wrapper>();
    uploadToken = new list<string>();
     PcaUri = new list<string>();
     sou = new list<string>();
       
    node=   '[{"_id" : {"$oid": "54d0813d7c5a5b191320ef33"},';
             node+= '"CLASS_SUBCLASS": [],';
             node+= '"SUBCLASS_CODE":["shailesh"],';
             node+= '"SOURCE": ["hfhfhfh1bxbx"],';
             node+=  '"PCA_URI": ["www.google.com"],';
             node+=  '"PARENT_CLASS": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"NOTES": ["dhbdhdd1xbxbxb"],';  
             node+=  '"ISO14224CODE": ["fghfh1dxbv"],';
             node+=  '"ISO14224ALT2": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"ISO14224ALT1": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"IDPCA": ["askasj1"],"DESIGNATION": ["kanpur1"],';
             node+=  '"DEFINITION": ["mayank1"],';
             node+=  '"ANNEXE_A": [ true],';
             node+=  '"__v": 0 },';
             
             node+=  '{"_id" : {"$oid": "54d0813d7c5a5b191320ef33"},';
             node+= '"CLASS_SUBCLASS": [],';
             node+= '"SUBCLASS_CODE":["gusain"],';
             node+= '"SOURCE": ["hfhfhfh1bxbx"],';
             node+=  '"PCA_URI": ["www.google.com"],';
             node+=  '"PARENT_CLASS": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"NOTES": ["dhbdhdd1xbxbxb"],';  
             node+=  '"ISO14224CODE": ["fghfh1dxbv"],';
             node+=  '"ISO14224ALT2": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"ISO14224ALT1": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"IDPCA": ["askasj1"],"DESIGNATION": ["kanpur1"],';
             node+=  '"DEFINITION": ["mayank1"],';
             node+=  '"ANNEXE_A": [ true],';
             node+=  '"__v": 0 },';
             
             
             node+=  '{"_id" : {"$oid": "54d0813d7c5a5b191320ef33"},';
             node+= '"CLASS_SUBCLASS": [],';
             node+= '"SUBCLASS_CODE":["ankush"],';
             node+= '"SOURCE": ["hfhfhfh1bxbx"],';
             node+=  '"PCA_URI": ["www.google.com"],';
             node+=  '"PARENT_CLASS": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"NOTES": ["dhbdhdd1xbxbxb"],';  
             node+=  '"ISO14224CODE": ["fghfh1dxbv"],';
             node+=  '"ISO14224ALT2": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"ISO14224ALT1": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"IDPCA": ["askasj1"],"DESIGNATION": ["kanpur1"],';
             node+=  '"DEFINITION": ["mayank1"],';
             node+=  '"ANNEXE_A": [ true],';
             node+=  '"__v": 0 },';
             
             
             
             node+= ' {"_id" : {"$oid": "54d0813d7c5a5b191320ef33"},';
             node+= '"CLASS_SUBCLASS": [],';
             node+= '"SUBCLASS_CODE":["nitish"],';
             node+= '"SOURCE": ["abra ka dabra"],';
             node+=  '"PCA_URI": ["www.yahoo.com"],';
             node+=  '"PARENT_CLASS": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"NOTES": ["dhbdhdd1xbxbxb"],';  
             node+=  '"ISO14224CODE": ["fghfh1dxbv"],';
             node+=  '"ISO14224ALT2": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"ISO14224ALT1": [{"$oid": "54d072ff3b90fc20125d0711"}],';
             node+=  '"IDPCA": ["askasj1"],"DESIGNATION": ["timeeeeee"],';
             node+=  '"DEFINITION": ["loveeeeeeeeeeeee"],';
             node+=  '"ANNEXE_A": [ true],';
             node+=  '"__v": 0 }]';
             
            
             

           JSONParser parser = JSON.createParser(node);
                   
        while(parser.nextToken() != null){
      
 
             if(parser.getText() == 'SUBCLASS_CODE'){
               parser.nextToken();
     
                 if(parser.getCurrentToken() == JSONToken.START_ARRAY ){
                          parser.nextToken();
                       uploadToken.add(parser.getText());
                       system.debug(uploadToken + ' $$$$$$$$$$$$');
                    }
                  } 
                  
                  
                  else if(parser.getText()=='SOURCE'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                
                   Sou.add(parser.getText());
                        }
                 }
                 
                  else if(parser.getText()=='PCA_URI'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                  PcaUri.add(parser.getText());
                 
                  }
                }
                else if(parser.getText()=='PARENT_CLASS'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                   parser.nextToken();
                   parser.nextToken();
                   parser.nextToken();
                    PARENT= parser.getText();
                  } 
                 } else if(parser.getText()=='NOTES'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                   Note = parser.getText();
               
                  }
                 }else if(parser.getText()=='ISO14224CODE'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                   ISO = parser.getText();
             
                  }
                 } 
                 
                 else if(parser.getText()=='ISO14224ALT2'){
                 parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                  parser.nextToken();
                  parser.nextToken();
                  ISO14 = parser.getText();
               
                  }
                 } else if(parser.getText()=='ISO14224ALT1'){
                 parser.nextToken();
                 if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                 parser.nextToken();
                 Parser.nextToken();
                 parser.nextToken();
                 IOS14= parser.getText();
              
                 }
                } else If(parser.getText()=='IDPCA'){
                  parser.nextToken();
                 if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                 parser.nextToken();
                  IDPCA = parser.getText();
                 
                 }
                } else if(parser.getText()=='DESIGNATION'){
                  parser.nextToken();
                  if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                  parser.nextToken();
                   DESIGNATION = parser.getText();  
                  }
                 }else if(parser.getText()=='DEFINITION'){
                 parser.nextToken();
                 if(parser.getCurrentToken()==JSONToken.START_ARRAY){
                 parser.nextToken();
                 DEFINITION = parser.getText();
                  }
                 }
      } 
      
      for (integer i = 0; i < uploadToken.size(); i++){
 
        wrapperlist.add(new wrapper(uploadToken[i].remove(']'),sou[i].remove(']'),PcaUri[i].remove(']')));
            system.debug('%%%%%%%%%%%%%%%%%% ' +wrapperlist);
            }
    } 

           public class Wrapper{
             public  String uploadToken1 {get;set;}
             public  String  Sou1 {get;set;}
             public  String PcaUri1 {get;set;}
               public Wrapper(String a,String b,String c ){
               uploadToken1 =a;
               Sou1 =b;
               PcaUri1=c;
             }
           }
    }