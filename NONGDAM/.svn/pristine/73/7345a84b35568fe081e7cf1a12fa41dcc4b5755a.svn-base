 /**
 * @type : intro
 * @desc : kias 시스템 전반 공통 자바 스크립트
 *
 */


/**
 * @type   : function
 * @access : public
 * @desc   : 다중파일 업로드를 위한 파일 추가 펑션
                          파일 value를 셀렉트박스에 추가하고, 다음에 입력할 파일태그를 생성한다.

 * @param  : obj - 셀렉트박스에 추가될 파일객체
 * @param  : tagNamePrepix - 파일태그 이름 접두어
 * @author : 류정호
 */
function cfAttachMultiFile(obj,tagNamePrepix){

    var options = document.getElementById("o"+tagNamePrepix+"SelectBox").options;
    var newOption = document.createElement("OPTION");

    var isNew = true;
    for(var i=0; i<options.length; i++){
        if(options[i].text == obj.value){
            isNew = false;
            break;
        }
    }

    if(isNew && obj.value != ""){
        newOption.text = obj.value;
        options.add(newOption);

       var fileString = "<input type=file id="+tagNamePrepix+" name="+tagNamePrepix+" onchange=\"cfAttachMultiFile(this,'"+tagNamePrepix+"');return false;\" size=1 style=width:0;cursor:pointer >";
       document.getElementById(tagNamePrepix+"FileItems").insertAdjacentHTML("afterEnd", fileString);
    }

    //cfAttachMultiFileExtCheck() 함수에서 객체사용을 위해 전역변수로 객체를 담는다.
    //2008.11.25 이경숙 추가
    selectOptionObj = options;

    document.recalc();
}

/**
 * @type   : function
 * @access : public
 * @desc   : cfAttachMultiFile를 이용하여 업로드된 파일중 지정된 확장자 외 등록시 등록취소한다.

 * @param  : Array 객체 - (예)var arrExt = new Array("jpg","jpeg"); cfAttachMultiFileExtCheck(arrExt);
 * @author : 류정호
 */
var selectOptionObj = null;   //객체 공유를 위해 전역변수로 선언
function cfAttachMultiFileExtCheck(arrExt){

    if(selectOptionObj != null){

        var selObj = selectOptionObj;
        var extArr = arrExt;//new Array("ppt","pdf","jpg","jpeg","gif","png");
        var oriFile = "";
        var oriFileExt = "";
        var flag = false;

        for(var idx=0; idx<selObj.length;idx++){

            oriFile = selObj[idx].text;
            oriFileExt = oriFile.substring(oriFile.lastIndexOf(".")+1, oriFile.length);

            if(oriFile != "" && oriFile != null){

                for(var jdx = 0; jdx<extArr.length; jdx++){

                    if(oriFileExt.toUpperCase() == extArr[jdx].toUpperCase()){flag=true;}
                }

                if(!flag){
                    cfAlertMsg(MSG_COM_ERR_038,['파일종류']);
                    return false;
                }

                flag=false;
            }
        }
    }

    return true;
}

/**
 * @type   : function
 * @access : public
 * @desc   : input type file을 이용하여 업로드된 파일중 지정된 확장자 외 등록시 등록취소한다.

 * @param  : Array 객체 - (예)var arrExt = new Array("jpg","jpeg"); cfAttachFileExtCheck(document.form, arrExt);
 * @author : 류정호
 */
function cfAttachFileExtCheck(formObj, arrExt){

    var tagObj = document.getElementsByTagName("input");
    var objType = "";
    var extArr = arrExt;
    var oriFile = "";
    var oriFileExt = "";
    var flag = false;

    if( tagObj != null && tagObj.length> 0) {

        for (var i = 0 ; i < tagObj.length ; i++)
        {
            objType = tagObj[i].type;

            if(objType == "file" ){

                  oriFile = tagObj[i].value;
                  oriFileExt = oriFile.substring(oriFile.lastIndexOf(".")+1, oriFile.length);

                  if(oriFile != "" && oriFile != null){

                      for(var jdx = 0; jdx<extArr.length; jdx++){

                        if(oriFileExt.toUpperCase() == extArr[jdx].toUpperCase()){flag=true;}
                     }

                     if(!flag){
                        cfAlertMsg(MSG_COM_ERR_038,['파일종류']);
                        return false;
                    }

                    flag=false;
                }
            }
        }

        return true;
    }

    return false;

}

