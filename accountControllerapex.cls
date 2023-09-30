public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getRecentAccounts() {
        // Query the 10 most recently created Accounts
        List<Account> recentAccounts = [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 10];
        return recentAccounts;
    }
}