com_haulmont_thesis_cryptopro_web_CryptoProJavaScriptComponent = function() {

    var connector = new Object();
    connector.connector = this;
    connector.dataSigned = function(signedData) {
        connector.connector.dataSigned(signedData);
    };
    connector.pluginLoaded = function(certsList) {
        connector.connector.pluginLoaded(certsList);
    };

    // IOS_npcades_supp.js
    var ru_cryptopro_npcades_10_native_bridge = {
        callbacksCount: 1,
        callbacks: {},

        // Automatically called by native layer when a result is available
        resultForCallback: function resultForCallback(callbackId, resultArray) {
            var callback = ru_cryptopro_npcades_10_native_bridge.callbacks[callbackId];
            if (!callback) return;
            callback.apply(null, resultArray);
        },

        // Use this in javascript to request native objective-c code
        // functionName : string (I think the name is explicit :p)
        // args : array of arguments
        // callback : function with n-arguments that is going to be called when the native code returned
        call: function call(functionName, args, callback) {
            var hasCallback = callback && typeof callback == "function";
            var callbackId = hasCallback ? ru_cryptopro_npcades_10_native_bridge.callbacksCount++ : 0;

            if (hasCallback)
                ru_cryptopro_npcades_10_native_bridge.callbacks[callbackId] = callback;

            var iframe = document.createElement("IFRAME");
            var arrObjs = new Array("_CPNP_handle");
            try {
                iframe.setAttribute("src", "cpnp-js-call:" + functionName + ":" + callbackId + ":" + encodeURIComponent(JSON.stringify(args, arrObjs)));
            } catch (e) {
                alert(e);
            }
            document.documentElement.appendChild(iframe);
            iframe.parentNode.removeChild(iframe);
            iframe = null;
        },
    };

    function call_ru_cryptopro_npcades_10_native_bridge(functionName, array) {
        var tmpobj;
        var ex;
        ru_cryptopro_npcades_10_native_bridge.call(functionName, array, function(e, response) {
            ex = e;
            var str = 'tmpobj=' + response;
            eval(str);
            if (typeof(tmpobj) == "string") {
                tmpobj = tmpobj.replace(/\\\n/gm, "\n");
                tmpobj = tmpobj.replace(/\\\r/gm, "\r");
            }
        });
        if (ex)
            throw ex;
        return tmpobj;
    }

    function CertificateObj(certObj) {
        this.cert = certObj;
        this.certFromDate = new Date(this.cert.ValidFromDate);
        this.certTillDate = new Date(this.cert.ValidToDate);
    }

    CertificateObj.prototype.check = function(digit) {
        return (digit < 10) ? "0" + digit : digit;
    }

    CertificateObj.prototype.extract = function(from, what) {
        certName = "";

        var begin = from.indexOf(what);

        if (begin >= 0) {
            var end = from.indexOf(', ', begin);
            certName = (end < 0) ? from.substr(begin) : from.substr(begin, end - begin);
        }

        return certName;
    }

    CertificateObj.prototype.DateTimePutTogether = function(certDate) {
        return this.check(certDate.getUTCDate()) + "." + this.check(certDate.getMonth() + 1) + "." + certDate.getFullYear() + " " +
            this.check(certDate.getUTCHours()) + ":" + this.check(certDate.getUTCMinutes()) + ":" + this.check(certDate.getUTCSeconds());
    }

    CertificateObj.prototype.GetCertString = function() {
        return this.extract(this.cert.SubjectName, 'CN=') + "; Выдан: " + this.GetCertFromDate();
    }

    CertificateObj.prototype.GetCertFromDate = function() {
        return this.DateTimePutTogether(this.certFromDate);
    }

    CertificateObj.prototype.GetCertTillDate = function() {
        return this.DateTimePutTogether(this.certTillDate);
    }

    CertificateObj.prototype.GetPubKeyAlgorithm = function() {
        return this.cert.PublicKey().Algorithm.FriendlyName;
    }

    CertificateObj.prototype.GetCertName = function() {
        return this.extract(this.cert.SubjectName, 'CN=');
    }

    CertificateObj.prototype.GetIssuer = function() {
        return this.extract(this.cert.IssuerName, 'CN=');
    }

    function ObjCreator(name) {
        switch (navigator.appName) {
            case 'Microsoft Internet Explorer':
                return new ActiveXObject(name);
            default:
                var userAgent = navigator.userAgent;
                if (userAgent.match(/Trident\/./i)) { // IE10, 11
                    return new ActiveXObject(name);
                }
                if (userAgent.match(/ipod/i) || userAgent.match(/ipad/i) || userAgent.match(/iphone/i)) {
                    return call_ru_cryptopro_npcades_10_native_bridge("CreateObject", [name]);
                }
                var cadesobject = document.getElementById('cadesplugin');
                return cadesobject.CreateObject(name);
        }
    }

    function FillCertList_other() {
        var oStore = ObjCreator("CAPICOM.store");
        if (!oStore) {
            alert("store failed");
            return;
        }

        try {
            oStore.Open();
        } catch (ex) {
            alert("Ошибка при открытии хранилища: " + GetErrorMessage(ex));
            return;
        }

        var certCnt;

        try {
            certCnt = oStore.Certificates.Count;
        } catch (ex) {
            if ("Cannot find object or property. (0x80092004)" == GetErrorMessage(ex)) {
                var errormes = document.getElementById("boxdiv").style.display = '';
                return;
            }
        }

        var certsList = [];
        for (var i = 1; i <= certCnt; i++) {
            var cert;
            try {
                cert = oStore.Certificates.Item(i);
            } catch (ex) {
                alert("Ошибка при перечислении сертификатов: " + GetErrorMessage(ex));
                return;
            }

            var oOpt = document.createElement("OPTION");
            var certsListAtr = [];
            var dateObj = new Date();
            try {
                if (dateObj < cert.ValidToDate && cert.HasPrivateKey() && cert.IsValid()) {
                    var certObj = new CertificateObj(cert);
                    var algorithm = certObj.GetPubKeyAlgorithm();
                    if (algorithm.indexOf('ГОСТ Р 34.10-2001') != -1 || algorithm.indexOf('ГОСТ Р 34.10-2012') != -1) {
                        oOpt.text = certObj.GetCertString();
                        certsListAtr.push(oOpt.text);
                    }
                } else {
                    continue;
                }
            } catch (ex) {
                alert("Ошибка при получении свойства SubjectName: " + GetErrorMessage(ex));
            }
            try {
                oOpt.value = cert.Thumbprint;
                certsListAtr.push(oOpt.value);
            } catch (ex) {
                alert("Ошибка при получении свойства Thumbprint: " + GetErrorMessage(ex));
            }

            certsList.push(certsListAtr)
        }
        connector.pluginLoaded(certsList);

        oStore.Close();
    }

    function SignCadesBES_other(thumbprint, inputData, signedProperties) {
        var errormes = "";

        try {
            var oSigner = ObjCreator("CAdESCOM.CPSigner");
        } catch (err) {
            errormes = "Failed to create CAdESCOM.CPSigner: " + err.number;
            alert(errormes);
            throw errormes;
        }

        thumbprint = thumbprint.split(" ").reverse().join("").replace(/\s/g, "").toUpperCase();
        try {
            var oStore = ObjCreator("CAPICOM.store");
            oStore.Open();
        } catch (err) {
            alert('Failed to create CAPICOM.store: ' + err.number);
            return;
        }
        var CAPICOM_CERTIFICATE_FIND_SHA1_HASH = 0;
        var oCerts = oStore.Certificates.Find(CAPICOM_CERTIFICATE_FIND_SHA1_HASH, thumbprint);

        if (oCerts.Count == 0) {
            alert("Certificate not found");
            return;
        }
        var certObject = oCerts.Item(1);
        if (oSigner) {
            oSigner.Certificate = certObject;
        } else {
            errormes = "Failed to create CAdESCOM.CPSigner";
            alert(errormes);
            throw errormes;
        }

        var oSignedData = ObjCreator("CAdESCOM.CadesSignedData");
        var CADES_BES = 1;
        var CADESCOM_HASH_ALGORITHM_CP_GOST_3411 = 100;
        var Signature;

        var dataToSignArray = inputData.split(",");
        var signedData = "";
        if (signedProperties)
            signedData += "signedProperties:" + signedProperties + ",";
        for (var i = 0; i < dataToSignArray.length; i++) {
            var entry = dataToSignArray[i];
            var splittedEntry = entry.split(":");
            var dataToSign = splittedEntry[1];
            if (dataToSign) {
                var oHashedData = ObjCreator("CAdESCOM.HashedData");
                oHashedData.Algorithm = CADESCOM_HASH_ALGORITHM_CP_GOST_3411;
                oHashedData.SetHashValue(dataToSign);
                oSigner.Options = 1; //CAPICOM_CERTIFICATE_INCLUDE_WHOLE_CHAIN
                try {
                    Signature = oSignedData.SignHash(oHashedData, oSigner, CADES_BES);
                    signedData += splittedEntry[0] + ":" + Signature + ",";
                } catch (err) {
                    errormes = "Не удалось создать подпись из-за ошибки: " + GetErrorMessage(err);
                    alert(errormes);
                    throw errormes;
                }
            }
        }
        connector.dataSigned(signedData);
    }

    function decimalToHexString(number) {
        if (number < 0) {
            number = 0xFFFFFFFF + number + 1;
        }

        return number.toString(16).toUpperCase();
    }

    function GetErrorMessage(e) {
        var err = e.message;
        if (!err) {
            err = e;
        } else if (e.number) {
            err += " (0x" + decimalToHexString(e.number) + ")";
        }
        return err;
    }

    function whichBrowser() {
        //IE
        if (navigator.appName == "Microsoft Internet Explorer") {
            return "msie";
        }

        //Chrome
        if ((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) && (navigator.userAgent.toLowerCase().indexOf('safari') > -1) && (navigator.appName == "Netscape")) {
            return "chrome";
        }
        //Firefox
        if ((navigator.userAgent.toLowerCase().indexOf('firefox') > -1) && (navigator.appName == "Netscape")) {
            return "firefox";
        }
        //Safari
        if ((navigator.userAgent.toLowerCase().indexOf('safari') > -1) && !(navigator.userAgent.toLowerCase().indexOf('chrome') > -1) && (navigator.appName == "Netscape")) {
            return "safari";
        }
        //Opera
        if (navigator.appName == "Opera") {
            return "opera";
        }
    }

    function importApplication() {
        var id = "cadesplugin";
        var allsuspects = document.getElementsByTagName("object");
        for (var i = allsuspects.length; i >= 0; i--) {
            if (allsuspects[i] && allsuspects[i].getAttribute("id") != null && allsuspects[i].getAttribute("id").indexOf(id) != -1) {
                return;
            }
        }

        var cades = document.createElement("object");
        cades.setAttribute("id", id);
        cades.setAttribute("type", "application/x-cades");
        cades.setAttribute("style",
            "visibility: hidden; " +
            "width: 0px; " +
            "height: 0px; " +
            "margin: 0px; " +
            "padding: 0px; " +
            "border-style: none; " +
            "border-width: 0px; " +
            "max-width: 0px; " +
            "max-height: 0px; "
        );
        document.getElementsByTagName("body")[0].appendChild(cades);
    }

    function importExtension(wepAppUrl) {
        var targetattr = "src";
        var allsuspects = document.getElementsByTagName("script");
        var filename = "chrome-extension://iifchhfnnmpdbibifmljnfjhpififfog/nmcades_plugin_api.js";
        for (var i = allsuspects.length; i >= 0; i--) {
            if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(filename) != -1) {
                return true;
            }
        }
        var nmcades_plugin_api = document.createElement("script");
        var cryptopro_chrome = document.createElement("script");

        nmcades_plugin_api.setAttribute("type", "text/javascript");
        cryptopro_chrome.setAttribute("type", "text/javascript");

        nmcades_plugin_api.setAttribute("src", filename);
        cryptopro_chrome.setAttribute("src", wepAppUrl + "/VAADIN/resources/js/cryptopro_chrome.js");

        var signerCallback = function() {
            Signer.init(connector);
            Signer.FillCertList_chrome();
        }
//        don't know who will be first
        cryptopro_chrome.onload = signerCallback;
        nmcades_plugin_api.onload = signerCallback;

        document.getElementsByTagName("head")[0].appendChild(nmcades_plugin_api);
        document.getElementsByTagName("head")[0].appendChild(cryptopro_chrome);
        return false;
    }

    this.init = function(wepAppUrl) {
        switch (whichBrowser()) {
            case "chrome":
                if (importExtension(wepAppUrl)) {
                    Signer.init(connector);
                    Signer.FillCertList_chrome();
                }
                break;
            default:
                importApplication();
                FillCertList_other();
                break;
        }
    };

    this.sign = function(thumbprint, inputData, signedProperties) {
        switch (whichBrowser()) {
            case "chrome":
                Signer.SignCadesBES_chrome(thumbprint, inputData, signedProperties);
                break;
            default:
                SignCadesBES_other(thumbprint, inputData, signedProperties);
                break;
        }
    };
};