/**
 * @type   : function
 * @access : public
 * @desc   : input type file을 이용하여 업로드된 파일중 지정된 확장자 외 등록시 등록취소한다.

 * @param  : Array 객체 - (예)var arrExt = new Array("jpg","jpeg"); cfAttachFileExtCheck(document.form, arrExt);
 * @author : 류정호
 */
function cfAttachFileExtCheckEleNm(formObj, arrExt,eleNm){
   // var nameObj = document.getElementById(eleNm);
    var tagObj = document.getElementsByTagName("input");
    var objType = "";
    var extArr = arrExt;
    var oriFile = "";
    var oriFileExt = "";
    var flag = false;
    if( tagObj != null && tagObj.length> 0) {
      
      
        for (var i = 0 ; i < tagObj.length ; i++)
        {
           
            objType = tagObj[i].type;
            if(objType == "file" ){
               
               if(tagObj[i].id == eleNm){
                  
                     oriFile = tagObj[i].value;
                     oriFileExt = oriFile.substring(oriFile.lastIndexOf(".")+1, oriFile.length);
   
                     if(oriFile != "" && oriFile != null){
   
                         for(var jdx = 0; jdx<extArr.length; jdx++){
   
                           if(oriFileExt.toUpperCase() == extArr[jdx].toUpperCase()){flag=true;}
                        }
   
                        if(!flag){
                           cfAlertMsg(MSG_COM_ERR_038,['파일종류']);
                           return false;
                       }
   
                       flag=false;
                   }
               }
           }
        }

        return true;
    }else{
       
    }

    return false;

}

/**
 * @type   : function
 * @access : public
 * @desc   : 다중파일 업로드를 위한 파일 삭제 펑션
                         셀렉트박스에서 파일을 삭제하고, 파일태그도 같이 삭제한다.

 * @param  : tagNamePrepix - 파일태그 이름 접두어
 * @author : 류정호
 */
function cfDeleteMultiFile(tagNamePrepix){
   var fileTags = document.getElementsByName(tagNamePrepix);

    var options = document.getElementById("o"+tagNamePrepix+"SelectBox").options;
    var fileId;

    if(options.selectedIndex != -1){
        for(var i=0; i<fileTags.length; i++){
            if(fileTags[i].value == options[options.selectedIndex].text){
               fileTags[i].removeNode();
                break;
            }
        }
        options.remove(options.selectedIndex);
    }
    document.recalc();
}

