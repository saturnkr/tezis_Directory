/*
 * Copyright (c) 2010 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * Author: Konstantin Krivopustov
 * Created: 14.01.11 12:42
 *
 * $Id: form-select.js 22487 2015-11-09 12:10:44Z mishunin $
 */
Wf.FormSelectSupportedDigitalSignature = function(options) {
    this.initDefaultFields = true;
    Wf.FormSelectSupportedDigitalSignature.superclass.constructor.call(this, options);
};

YAHOO.lang.extend(Wf.FormSelectSupportedDigitalSignature, Wf.FormSelect, {
    setOptions: function(options) {
        Wf.FormSelectSupportedDigitalSignature.superclass.setOptions.call(this, options);

        this.options.defaultForm = options.defaultForm;
        if (!this.options.defaultForm) {
            this.options.defaultForm = "resolution";
        }
        this.options.firstElementDefaults = options.firstElementDefaults;
        this.options.defaultTransitionStyle = options.defaultTransitionStyle;
        this.options.defaultFormFields = options.defaultFormFields;
    },

    setValue: function(value, sendUpdatedEvt) {
        this.applyDefaultFields();

        Wf.FormSelectSupportedDigitalSignature.superclass.setValue.call(this, value, sendUpdatedEvt);
    },

    renderFormParams: function() {
        try {
            if (this.formParamsGroup) {
                this.fieldset.removeChild(this.formParamsGroup.getEl());
                this.formParamsGroup = undefined;
            }
            var form = this.getForm(this.formName);
            if (form) {
                var digitalSignature = YAHOO.util.Dom.get("digitalSignature")
                var myFields=[];
                for(var i in form.fields){
                    if (form.fields[i].name=="digitalSignature"){
                        if (digitalSignature){
                            myFields.push(form.fields[i]);
                        }
                    } else {
                        myFields.push(form.fields[i]);
                    }
                }
                this.formParamsGroup = inputEx({type: "group", fields: myFields}, this);
                this.fieldset.appendChild(this.formParamsGroup.getEl());
                this.formParamsGroup.updatedEvt.subscribe(this.onDataChanged, this, true);

                this.updateCommentRequired();
                this.applyDefaultFields();
            }
        } catch(e) {
            console.log(e)
        }
    },

    updateCommentRequired: function() {
        if (this.transitionStyle && this.transitionStyle.getValue() && this.formParamsGroup && this.formParamsGroup.inputs) {
            for (var i = 0; i < this.formParamsGroup.inputs.length; i++) {
                if (this.formParamsGroup.inputs[i].options.name === "commentRequired") {
                    this.formParamsGroup.inputs[i].setValue(this.transitionStyle.getValue() !== "success", false);
                }
            }
        }
    },

    onDataChanged: function(e, params) {
        Wf.FormSelectSupportedDigitalSignature.superclass.onDataChanged.call(this, params);

        if (params.length > 1 && this.transitionStyle && params[1] === this.transitionStyle) {
            this.updateCommentRequired();
        }
    },

    render: function() {
        Wf.FormSelectSupportedDigitalSignature.superclass.render.call(this);

        if (this.transitionField) {
            this.transitionField.initOutputListeners(this.options.container);
        }
    },

    applyDefault: function(defaultTransition) {
        if (defaultTransition && this.transitionField) this.transitionField.setValue(defaultTransition, false);
        if (this.options.defaultTransitionStyle && this.transitionStyle) this.transitionStyle.setValue(this.options.defaultTransitionStyle, false);
        if (this.options.defaultForm && this.formTypeField) {
            this.formTypeField.setValue(this.options.defaultForm, false);

            this.initDefaultFields = false;
            params = [this.options.defaultForm, this.formTypeField];
            this.onFormTypeChanged("updated", params);
        }
    },

    applyDefaultFields: function() {
        if (!this.initDefaultFields) {
            this.initDefaultFields = true;
            if (this.options.defaultFormFields && this.formParamsGroup && this.formParamsGroup.inputs) {
                for (var i = 0; i < this.formParamsGroup.inputs.length; i++) {
                    var field = this.formParamsGroup.inputs[i];
                    if (this.options.defaultFormFields[field.options.name]) {
                        field.setValue(this.options.defaultFormFields[field.options.name], true);
                    }
                }
            }
        }
    }
});
inputEx.registerType("wfFormSelect", Wf.FormSelectSupportedDigitalSignature);