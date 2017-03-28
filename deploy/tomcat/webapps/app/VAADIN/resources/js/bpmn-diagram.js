window.arrowOverlay = [ "Arrow", {
    width : 5,
    location : 1,
    id : "arrow",
    length : 5,
    foldback : 0
} ];

jQuery(document)
    .ready(
    function() {
        jsPlumb.importDefaults({
            Endpoint : [ "Blank", {
                radius : 3
            } ],
            ConnectionOverlays : [ arrowOverlay ]
        });
    }
)