var incRowSeq = 1;
//배포내역추가 DHTML
function cfAddRow(tableId){

   var tableObj = document.getElementById(tableId);
   var cells = tableObj.cells;
   var rows = tableObj.rows;
   var makeCellCount = cells.length/rows.length;

   var cellTemplates = new Array(makeCellCount);
   var cellClassNms  = new Array(makeCellCount);
   var tagName = null;

   for(var i=makeCellCount, j=0; i<makeCellCount*2; i++,j++){
      cellTemplates[j] = cells[i].innerHTML;
      cellClassNms[j] = cells[i].className
   }

   var newRow = tableObj.insertRow(rows.length);
   for(var i=0; i<cellTemplates.length; i++){
      var newCell = null;
      newCell = newRow.insertCell();
      // 2008.11.29수정(수정자:박철민)
      //newCell.className = "tdData";
      newCell.className = cellClassNms[i];
      newCell.innerHTML = cellTemplates[i];
      if(newCell.all.length == 1){
         tagName = cells[makeCellCount+i].all[0].name;
         switch(newCell.all[0].tagName){
         case "INPUT":
            switch(newCell.all[0].type){
            case "checkbox":
            case "radio":
               newCell.all[0].checked = false;
               break;
            default:
               newCell.all[0].value = "";
               break;
            }
            break;
         default:
            newCell.all[0].value = "";
            break;
         }

      }else if(newCell.all.length == 3){
         try{
            tagName = cells[makeCellCount+i].all[0].name;
            newCell.all[0].id = tagName + (incRowSeq);
            newCell.all[0].value = "";
            newCell.all[2].id = cells[makeCellCount+i].all[2].id + (incRowSeq);
            newCell.all[1].onclick = function (){cfOpenCalendar(newCell.all[2], event, newCell.all[0].id);return false;};
         }catch(e){
            ;
         }
      }else if(newCell.all.length == 2){
         var hiddenId = newCell.all[0].id + (incRowSeq);
         newCell.all[0].id = hiddenId;
         newCell.all[0].value = "";
         newCell.all[1].onchange = function (){document.getElementById(hiddenId).value = this.value;};
      }else if(newCell.all.length == 7){

         var fileHTML = new Array(2);
         for(var j=0, k=0; j<newCell.all.length; j++){
            if(j>4){
               fileHTML[k++] = newCell.all[j].outerHTML;
            }
         }
         newCell.innerText = "";
         newCell.innerHTML = fileHTML[0]+fileHTML[1];
         var hiddenId = newCell.all[0].id + (incRowSeq)
         newCell.all[0].id = hiddenId;
         newCell.all[0].value = "";
         newCell.all[1].onchange = function (){document.getElementById(hiddenId).value = this.value;};
      }else if(newCell.all.length == 6){
         try{
            tagName = cells[makeCellCount+i].all[0].name;
            newCell.all[0].id = tagName + (incRowSeq);
            newCell.all[0].value = "";
            newCell.all[2].id = cells[makeCellCount+i].all[2].id + (incRowSeq);
            newCell.all[1].onclick = function (){cfOpenCalendar(newCell.all[2], event, newCell.all[0].id);return false;};


            newCell.all[3].id = tagName + (++incRowSeq);
            newCell.all[3].value = "";
            newCell.all[5].id = cells[makeCellCount+i].all[5].id + (incRowSeq);
            newCell.all[4].onclick = function (){cfOpenCalendar(newCell.all[5], event, newCell.all[3].id);return false;};
         }catch(e){
            ;
         }
      }else{
         break;
      }
   }
   incRowSeq++;
}

//배포내역삭제 DHTML
function cfDelRow(tableId){
   var tableObj = document.getElementById(tableId);
   var cells = tableObj.cells;
   var rows = tableObj.rows;
   var checkLastDelete = false;
   if(rows.length >2){
      for(var i=rows.length-1; i>=0; i--){
         if(rows.length == 2){
            checkLastDelete = true;
            break;
         }else{
            try{
               for(var j=0; j<rows[i].all.length; j++){
                  if(rows[i].all[j].type == "checkbox" && rows[i].all[j].checked){
                     tableObj.deleteRow(i);
                  }
               }
            }catch(e){
               continue;
            }
         }
      }
   }else if(rows.length == 2){
      checkLastDelete = true;
   }

   if(checkLastDelete){
      var rowAll = rows[1].all;
      var confirmDelete = false;
      for(var i=0; i<rowAll.length; i++){
         if(rowAll[i].type == "checkbox" && rowAll[i].checked){
            confirmDelete = true;
            break;
         }
      }

      for(var i=0; i<rowAll.length; i++){
         if(confirmDelete){
            switch(rowAll[i].tagName){
            case "INPUT":
               switch(rowAll[i].type){
               case "checkbox":
               case "radio":
                  rowAll[i].checked = false;
                  break;
               case "file":
                  var parentNode = rowAll[i].parentNode;
                  var cloneHTML = parentNode.innerHTML;
                  parentNode.innerHTML = cloneHTML;
                  break;
               default:
                  rowAll[i].value = "";
                  break;
               }
               break;
            case "A":
               var bros = rowAll[i].parentNode.all;
               if(bros[0] == rowAll[i]){
                  rowAll[i].innerText = "";
                  rowAll[i].removeNode();
                  i--;
               }
               break;
            case "IMG":
            case "BR":
               if(bros[0] == rowAll[i]){
                  rowAll[i].removeNode();
                  i--;
               }
               break;
            default:
               rowAll[i].value = "";
               break;
            }
         }
      }
   }
}


