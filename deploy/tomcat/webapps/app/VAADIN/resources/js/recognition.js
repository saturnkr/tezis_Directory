com_haulmont_thesis_web_gui_components_recognition_RecognitionJavaScriptComponent = function() {

	var buttonEl;
	var speakDiv;
	var recStartClassName = 'rec-button-start';
	var recStopClassName = 'rec-button-stop';
	var textAreaRightMarginToDiplayStarComponent = 13;
	var e = this.getElement();
	var recognizing = false;
	var connector = this;

	//change button's style when it has been clicked
	$( ".v-button-rec-button").each(function(index,element) {
		element.addEventListener("click",
             	function(){
             		buttonEl = element;
             	});
        var cl = 'rec-button-start';
        if (!hasClass(element,cl))
       	 	element.className+= ' ' + cl;
	});

	//moving required star component to div that contains textarea
	var widgetComp = $("#rec-component-widget");
	var divWithStar = widgetComp.parent().find('.v-required-field-indicator').parent();
	var textarea = widgetComp.find('textarea.rec-text.v-textarea-rec-text');
	divWithStar.css("margin-right", -textAreaRightMarginToDiplayStarComponent)
	divWithStar.css("margin-top", "-5px")
	divWithStar.appendTo(widgetComp.find('.v-slot.v-slot-rec-text'))

	//
	if (widgetComp.width() != 0) {
		var textarea = widgetComp.find('textarea.rec-text');
		//sometimes when change tabs or screens widgetComp width become equals textarea width and star component will not be seen
		if (widgetComp.find('.v-required-field-indicator').length != 0 &&
			(textarea.width() == widgetComp.width()
			|| (widgetComp.width() - textarea.width()) < textAreaRightMarginToDiplayStarComponent))
			textarea.width(textarea.width() - textAreaRightMarginToDiplayStarComponent);
	}

	//span textarea. resize.js is required for this
	$("#rec-component-widget").bind('resize', function(){
		var parentContainerWidth = $(this).width();
		var resultWidth = parentContainerWidth;
		if ( ($(this)).find('.v-required-field-indicator').length != 0)
			// if widget have textarea with required input when release place for star component right of textarea
			resultWidth = parentContainerWidth - textAreaRightMarginToDiplayStarComponent;

		if (parentContainerWidth == resultWidth)
			$(this).find('textarea.rec-text').width(resultWidth);
        connector.setWidth(resultWidth);
		$(this).unbind('resize')
		$(this).removeAttr('id');
    });

	//set/unset focus style to icon panel when textarea is focused on/off
	$('.rec-text .v-textarea').focus(function() {
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "border-color","#4681be" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "outline","0" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "-webkit-box-shadow","inset 4px 0 3px -3px rgba(70,129,190,0.5)," +
        	"inset -4px 0 3px -3px rgba(70,129,190,0.5), inset 0 -4px 3px -3px rgba(70,129,190,0.5)" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "box-shadow","inset 4px 0 3px -3px rgba(70,129,190,0.5)," +
			"inset -4px 0 3px -3px rgba(70,129,190,0.5), inset 0 -4px 3px -3px rgba(70,129,190,0.5)" );

//  oroginally was
//	-webkit-box-shadow: inset 0 0 3px 1px rgba(70,129,190,0.5);
//	box-shadow: inset 0 0 3px 1px rgba(70,129,190,0.5);
		if (isRecognitionEnabled()) {
			$('.rec-text .v-textarea').css( "-webkit-box-shadow","inset 4px 0 3px -3px rgba(70,129,190,0.5)," +
        		"inset -4px 0 3px -3px rgba(70,129,190,0.5), inset 0 4px 3px -3px rgba(70,129,190,0.5)" );
			$('.rec-text .v-textarea').css( "box-shadow","inset 4px 0 3px -3px rgba(70,129,190,0.5)," +
        		"inset -4px 0 3px -3px rgba(70,129,190,0.5), inset 0 4px 3px -3px rgba(70,129,190,0.5)" );
        } else {
        	$('.rec-text .v-textarea').css( "-webkit-box-shadow","inset 0 0 3px 1px rgba(70,129,190,0.5)" );
            $('.rec-text .v-textarea').css( "box-shadow","inset 0 0 3px 1px rgba(70,129,190,0.5)" );
        }
	});
	$('.rec-text .v-textarea').focusout(function() {
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "border-color","#dadada" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "outline","" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "-webkit-box-shadow","" );
		$(this).closest('.rec-component').find('.v-slot.v-slot-rec-button').css( "box-shadow","" );

		$('.rec-text .v-textarea').css( "-webkit-box-shadow","" )
		$('.rec-text .v-textarea').css( "box-shadow","" )
	});

	var recognition;

	if (isRecognitionEnabled()) {
		recognition = new webkitSpeechRecognition();
		connector.getLocale();

		this.setLocale = function(locale, message) {
			recognition.lang = locale;
			speakDiv = document.createElement('span');
			speakDiv.innerHTML = message;
			$(speakDiv).addClass("speak-div")
		};
	}

	this.startRec = function() {
		if (recognizing)
			recognition.stop();
		else
			recognition.start();
	};

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }

    function isRecognitionEnabled() {
    	return ('webkitSpeechRecognition' in window) && connector.getState().recognitionEnabled;
    }

	this.onStateChange = function() {
		var disabledCls = 'disabledButton';
		if (!isRecognitionEnabled()) {
       		// don't display rec buttons if browser doesn't support webSpeechRecognition
       		$(".v-slot-rec-button, .rec-text").each(function(index, element) {
       			$(element).addClass(disabledCls);
       			return;
       		});
       		return;
		} else {
			$(".v-slot-rec-button, .rec-text").each(function(index, element) {
				$(element).removeClass(disabledCls);
				return;
			});
		}

		var finalTranscript = '';
		recognition.continuous = true;
		recognition.useTimeout = true; //enable stop after x seconds of receiving no results
	    recognition.counterTime, recognition.counterMaxTime = 60; //time to countdown in seconds
	    recognition.timer;

	    recognition.countDown = function() {
			this.counterTime == 0 ? this.stop() : this.counterTime--;
        };

	  	recognition.counterReset = function() {
			clearTimeout(this.timer);
			this.counterTime = this.counterMaxTime;
		};

		function capitalize(str) {
			return str.length ? str[0].toUpperCase() + str.slice(1) : str;
		};

		function sendResultToServer(value) {
			connector.setResultToTextField(value);
		};

		recognition.onstart = function() {
			connector.start();
			if (this.useTimeout)
               	this.timer = setTimeout(this.countDown(), 1000);
			recognizing = true;

			//turn off all active buttons
			$('.rec-button-stop').each(function(index,element) {
			 	$(element).removeClass(recStopClassName);
				if (!hasClass(element,recStartClassName))
					element.className += ' ' + recStartClassName;
			});
			$('.speak-div').each(function(index,element) {
				$(element).remove();
			})

			$(buttonEl).removeClass(recStartClassName);
			$(buttonEl).prepend($(speakDiv)); // add speak label near rec icon
			if (!hasClass(buttonEl,recStopClassName))
				buttonEl.className += ' ' + recStopClassName;
		};

		recognition.onend = function() {
			recognizing = false;
			$(buttonEl).removeClass(recStopClassName);
			$(buttonEl).find('.speak-div').remove();
			if (!hasClass(buttonEl,recStartClassName))
            	buttonEl.className += ' ' + recStartClassName;
            connector.end();
		};

		recognition.onresult = function(event) {
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					finalTranscript += event.results[i][0].transcript;
				}
			}
			finalTranscript = capitalize(finalTranscript);
			sendResultToServer(finalTranscript);
			if (this.useTimeout){
                this.counterReset();
                this.countDown();
            }
		};
	}
}