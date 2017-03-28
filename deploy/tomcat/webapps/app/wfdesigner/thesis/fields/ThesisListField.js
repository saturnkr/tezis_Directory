/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id: ThesisListField.js 22399 2015-10-31 10:18:15Z mishunin $
 */

Wf.ThesisListField = function(options) {
    this.initialize = false;
    this.addedFirstElement = false;

    Wf.ThesisListField.superclass.constructor.call(this, options);
};

YAHOO.lang.extend(Wf.ThesisListField, inputEx.ListField, {

    setContainer: function(container) {
        Wf.ThesisListField.superclass.setContainer.call(this, container);

        var fieldCalss = inputEx.getFieldClass(this.options.elementType.type);
        this.initDefaultOptions = fieldCalss && (fieldCalss === Wf.FormSelectSupportedDigitalSignature || fieldCalss === Wf.FormRegistration);
        if (this.options.container.eventAddOutput)
            this.initDefaultForm();
    },

    initDefaultForm: function() {
        if (!this.initialize && this.initDefaultOptions) {
            if (this.options.container.eventAddOutput) {
                this.options.container.eventAddOutput.subscribe(this.onAddOutput, this, true);
                this.options.container.eventDelOutput.subscribe(this.onDelOutput, this, true);
            } else if (!(YAHOO.lang.isNumber(this.options.maxItems) && this.subFields.length >= this.options.maxItems)) {
                this.renderDefaultForm();
            }
            this.initialize = true;
        }
    },

    onAddOutput: function(e, params) {
        this.renderDefaultForm(params[0]);
    },

    onDelOutput: function(e, params) {
        this.delForTransition(params[0]);
    },

    setValue: function(value, sendUpdatedEvt) {
        if(YAHOO.lang.isArray(value) ) {
            Wf.ThesisListField.superclass.setValue.call(this, value, sendUpdatedEvt);
        } else if (!this.subFields.length) {
            this.initDefaultForm();
        }
    },

    delForTransition: function(transition) {
        var elementDiv = this.childContainer;
        var subFieldEl = elementDiv.childNodes[this.options.useButtons ? 1 : 0];
        var index = -1;
        var indexes = new Array();
        for (var i = 0 ; i < this.subFields.length ; i++) {
            if (this.subFields[i].transitionField && this.subFields[i].transitionField.getValue() == transition) {
                indexes.push(i);
            }
        }
        while (indexes.length > 0) {
            this.removeElement(indexes.pop());
        }
        this.resetAllNames();
        this.fireUpdatedEvt();
    },

    addElement: function(value) {
        this.addedFirstElement = true;
        return Wf.ThesisListField.superclass.addElement.call(this, value);
    },

    removeElement: function(index) {
        Wf.ThesisListField.superclass.removeElement.call(this, index);
        if (this.subFields.length == 0) {
            this.addedFirstElement = false;
        }
    },

    renderDefaultForm: function(defaultTransition) {
        var addedFirstElement = this.addedFirstElement;
        var subFieldEl = this.addElement();

        if (defaultTransition)
            subFieldEl.options.defaultTransition = defaultTransition;

        var firstElementDefaults = subFieldEl.options.firstElementDefaults;
        if (!addedFirstElement && firstElementDefaults) {
            for (var keyProp in firstElementDefaults) {
                subFieldEl.options[keyProp] = firstElementDefaults[keyProp];
            }
        }

        if (!subFieldEl.options.defaultTransitionStyle) {
            if (addedFirstElement) {
                subFieldEl.options.defaultTransitionStyle= "failure";
            } else {
                subFieldEl.options.defaultTransitionStyle= "success";
            }
        }

        subFieldEl.applyDefault(defaultTransition);

        subFieldEl.focus();

        this.fireUpdatedEvt();

        return subFieldEl;
    }
});
inputEx.registerType("list", Wf.ThesisListField);