function cfCheckDeleteFile(linkObj, deleteFileName){
   if(cfConfirmMsg(MSG_COM_CRM_004)){
      var bros = new Array(linkObj.parentNode.children.length);
      var index = 0;
      for(var i=0; i<bros.length; i++){
         bros[i] = linkObj.parentNode.children[i];
         if(bros[i] == linkObj){
            index = i;
            console.log(index);
         }
      }
      for(var i=0; i<bros.length; i++){
         if(bros[i].tagName == "INPUT" && bros[i].type == "hidden"){
            bros[i].value = deleteFileName!=null?deleteFileName:"";
         }else if(bros[i].tagName == "INPUT" && bros[i].type == "file"){
            
         }else{
            try{
               bros[i].innerText = "";
               //bros[i].removeNode();
               $(bros[i]).remove();
            }catch(e){
               //bros[i].removeNode();
               $(bros[i]).remove();
            }
         }
      }
   }
}

function cfCheckDeleteFileEn(linkObj, deleteFileName){
   if(cfConfirmMsg(MSG_COM_CRM_004_EN)){
      var bros = new Array(linkObj.parentNode.children.length);
      var index = 0;
      for(var i=0; i<bros.length; i++){
         bros[i] = linkObj.parentNode.children[i];
         if(bros[i] == linkObj){
            index = i;
         }
      }
      for(var i=0; i<bros.length; i++){
         if(bros[i].tagName == "INPUT" && bros[i].type == "hidden"){
            bros[i].value = deleteFileName!=null?deleteFileName:"";
         }else{
            try{
               bros[i].innerText = "";
               //bros[i].removeNode();
               $(bros[i]).remove();
            }catch(e){
               //bros[i].removeNode();
               $(bros[i]).remove();
            }
         }
      }
   }
}

//레이어를 만든다.
function cfMakeLayer(x1, y1, x2, y2, alreadyLayer){
   newArea = document.createElement("area");

   newArea.id = "newArea";
   newArea.coords = x1 + "," + y1 + "," + x2 + "," + y2;
   newArea.shape = "rect";
   newArea.href = "javascript:";

   var map = document.getElementById("map");
   map.areas.add(newArea);

   var newDiv = document.createElement("div");
   newDiv.id = "rect1";
   newDiv.style.left = newArea.offsetTop;
   newDiv.style.top = newArea.offsetLeft;

   var newDivLeft = Number((x1>x2?x2:x1));
   var newDivTop = Number((y1>y2?y2:y1));
   var newDivWidth = Math.abs(x2-x1);
   var newDivHeight =Math.abs(y2-y1);

   var newDivRight = newDivLeft + newDivWidth;
   var newDivBottom = newDivTop + newDivHeight;

   newDiv.style.left = newDivLeft+"";
   newDiv.style.top = newDivTop+"";
   newDiv.style.width = newDivWidth+"";
   newDiv.style.height = newDivHeight+"";

   return newDiv;
}

//IFrame의 스크롤을 없앤다.
function cfResizeIFrame(name){
        var Frame_Body  = document.frames(name).document.body;
        var Frame_name  = document.all(name);

/*        Frame_name.style.width
                = Frame_Body.scrollWidth + (Frame_Body.offsetWidth-Frame_Body.clientWidth);
*/
        Frame_name.style.height
                = Frame_Body.scrollHeight + (Frame_Body.offsetHeight-Frame_Body.clientHeight);
}

//공통 이미지  오픈팝업
function cfImageOpen(imageId){
   cfOpen(120,150, 1, "/kias/ImageOpen.ks?id="+imageId, "imagePopup", "scrollbars=yes");
}

