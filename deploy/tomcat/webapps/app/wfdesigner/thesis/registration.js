/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id: registration.js 22152 2015-10-14 14:03:51Z mishunin $
 */

Wf.FormRegistration = function(options) {
    Wf.FormRegistration.superclass.constructor.call(this, options);
};

YAHOO.lang.extend(Wf.FormRegistration, Wf.FormSelectSupportedDigitalSignature, {

    getForms: function() {
        var superForms = Wf.FormRegistration.superclass.getForms.call(this);
        var newForms = {};
        for (var name in superForms) {
            newForms[name] = superForms[name];
        }
        for (var name in Wf.FormRegistration.forms) {
            newForms[name] = Wf.FormRegistration.forms[name];
        }
        return newForms;
    }

});

Wf.FormRegistration.forms = {};

Wf.FormRegistration.registerForm = function(name, form) {
    Wf.FormRegistration.forms[name] = form;
};

inputEx.registerType("tsRegistration", Wf.FormRegistration);

Wf.registerForms = (function() {
    var originalRegisterForms = Wf.registerForms;
    return function() {
        originalRegisterForms();
        Wf.FormRegistration.registerForm("registration", {
            label: i18n.get("registration"),
            fields: []
        });
    }
})();