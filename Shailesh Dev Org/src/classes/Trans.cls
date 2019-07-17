public class Trans{

public  Integer multiply1 {get; set;}
public  transient Integer multiply2  {get; set;}
 public  Integer val1{get; set;}
 public transient  Integer val2{get; set;}

public Trans (){
    multiply1 = 3;
    multiply2 = 4;

}
public pagereference delid(){
val1=multiply1*2 ;
val2=multiply2*2;
return null;
}

public void setMultiply1(integer multiply1){
    this.multiply1=multiply1;
    //return Multiply1;
    }
public void setMultiply2(integer multiply2){
    this.multiply2=multiply2;
    //return Multiply2;
    
    }
public integer getMultiply1(){

 //multiply1=multiply1*2;
 //doIt(multiply1);
 return Multiply1;


}

  public integer getMultiply2(){
  // multiply2=multiply2*2;
   //doIt(multiply2);
    return Multiply2;
 
 }   



    



}