var isLock = false;
function cfSetX(n){
   if(isLock){
      var authObj = document.getElementById("x1");
      if(authObj){
         var qryString = "xN="+n;
         var xmlHttp = cfGetXmlHttpRequest();
         var url = "/kias/XAuthR.ks";
          xmlHttp.open("POST", url, true);
          xmlHttp.onreadystatechange = cfHandleRequest(xmlHttp,cfViewX);
          xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
          xmlHttp.send(qryString);
       }
    }
}

function cfViewX(xmlDoc){
    var singleTag = xmlDoc.getElementsByTagName("SINGLE");
    var single = singleTag[0];

      try{
       var xAuth = single.getElementsByTagName("xAuth")[0].firstChild.nodeValue;
       var xLink = document.getElementById("x1");
       var epiLink = document.getElementById("x2");
       switch(xAuth){
       case "x":
          xLink.onclick = function(){
             location.href = "/kias/XFilePageR.ks";
          };
          epiLink.onclick = function(){};
          break;
       case "epi":
          xLink.onclick = function(){};
          epiLink.onclick = function(){
             location.href = "/kias/EPIStoryPageR.ks";
          };
          break;
       default:
          xLink.onclick = function(){};
          epiLink.onclick = function(){};
          break;
       }
      }catch(e){
      }
}

/**
 * @type   : function
 * @access : public
 * @desc   : 중복전송 처리를 방지한다.
 * @param  : formObject - submit하고자 하는 formObject
 * @return : void
 * @author : 권영주
 */
var isSubmit = false;
function cfFormSubmit(formObject){
   if(!isSubmit){
      isSubmit = true;
      formObject.submit();
   }
}



/**
 * @type   : function
 * @access : public
 * @desc   : 퍼센트 값을 체크한다. (예찰)
 * @param  : formObject - submit하고자 하는 formObject
 * @return : void
 * @author : 길현배
 */
function cfPercentCheck(obj) {
   if (obj.length > 0) {
      for (var i=0; i<obj.length; i++) {
         var val = obj[i].value;
           if (val.indexOf(".") > 0 && val.substring(0, val.indexOf(".")) > 99) {
              cfAlertMsg(MSG_COM_WRN_018);
            obj[i].focus();
            return false;
         }
      }
   }
   if (obj.length == undefined) {
      var val = obj.value;
        if (val.indexOf(".") > 0 && val.substring(0, val.indexOf(".")) > 99) {
           cfAlertMsg(MSG_COM_WRN_018);
            obj.focus();
            return false;
        }
   }
   return true;
}

// 입력값이 100 이상인지 판단
function cfNumOver(obj, limit){
   if ( limit == "" ) {
        cfAlertMsg("기준값이 입력되지 않았습니다.");
        obj.value = "";
        obj.focus();
   } else {
      
        if ( parseFloat(cfNvl(cfGetNumberDotOnly(obj.value), 0)) > limit ) {
           cfAlertMsg(MSG_COM_WRN_020, [limit]);
           obj.value = "";
           obj.focus();
        }
   }

}


/**
 * @type   : function
 * @access : public
 * @desc   : NVL 기능
 * @param  : obj - 체크하고자 하는 object, val - 리턴하고자 하는 대체값.
 * @return : void
 * @author : 길현배
 */
function cfNvl(val, ret) {
   var result;
   if (val == "") {
      result = ret;
   } else {
      result = val;
   }
   return result;
}

/**
 * @type   : function
 * @access : public
 * @desc   : object 를 입력받아 합계를 구한다.
 * @param  : form, 계산할 폼 명, cObj - 계산하고자 하는 object, tObj - 계산값을 넣어줄 span object
 * @return : void
 * @author : 길현배
 */
function cfCalcSum(frm, cObjNm, tObjNm) {
    var result = "";
    var calObj = eval("document."+frm+"."+cObjNm);
    var tgtObj = document.getElementById(tObjNm);

    var tot = 0;
    var cnt = 0;
    for (var i=0; i<calObj.length; i++) {
        if (!cfIsNull(calObj[i].value)){
            tot += parseInt(calObj[i].value);
            cnt++;
        }
    }
    if (cnt > 0) {
       result = tot;
        if (tgtObj != null)
           tgtObj.innerHTML = tot; //소숫점 2자리이하 반올림.
    } else {
       result = "";
       if (tgtObj != null)
          tgtObj.innerHTML = "";
    }
    return result;

}

