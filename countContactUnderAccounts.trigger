trigger countContactUnderAccount on Contact (after insert,after update,after delete,after undelete) {
    Set<Id> idset = new Set<Id>(); 
    List<Account> accList = New List<Account>();
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            for(Contact con : trigger.new){
                idset.add(con.AccountId);
            }
        }
        if(trigger.isDelete){
            for(Contact con : trigger.old){
               idset.add(con.AccountId); 
            }
        }
        List<Account> acList = [select Id,name,(select Id From Contacts) from Account Where Id=:idset];
        for(Account acc:acList){
            Integer NumberOfContacts = acc.Contacts.size();
            acc.Number_of_Contacts__c = NumberOfContacts;
            accList.add(acc);
        }
        if(accList !=Null){
            Update accList;
        }
    }
}