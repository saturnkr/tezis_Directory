/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id: ThesisSelectField.js 22062 2015-10-08 08:10:00Z mishunin $
 */

Wf.ThesisSelectField = function(options) {
    Wf.ThesisSelectField.superclass.constructor.call(this, options);
};

YAHOO.lang.extend(Wf.ThesisSelectField, inputEx.SelectField, {

    initOutputListeners: function(container) {
        this.options.container = container;

        if (container.eventAddOutput) {
            container.eventAddOutput.subscribe(this.onAddOutput, this, true);
        }
        if (container.eventDelOutput) {
            container.eventDelOutput.subscribe(this.onDelOutput, this, true);
        }
        if (container.eventOutputChanged) {
            container.eventOutputChanged.subscribe(this.onOutputChanged, this, true);
        }
    },

    onAddOutput: function(e, params) {
        var choice = {value: params[0]};
        if (this.getChoicePosition(choice) == -1)
            this.addChoice(choice);
    },

    onDelOutput: function(e, params) {
        var choice = {value: params[0]};
        if (this.getChoicePosition(choice) >= -1)
            this.removeChoice(choice);
    },

    onOutputChanged: function(e, params) {
        var currentValue = this.getValue();
        var itemToChange = params[0];

        if(itemToChange.prevValue == currentValue) {
            this.setValue(itemToChange.value, false, true);
        } else {
            this.setValue(this.getValue(), false, true);
        }
    },

    setValue: function(val, sendUpdatedEvt, refresh) {
        if (!val)
            return;

        if (refresh)
            this.refresh();

        Wf.ThesisSelectField.superclass.setValue.call(this, val, sendUpdatedEvt);
    },

    refresh: function() {
        var i;

        this.clear();
        for (i = 0; i < this.choicesList.length; i++) {
            var choice = this.choicesList[i];
            this.removeChoiceNode(choice.node);
        }
        this.choicesList = [];

        if (this.options.container) {
            for (i = 0; i < this.options.container.terminals.length; i++) {
                var terminal = this.options.container.terminals[i];
                if (terminal.alwaysSrc) {
                    this.addChoice({value: terminal.name});
                }
            }
        }
    }

});
inputEx.registerType("select", Wf.ThesisSelectField);