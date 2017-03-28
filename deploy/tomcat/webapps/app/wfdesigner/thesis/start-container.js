/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id: start-container.js 22062 2015-10-08 08:10:00Z mishunin $
 */

Wf.StartContainer = function(options, layer) {
	this.init = false;
    Wf.StartContainer.superclass.constructor.call(this, options, layer);
}

YAHOO.lang.extend(Wf.StartContainer, Wf.ImageContainer, {
	xtype: "Wf.StartContainer",

	render: function() {
        Wf.StartContainer.superclass.render.call(this);

        if (Wf.editor && !Wf.editor.preventLayerChangedEvent) {
            var startContainer = this;
            this.layer.eventAddContainer.subscribe(function(e,params) {
                if (!startContainer.init) {
                    var container = params[0];
                    if (startContainer === container) {
                        container.applyFocus();
                        startContainer.init = true;
                    }
                }
            });
        }
    },

    applyFocus: function() {
        if (this.layer) {
            if(this.layer.focusedContainer && this.layer.focusedContainer != this) {
                this.layer.focusedContainer.removeFocus();
            }
            this.setFocus();
            this.layer.focusedContainer = this;
        }
    }
});