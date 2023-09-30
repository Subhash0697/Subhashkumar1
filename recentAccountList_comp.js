({
    doInit: function(component, event, helper) {
        // Call the server-side controller method to fetch the recent accounts
        var action = component.get("c.getRecentAccounts");

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            } else {
                console.log("Error fetching accounts: " + state);
            }
        });

        $A.enqueueAction(action);
    }
})