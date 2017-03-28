/*
 * Copyright (c) 2011 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * Author: Konstantin Krivopustov
 * Created: 01.02.11 14:51
 *
 * $Id: script-select.js 19482 2015-03-18 12:56:44Z stekolschikov $
 */
Wf.ScriptSelectWithNullOption = function(options) {
    Wf.ScriptSelectWithNullOption.superclass.constructor.call(this, options);

    this.refresh(false);
};

YAHOO.lang.extend(Wf.ScriptSelectWithNullOption, inputEx.SelectField, {

    setOptions: function(options) {
        Wf.OutputSelect.superclass.setOptions.call(this, options);

        this.options.className = options.className || 'Wf-ScriptSelectWithNullOption';
        this.options.container = options.container;
    },

    setValue: function(val, sendUpdatedEvt) {
        if (!val)
            return;
        this.refresh(true);
        Wf.ScriptSelectWithNullOption.superclass.setValue.call(this, val, sendUpdatedEvt);
    },

    refresh: function(useScriptsCache) {
        var i;

        this.clear();
        for (i = 0; i < this.choicesList.length; i++) {
            var choice = this.choicesList[i];
            this.removeChoiceNode(choice.node);
        }
        this.choicesList = [];

        if (useScriptsCache && Wf.scriptsCache) {
            var empty = {value: ""};
            if (this.getChoicePosition(empty) == -1)
                this.addChoice(empty);

            for (var j = 0; j < Wf.scriptsCache.length; j++) {
                var s = Wf.scriptsCache[j];
                var v = {value: s};
                if (this.getChoicePosition(v) == -1)
                    this.addChoice(v);
            }
        } else {
            Wf.loadScripts(this.addScripts, this);
        }
    },

    addScripts: function(scripts) {
        Wf.scriptsCache = scripts;
        var empty = {value: ""};
        if (this.getChoicePosition(empty) == -1)
            this.addChoice(empty);
        for (var i = 0; i < scripts.length; i++) {
            var v = {value: scripts[i]};
            if (this.getChoicePosition(v) == -1)
                this.addChoice(v);
        }
    }
});

inputEx.registerType("tsScriptSelect", Wf.ScriptSelectWithNullOption);