/**
 * @type   : function
 * @access : public
 * @desc   : object 를 입력받아 평균을 구한다.
 * @param  : form, 계산할 폼 명, cObj - 계산하고자 하는 object, tObj - 계산값을 넣어줄 span object
 * @return : void
 * @author : 길현배
 */
function cfCalcAvg(frm, cObjNm, tObjNm) {
    var result = "";
    var calObj = eval("document."+frm+"."+cObjNm);
    var tgtObj = document.getElementById(tObjNm);

    var tot = 0;
    var cnt = 0;
    for (var i=0; i<calObj.length; i++) {
        if (!cfIsNull(calObj[i].value)){
            tot += parseFloat(calObj[i].value);
            cnt++;
        }
    }
    var avg = tot/cnt;
    if (cnt > 0) {
        result = cfRound(avg,1);
        if (tgtObj != null)
           tgtObj.innerHTML = result; //소숫점 2자리이하 반올림.
    } else {
       result = "";
       if (tgtObj != null)
          tgtObj.innerHTML = "";
    }
    return result;

}


/**
 * @type   : function
 * @access : public
 * @desc   : 값 Array를 입력받아 합계를 구한다.
 * @param  : form, 계산할 폼 명, cObj - 계산하고자 하는 object, tObj - 계산값을 넣어줄 span object
 * @return : void
 * @author : 길현배
 */
function cfArrCalcSum(arrVal) {
    var result = "";

    var tot = 0;
    var cnt = 0;
    for (var i=0; i<arrVal.length; i++) {
        if (!cfIsNull(arrVal[i])){
            tot += parseInt(arrVal[i]);
            cnt++;
        }
    }
    if (cnt > 0) {
        result = tot; //소숫점 2자리이하 반올림.
    } else {
       result = "";
    }
    return result;

}

/**
 * @type   : function
 * @access : public
 * @desc   : 값 Array를 입력받아 평균을 구한다.
 * @param  : form, 계산할 폼 명, cObj - 계산하고자 하는 object, tObj - 계산값을 넣어줄 span object
 * @return : void
 * @author : 길현배
 */
function cfArrCalcAvg(arrVal) {
    var result = "";

    var tot = 0;
    var cnt = 0;
    for (var i=0; i<arrVal.length; i++) {
        if (!cfIsNull(arrVal[i])){
            tot += parseFloat(arrVal[i]);
            cnt++;
        }
    }

    var avg = tot/cnt;
    if (cnt > 0) {
        result = cfRound(avg,1);
    } else {
       result = "";
    }
    return result;

}

/**
* 표준편차계산
* @type   : function
* @access : public
* @desc   :
* @author : 길현배
*/
function cfCalcStdev(arrVal, round) {

   var total    = 0;
   var sqrTotal = 0;
   var n        = 0;

    for (var i=0; i<arrVal.length; i++) {

       if(i==0) min = arrVal[i];

       newNumber = parseInt(arrVal[i]);
       total    += newNumber;
       sqrTotal  = sqrTotal + ( newNumber * newNumber );
       n++;
    }

    variance = ( sqrTotal - ((total * total)/n) ) / n
    return cfRound(Math.sqrt(variance), round);

}


/**
* 입력된 숫자를 지정한 digits 이하 자리에서 반올림.
* @type   : function
* @access : public
* @desc   :
* @author : 길현배
*/
function cfRound(n, digits) {
  if (digits >= 0) return parseFloat(n.toFixed(digits)); // 소수부 반올림

  digits = Math.pow(10, digits); // 정수부 반올림
  var t = Math.round(n * digits) / digits;

  return parseFloat(t.toFixed(0));
}

/**
 * 입력된 숫자를 Date String로 변경.
 * @param str
 * @return
 */
function cfConvDate(str, deli) {
    if ( str.length == 8 ) {
       str = str.substr(0,4) + deli + str.substr(4,2) + deli + str.substr(6);
     }
    return str;
}


