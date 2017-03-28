/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id: ts-card-property-container.js 22335 2015-10-27 10:30:24Z mishunin $
 */

Wf.TsCardPropertyContainer = function(options, layer) {
    Wf.TsCardPropertyContainer.superclass.constructor.call(this, options, layer);
};

YAHOO.lang.extend(Wf.TsCardPropertyContainer, Wf.CardPropertyContainer, {

    xtype: "Wf.TsCardPropertyContainer",

    updateValuefields: function(result) {
        Wf.TsCardPropertyContainer.superclass.updateValuefields.call(this, result);
        if (result.attributeType != "DATE_TIME" && result.attributeType != "DATE") {
            this.expressionField.setValue(false, !this.isLoadEvent);
            this.expressionField.hide();
        }
    }

});