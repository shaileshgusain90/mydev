public class QuoteClass{

     public Quote q {

       get;
          set;}

      public QuoteClass(){
           q = new Quote();
           
           }
           
           list<Quote> qu = new List<Quote>();
           
             public list<Quote> getQuotes(){
           
           list<Quote> qp = [Select Description,discount,totalPrice from Quote];
           
           return qp;
           
           }
    }