/**
* 예찰 사진파일 등록
* @type   : function
* @access : public
* @desc   :
* @author : 길현배
*/
function cfPhotoInsert() {
   var form = document.inputForm;

   var inp = document.getElementById("photoInputTable");

   var inputTags = document.getElementsByTagName("INPUT");
   
   var isAllEmpty = true;
   
   var nameExp = /.+xaminValue/;
   for(var i=0; i<inputTags.length; i++){
      
      
      if(   inputTags[i].type == "text" &&
         nameExp.test(inputTags[i].name)  && 
         inputTags[i].value != ""){
         
         isAllEmpty = false;
         break;
      }
      
      if(   inputTags[i].type == "text" &&
         inputTags[i].name=="pltnTrcn"  && 
         inputTags[i].value != ""){
         
         isAllEmpty = false;
         break;
      }
      if(   inputTags[i].type == "text" &&
         inputTags[i].name=="oEtcKncrLavlCo"  && 
         inputTags[i].value != ""){
         
         isAllEmpty = false;
         break;
      }
   }
   
   
   if(isAllEmpty){
      alert("조사내용을 입력하십시오.");
      return;
   }
      
   
   if(cfValidate(inp)) {

       if( !cfConfirmMsg(MSG_COM_CRM_001) ) {
           return;
       }
       
       
       var currUrl = $(form).find('[name=returnActionUrl]').clone();
       currUrl.attr('name','currentMenuUrl'); 
       //form.append(currUrl.attr('name','currentMenuUrl'));
       form.method = "post";
       form.encoding="multipart/form-data";
       form.action = "/npms/ImageFileU.np";
       form.submit();
   }
}

/**
* 예찰 사진파일 삭제
* @type   : function
* @access : public
* @desc   :
* @author : 길현배
*/
function cfPhotoDelete(no, path, fileNm) {
   var form = document.inputForm;

   form.photoIstguNo.value = no;
   form.atchFileCours.value = path;
   form.atchFileNm.value = fileNm;

   if( !cfConfirmMsg(MSG_COM_CRM_004) ) {  //삭제하시겠습니까?
       return;
   }


   form.method = "post";
   //form.encoding="application/x-www-form-urlencoded";
   form.encoding="multipart/form-data";
   form.action = "/npms/ImageFileD.np";
   form.submit();
}

