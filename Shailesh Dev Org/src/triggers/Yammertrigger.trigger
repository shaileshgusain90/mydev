trigger Yammertrigger on Account (after insert) {

    for(Account acc : trigger.new){
        CreateYammerAccount.createNewYammer(acc.name);
        }
  }