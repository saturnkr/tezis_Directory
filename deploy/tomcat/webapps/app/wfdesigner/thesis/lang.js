/*
 * Copyright (c) 2011 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.

 * Author: Konstantin Krivopustov
 * Created: 07.02.11 13:04
 *
 * $Id: lang.js 22698 2015-11-23 13:20:27Z mishunin $
 */

var thesisLanguage = {

    languageName: "Thesis",

    modules: [
        {
            "name": "Start",
            "label": "msg://Start",
            "category": "common",
            "container": {
                "xtype":"Wf.StartContainer",
                "className": "WireIt-Container WireIt-ImageContainer Bubble",
                "icon": "../common/res/icons/start_icon.png",
                "image": "../common/res/icons/start.png",
                "selectedImage": "../common/res/icons/start-selected.png",
                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://Start",
                        "readonly":"true"
                    },
                    {
                        "type": "boolean",
                        "label": "msg://Start.mark",
                        "name": "mark",
                        "value": true
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    defaultForm: "transition",
                                    defaultFormFields: {
                                        commentVisible: true,
                                        cardRolesVisible: true
                                    },
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: false
                                }
                            }
                        ]
                    }
                ],
                "terminals": [
                    {
                        "direction": [0,1], "offsetPosition": {"left": 8, "top": 30 }, "name": "out",
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "Endorsement",
            "label": "msg://Endorsement",
            "description": "msg://Endorsement",
            "category": "documents",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/endorsement_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Endorsement"
                    },
                    {
                        "type": "string",
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Endorsement",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "label": "msg://description",
                        "name": "description",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://ParallelAssignment.successTransition",
                        "name": "successTransition",
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.refusedOnly",
                        "name": "refusedOnly",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.finishBySingleUser",
                        "name": "finishBySingleUser",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },

        {
            "name": "SequentialEndorsement",
            "label": "msg://SequentialEndorsement",
            "description": "msg://SequentialEndorsement",
            "category": "documents",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/endorsement_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://SequentialEndorsement"
                    },
                    {
                        "type": "string",
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://SequentialEndorsement",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "label": "msg://description",
                        "name": "description",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://ParallelAssignment.successTransition",
                        "name": "successTransition",
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.refusedOnly",
                        "name": "refusedOnly",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },

        {
            "name": "Approval",
            "label": "msg://Approval",
            "description": "msg://Approval",
            "category": "documents",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Approval"
                    },
                    {
                        "type": "string",
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Approval",
                        "readonly":"true"
                    },

                    {

                        "type": "string",
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "DocVersionCreation",
            "label": "msg://DocVersionCreation",
            "description": "msg://DocVersionCreation.descr",
            "category": "documents",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/doc_version_icon.png",
                "width": 250,

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://DocVersionCreation",
                        "readonly":"true"
                    }
                ],

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://DocVersionCreation"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "Registration",
            "label": "msg://Registration",
            "category": "documents",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Registration"
                    },
                    {
                        "type": "string",
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Registration",
                        "readonly":"true"
                    },

                    {

                        "type": "string",
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    firstElementDefaults: {
                                        defaultForm: "registration",
                                    },
                                    type: "tsRegistration",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "ScriptExecution",
            "label": "msg://ScriptExecution",
            "description": "msg://ScriptExecution",
            "category": "common",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../common/res/icons/card_state_icon.png",
                "width": 230,

                "fields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "required": true,
                        "value": "msg://name"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": ""
                    },

                    {
                        "type": "wfScriptSelect",
                        "name": "script",
                        "label": "msg://script",
                        "required": true,
                        "value": ""
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 100, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 100, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "CustomActivity",
            "label": "msg://CustomActivity",
            "description": "msg://CustomActivity",
            "category": "common",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/wrench_screwdriver.png",
                "width": 230,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "name": "activityClass",
                        "label": "msg://activityClass",
                        "required": true,
                        "value": "com.haulmont.YourClass"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "TaskCreate",
            "label": "msg://TaskCreate",
            "category": "tasks",
            "description": "msg://TaskCreate",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/wrench_screwdriver.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "label": "msg://taskName",
                        "name": "taskName",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "name": "roleInitiator",
                        "label": "msg://roleInitiator",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "name": "roleExecutor",
                        "label": "msg://roleExecutor",
                        "required": true,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "name": "roleController",
                        "label": "msg://roleController",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "name": "roleObserver",
                        "label": "msg://roleObserver",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "name": "waitCompletion",
                        "label": "msg://waitCompletion",
                        "required": false,
                        "value": true
                    },
                    {
                        "type": "boolean",
                        "name": "oneOfTheExecutors",
                        "label": "msg://oneOfTheExecutors",
                        "required": false,
                        "value": false
                    },
                    {
                        "type": "tsScriptSelect",
                        "label": "msg://script",
                        "name": "script",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://transitionAtTheEndTask",
                        "name": "transitionAtTheEndTask",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://transitionAtTheCancelTask",
                        "name": "transitionAtTheCancelTask",
                        "value": ""
                    }
                ],
                "terminals": [
                    {
                        "name": "in", "direction": [0, -1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in", "allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
             "name": "SubDesign",
             "label": "msg://SubDesign",
             "description": "msg://SubDesign",
             "category": "common",
             "container": {
                 "xtype": "Wf.DesignContainer",
                 "icon": "../common/res/icons/assignment_icon.png",
                 "width": 250,

                 "optFields": [
                     {
                          "type":"string",
                          "label":"msg://name",
                          "name":"name",
                          "required":false,
                          "value":"msg://SubDesign",
                          "readonly":"true"
                     },
                     {
                          "type": "wfDesignSelect",
                          "name": "design",
                          "label": "msg://SubDesign",
                          "required": false,
                          "disabled": true
                     }
                 ],
                 "fields": [
                     {
                          "type": "string",
                          "name": "name",
                          "label": "msg://name",
                          "required": false
                     },
                     {
                          "type": "wfDesignSelect",
                          "name": "design",
                          "label": "msg://SubDesign",
                          "required": false
                    },
                 ],

                 "terminals": [
                     {
                          "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                          "ddConfig": {"type": "in","allowedTypes": ["out"]}
                     },
                     {
                          "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                          "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true,
                          "nMaxWires" : 1
                     }
                 ]
             }
        }
    ],

    extendContainers: [
        {superContainer: "Wf.CardPropertyContainer", extendContainer: "Wf.TsCardPropertyContainer"}
    ],

    registerForms: function() {
        Wf.registerForms();

        Wf.FormSelect.registerForm("resolution", {
            label: i18n.get("resolution"),
            fields: [
                {type: "boolean", name: "attachmentsVisible", label: i18n.get("attachmentsVisible")},
                {type: "boolean", name: "commentRequired", label: i18n.get("commentRequired")},
                {type: "boolean", name: "digitalSignature", label: i18n.get("digitalSignature")},
            ]
        });
    }
};

var remotingModules = [
        {
            "name": "StoreCard",
            "label": "msg://StoreCard",
            "description": "msg://StoreCard",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "name": "viewName",
                        "label": "msg://viewName",
                        "value": ""
                    },
                    {
                        "type": "string",
                        "name": "copyConfigName",
                        "label": "msg://copyConfigName",
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "UploadFiles",
            "label": "msg://UploadFiles",
            "description": "msg://UploadFiles",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "StartProcess",
            "label": "msg://StartProcess",
            "description": "msg://StartProcess",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "name": "procCode",
                        "label": "msg://procCode",
                        "value": "Endorsement"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "SignalProcess",
            "label": "msg://SignalProcess",
            "description": "msg://SignalProcess",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "name": "signalName",
                        "label": "msg://signalName",
                        "value": "ok"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        }
]

var remotingEnabled = false;

if (remotingEnabled == true) {
    for (var i = 0; i < remotingModules.length; i++) {
	    thesisLanguage.modules.push(remotingModules[i]);
    }
}
