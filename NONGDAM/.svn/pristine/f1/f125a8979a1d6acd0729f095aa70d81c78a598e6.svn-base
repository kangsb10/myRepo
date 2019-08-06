// 수정중
function insertEntitiesTable(entity, cnt){
	var html = 
		"<div class='panel panel-default'>" + 
			"<div class='panel-heading'>" + 
				"<h4 class='panel-title'>" + 
					"<a data-toggle='collapse' data-parent='#accordion' href='#entity" + cnt +  "'>" + entity + "</a>" + 
				"</h4>" + 
			"</div>" + 
			"<div id='entity" + cnt + "' class='panel-collapse collapse'>" + 
				"<div class='panel-body'>${entity }에 대한 내용을 입력합니다.</div>" + 
			"</div>" + 
		"</div>";
	
	return html;
}

//function getEntityList(){
//	
//	$.ajax({
//		url : "/admin/cropsdoctor/entitiesListAjax.do",
//		type : "post",
//		success : function(result){
//			var entitiesArr = result.result;
//			var resultHtml = "";
//			for(var i = 1; i <= entitiesArr.length; i++){
//				var entityNM = entitiesArr[i];
//				resultHtml += entityNode(entityNM, i);
//			}
//			$(".entityList").html(resultHtml);
//		},
//		error : function(error){
//			console.log("getEntityList error : " + error.status);
//		}
//	})
//	
//}

function addEntity(entityNM){
	
	var resultHtml = entityNode(entityNM, 8);
	
	$(".entityList").append(resultHtml);
}

//entity값으로 해당 value가져오기
function getValuesArr(entity){
	
	var resultArr = null;
	$.ajax({
		url : "/admin/cropsdoctor/getValuesArr.do",
		data : {
			entityNM : entity
		},
		type : "post",
		success : function(result){
			resultArr = result.result;
			console.log("resultArr : " + resultArr);
			return resultArr;
		},
		error : function(error){
			console.log("getValuesArr() error!! // " + error.status);
		}
	});
	
}

// values 리스트 출력
function printValues(arr){

	var resultHtml =  "";
	for(var i = 0; i < arr.length; i++){
		var html = 
			"<tr>" +
				"<td>" +
					"<label class='checkbox' for='checkbox1'>" +
		 	          	"<input type='checkbox' value='' id='chkbox' data-toggle='checkbox'>" + 
					"</label>" + 
				"</td>" +
				"<td>" + arr[i] + "</td>" +
			"</tr>";
		
		resultHtml += html;
	}
	
	return resultHtml;
	
}

function entityNode(entityNM, num){
	
	var html = 
		"<div class='panel panel-default entityTemp'>" +
			"<div class='panel-heading'>" +
				"<h4 class='panel-title'>" +
					"<a class='collapsed' data-toggle='collapse'" +
						"data-parent='#accordion' href='#entity" + num + "'>" + entityNM + "</a>" +
				"</h4>" +
			"</div>" +
			"<div id='entity" + num + "'" +
				"class='panel-collapse collapse'>" +
				"<div class='panel-body'>" +
					"<table class='table'>" +
						"<thead>" +
							"<tr>" +
								"<th>chk</th>" +
								"<th class='text-center'>Values</th>" +
							"</tr>" +
						"</thead>" +
						"<tbody id='valuesTbody" + num + "'>" +
						"</tbody>" +
					"</table>" +
					"<button type='button' class='btn btn-warning'>수정</button>" +
					"<button value='" + entityNM + "' type='button' class='btn btn-danger entityDeleteBtn'>삭제</button>" +
				"</div>" +
			"</div>" + 
		"</div>";
	
	
	return html;
	
}

