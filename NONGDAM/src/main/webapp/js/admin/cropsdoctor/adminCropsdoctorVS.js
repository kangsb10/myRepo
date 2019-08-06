function printClasses(arr){

	var resultHtml =  "";
	for(var i = 0; i < arr.length; i++){
		var html = 
			"<tr>" +
				"<td>" + arr[i] + "</td>" +
//				"<td>" +
//					"<button type='button' class='btn btn-warning'>수정</button>" +
//					"<button type='button' class='btn btn-danger'>삭제</button>" +
//				"</td>" +
			"</tr>";
		
		resultHtml += html;
	}
	
	return resultHtml;
	
}

function addClassFilesDiv(){
	var html = 
		"<div class='row form-group'>" +
			"<div class='col-xs-6 input-icon right'>" +
				"<input name='classNames' type='text' placeholder='Input classname...' class='form-control' />" +
			"</div>" +
			"<div class='col-xs-6' style='padding-top: 4px'>" +
				"<input name='classFiles' type='file' placeholder='Inlcude some file' />" +
			"</div>" +
		"</div>";
	
	$(".classFormSector").append(html);
}


function getVSList(){
	
	$.ajax({
		url : "/admin/cropsdoctor/vsListAjax.do",
		type : "post",
		dataType : "json",
		success : function(result){
			console.log("getVSListAjax : " + result.result);
			resultArr = result.result;
			$("#pill-vs").html(printVSList(resultArr));
		},
		error : function(error){
			console.log("getVSListAjax의 에러 : " + error.status);
		}
	});
}

function printVSList(arr){
	
	var resultHtml = 
		"<div class='panel-body'>" + 
			"<div class='panel-group vsListDiv'>";
	
	var tempHtml = "";
	for(var i = 0; i < arr.length; i++){
		console.log("i : " + i);
		console.log("arr[" + i + "].classifierId : " + arr[i].classifierId);
		if(arr[i].classifierId == null){
			continue;
		}
		var html = 
					"<div class='panel panel-default vsTemp'>" + 
						"<div class='panel-heading'>" + 
							"<h4 class='panel-title'>" +
								"<a id='" + arr[i].classifierId +  "' class='collapsed' data-toggle='collapse'" +  
														"data-parent='#accordion' href='#vs" + (i+1) +  "'>" + 
									arr[i].classifierId + "&nbsp;&nbsp;&nbsp;" + 
									arr[i].name + "&nbsp;&nbsp;&nbsp;" +
									(arr[i].status == "ready" ? 
											"<span class='label label-sm label-success'>" 
											: "<span class='label label-sm label-warning'>") +
											arr[i].status + "</span>" + 
								"</a>" + 
							"</h4>" + 
						"</div>" + 
						"<div id='vs" + (i+1) + "' class='panel-collapse collapse'>" + 
							"<div class='panel-body'>" + 
								"<table class='table'>" +
									"<thead>" + 
										"<tr>" + 
											"<th class='text-center'>Class</th>" + 
											"<th class='text-center'></th>" + 
										"</tr>" + 
									"</thead>" + 
									"<tbody id='vsTbody" + (i+1) + "'>" +
									"</tbody>" + 
								"</table>" +
								"<button type='button' class='btn btn-warning'>수정</button>&nbsp;" +
								"<button type='button' class='btn btn-danger'>삭제</button>" + 
							"</div>" + 
						"</div>" +
					"</div>";
	
		tempHtml += html;
	}
	
	resultHtml += tempHtml;
	resultHtml += 
			"</div>" + 
		"</div>" + 
		"<button id='addClassBtn' data-toggle='collapse' data-target='#addClassDiv' class='btn btn-success'>" + 
			"Add Class" + 
		"</button>" + 
		"<div id='addClassDiv' class='panel-body pan collapse'>" + 
			"<form id='insertClassForm' enctype='multipart/form-data' method='post'>" + 
				"<div class='form-body pal classFormSector'>" + 
					"<div class='form-group'>" + 
						"<div class='input-icon right'>" + 
							"<input name='classifierName' type='text' placeholder='Input classifier name' class='form-control' />" + 
						"</div>" + 
					"</div>" + 
					"<hr>" + 
					"<span><h4>Add File</h4></span> <br />" + 
					"<div class='row form-group'>" + 
						"<div class='col-xs-6 input-icon right'>" + 
							"<input name='classNames' type='text' placeholder='Input classname...' class='form-control' />" + 
						"</div>" + 
						"<div class='col-xs-6' style='padding-top: 4px'>" + 
							"<input name='classFiles' type='file' placeholder='Inlcude some file' />" + 
						"</div>" + 
					"</div>" + 
					"<div class='row form-group'>" + 
						"<div class='col-xs-6 input-icon right'>" + 
							"<input name='classNames' type='text' placeholder='Input classname...' class='form-control' />" + 
						"</div>" + 
						"<div class='col-xs-6' style='padding-top: 4px'>" + 
							"<input name='classFiles' type='file' placeholder='Inlcude some file' />" + 
						"</div>" + 
					"</div>" + 
				"</div>" + 
				"<br />" + 
				"<br />" + 
				"<br />" + 
				"<div class='form-actions text-right pal'>" + 
					"<button id='addClassFilesBtn' type='button' class='btn btn-blue'>" + 
						"<i class='fa fa-plus'></i>" + 
					"</button>" + 
					"<button id='classSubmitBtn' type='submit' class='btn btn-info'>Submit</button>" + 
				"</div>" + 
			"</form>" + 
		"</div>";
	
	return resultHtml;
}





















