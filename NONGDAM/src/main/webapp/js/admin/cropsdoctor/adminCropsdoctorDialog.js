function dialogNode(dialogNM, num){
	var html = 
		    "<div class='panel panel-default dialogSelectDiv' id='" + dialogNM + "'>" + 
				"<div class='panel-heading'>" + 
					"<h4 class='panel-title'>" + 
						"<a data-toggle='collapse' data-parent='#accordionD' href='#dialogNode" + num + "'>" + 
							dialogNM +
						"</a>" + 
					"</h4>" + 
				"</div>" + 
				"<div id='dialogNode" + num + "' class='panel-collapse collapse'>" + 
					"<div class='panel-body'>확타야</div>" + 
				"</div>" + 
		    "</div>";
	
	
	return html;
}