/**
* 액션으로 이동
* @type   : function
* @access : public
* @desc   :
* @author : 이원규
*/
function cfMoveAction(action){
   location.href =  action;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 숫자와 소수점 표시(.)를 제외한 모든 문자를 제거한다.
 * <pre>
 *     cfGetNumberDotOnly("123,12.25");"
 *     위와같이 사용했을 경우 '12312.25'를 return
 * </pre>
 * @sig    : sOrg
 * @param  : sOrg - required 문자열
 * @return : 치환된 문자열 스트링
 * @author : 성시억
 */
function cfGetNumberDotOnly(sOrg) {
   return sOrg.replace(/[.][^0-9]/g, "");
}


/**
 * 야장 등록시 이상값 체크
 * 
 * @param p_code(조회분류 테이블에 정의된 조회코드 값 : ex> SG0001 )
 * @param p_val (각 야장의 입력값 : ex> 병든잎률, 병무늬면적률 - 정수, 또는 실수)
 * @param p_msg (체크할 항목명 : 현재 야장과 조회분류가 다소 차이가 있어 셋팅하여 넘겨받아 처리.)
 * @return
 */
function cfAbvCheck(p_code, p_val, p_msg) {
    var codeObj = document.all.inqireCnClCode;
    var abvObj  = document.all.abvValue;
    
    if (codeObj != undefined && abvObj != undefined) {

       for (var i=0; i< codeObj.length; i++) {
           var abv_value = abvObj[i].value;
          
           //이상값 비교
           if (codeObj[i].value == p_code && abv_value != "") {
              //입력된 값이 이상값 이상으로 입력되었을때
              //alert("abv_value : " + parseFloat(abv_value));
              //alert("p_val : " + parseFloat(p_val))
              //alert("p_val : ");
               if (parseFloat(p_val) >= parseFloat(abv_value)) {
                   cfAlertMsg(MSG_COM_CRM_017, [p_msg, p_val, abv_value]); //@ 을(를) @ 이상 입력 입력하셨습니다.
               }
               break;
           }
       }
    }
    
    return true;
}

/**
 * 야장 등록시 경고값, 이상값 체크
 * 
 * @param p_code(조회분류 테이블에 정의된 조회코드 값 : ex> SG0001 )
 * @param p_val (각 야장의 입력값 : ex> 병든잎률, 병무늬면적률 - 정수, 또는 실수)
 * @param p_msg (체크할 항목명 : 현재 야장과 조회분류가 다소 차이가 있어 셋팅하여 넘겨받아 처리.)
 * @return
 */
function cfAbvnWarnCheck(p_code, p_val, p_msg) {
    var codeObj = document.all.inqireCnClCode;
    var abvObj  = document.all.abvValue;
    var warnObj  = document.all.warnValue;
    
    if (codeObj != undefined && abvObj != undefined) {

       for (var i=0; i< codeObj.length; i++) {
           var warn_value = warnObj[i].value;
           var abv_value = abvObj[i].value;
           
           // 이상값 비교
           if (codeObj[i].value == p_code && abv_value != "") {
              
              if (parseFloat(p_val) >= parseFloat(abv_value)) {
                 cfAlertMsg(MSG_COM_CRM_022, [p_msg, p_val, abv_value]); //@ 을(를) @ 이상 입력 입력하셨습니다.
                 return false;
               }
           }
          
           //경고값 비교
           if (codeObj[i].value == p_code && warn_value != "") {
              //입력된 값이 이상값 이상으로 입력되었을때
              //alert("abv_value : " + parseFloat(abv_value));
              //alert("p_val : " + parseFloat(p_val))
              //alert("p_val : ");
               if (parseFloat(p_val) >= parseFloat(warn_value)) {
                   cfAlertMsg(MSG_COM_CRM_021, [p_msg, p_val, warn_value]); //@ 을(를) @ 이상 입력 입력하셨습니다.
               }
               break;
           }
       }
    }
    
    return true;
}


//패스워드 입력 불가 문자 패스
function cfNotPassword(e) {
    if(window.event){   //IE
        e = window.event
        var lkeycode = e.keyCode;
    } else if( e ) {
      var lkeycode = e.which;
   } else{               //W3C
        var lkeycode = e.charCode;
    }


    if(   lkeycode == 92            // \
       || lkeycode == 124           // |
       || lkeycode == 91            // [
       || lkeycode == 93          // ]           
       || lkeycode == 32) {         // space           
       
        if( window.event ){
            e.keyCode = 0;
        }else{           
            e.preventDefault();
        }
    }
}

/**
 * 조사일자 체크
 * 기준년도와 앞뒤 1년이 아닌경우(Ex: 기준년도 = 2013 체크년도 2012, 2013, 2014)
 * @param bas_year (기준년도)
 * @param chk_year (체크해야하는 일자)
 * @return
 */
function cfChkExaminDate(bas_year, chk_year) {
   var thisYear = chk_year.value;
   thisYear = thisYear.substring(0, 4);

   if(parseInt(thisYear) != parseInt(bas_year) && parseInt(thisYear) != parseInt(bas_year) -1 && parseInt(thisYear) != parseInt(bas_year)+1 ){
      alert("조사일자의 년도는 " + bas_year + "년과 1년전후로만 입력이 가능합니다.");
      chk_year.focus();
      return;
   }
   return true;
}

//쿠키생성
function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

//쿠키 가져오기
function getCookie(cName) {
   cName = cName + '=';
   var cookieData = document.cookie;
   var start = cookieData.indexOf(cName);
   var cValue = '';
   if(start != -1){
       start += cName.length;
       var end = cookieData.indexOf(';', start);
       if(end == -1)end = cookieData.length;
       cValue = cookieData.substring(start, end);
   }
   return unescape(cValue);
}