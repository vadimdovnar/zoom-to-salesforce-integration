({
    changeView : function(component, event, helper) {
        component.get("v.truthy") == false ? component.set("v.truthy", true) : component.set("v.truthy", false);
    },
    
    openModal : function(component, event, helper) {
        component.set("v.isModalHidden", false);
    },

    onConfirm: function(component, event, helper) {
        component.set("v.isModalHidden", true);
    },

    onCancel: function(component, event, helper) {
        component.set("v.isModalHidden", true);
    }
})