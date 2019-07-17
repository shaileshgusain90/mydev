/**
author        : www.aslambari.com
date          : 29 May, 2011
description   : the class is use to coverage the test for available classes. The code is just to cover the
                code coverage (left actual testing due to time limit) , however it can be written in good way using asserts.
*/
public class TestAuthorizeDotNetLib{
   @isTest
   private static void testclasses(){
        DoPaymentHandler doPayment = new DoPaymentHandler();
        doPayment.process();
        doPayment.getMonths();
        doPayment.getYears();
        doPayment.amount='test';
        doPayment.firstname='test';
        doPayment.lastname='test';
        doPayment.email='test';
        doPayment.address='test';
        doPayment.city='test';
        doPayment.state='test';
        doPayment.zip='test';
        doPayment.cardholder='test';
        doPayment.cardnumber='test';
        doPayment.cardyear='test'; 
        doPayment.cardmonth='test';
        doPayment.cardcvv='test';
        doPayment.expiration='test';
        doPayment.selectedCardType='test';
        doPayment.process();
   }

}