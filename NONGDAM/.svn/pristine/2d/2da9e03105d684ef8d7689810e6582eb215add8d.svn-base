var KMA_FORECAST_URL = 'http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/';

//LCC DFS 좌표변환을 위한 기초 자료 
var RE = 6371.00877; // 지구 반경(km)
var GRID = 5.0; // 격자 간격(km)
var SLAT1 = 30.0; // 투영 위도1(degree)
var SLAT2 = 60.0; // 투영 위도2(degree)
var OLON = 126.0; // 기준점 경도(degree)
var OLAT = 38.0; // 기준점 위도(degree)
var XO = 43; // 기준점 X좌표(GRID)
var YO = 136; // 기1준점 Y좌표(GRID)
//
// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
//
function dfs_xy_conv(code, v1, v2) {
   var DEGRAD = Math.PI / 180.0;
   var RADDEG = 180.0 / Math.PI;
   
   var re = RE / GRID;
   var slat1 = SLAT1 * DEGRAD;
   var slat2 = SLAT2 * DEGRAD;
   var olon = OLON * DEGRAD;
   var olat = OLAT * DEGRAD;
   
   var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
   sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
   var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
   sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
   var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
   ro = re * sf / Math.pow(ro, sn);
   var rs = {};
   if (code == "toXY") {
      rs['lat'] = v1;
      rs['lng'] = v2;
      var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
      ra = re * sf / Math.pow(ra, sn);
      var theta = v2 * DEGRAD - olon;
      if (theta > Math.PI) theta -= 2.0 * Math.PI;
      if (theta < -Math.PI) theta += 2.0 * Math.PI;
      theta *= sn;
      rs['nx'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
      rs['ny'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
   } else {
      rs['nx'] = v1;
      rs['ny'] = v2;
      var xn = v1 - XO;
      var yn = ro - v2 + YO;
      ra = Math.sqrt(xn * xn + yn * yn);
      if (sn < 0.0) - ra;
      var alat = Math.pow((re * sf / ra), (1.0 / sn));
      alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
      
      if (Math.abs(xn) <= 0.0) {
         theta = 0.0;
      } else {
         if (Math.abs(yn) <= 0.0) {
            theta = Math.PI * 0.5;
            if (xn < 0.0) - theta;
         } else theta = Math.atan2(xn, yn);
      }
      var alon = theta / sn + olon;
      rs['lat'] = alat * RADDEG;
      rs['lng'] = alon * RADDEG;
   }
   return rs;
}
// dfs_xy_conv


/**
 * 초 단기실황 Bean
 * 
 * 항목값   항목명         단위      결측값
 * T1H   기온         ℃      -50 ℃
 * RN1   1시간 강수량      mm      -1 mm 
 * SKY   하늘상태      코드값      -1
 * UUU   동서바람성분      m/s      -100 m/s
 * VVV   남북바람성분      m/s      -100 m/s
 * REH   습도         %      -1 %
 * PTY   강수형태      코드값      -1
 * LGT   낙뢰         코드값      -1
 * VEC   풍향         0      -1
 * WSD   풍속         1      -1
 * 
 * 하늘상태(SKY) 코드 : 맑음(1), 구름조금(2), 구름많음(3), 흐림(4)
 * 강수형태(PTY) 코드 : 없음(0), 비(1), 비/눈(2), 눈(3) 여기서 비/눈은 비와 눈이 섞여 오는 것을 의미 (진눈개비)
 * 낙뢰(초단기실황) : 없음(0), 있음(1)
 */
function ForecastGribBean(T1H, RN1, SKY, UUU, VVV, REH, PTY, LGT, VEC, WSD) {
   this.T1H = T1H;
   this.RN1 = RN1;
   this.SKY = SKY;
   this.UUU = UUU;
   this.VVV = VVV;
   this.REH = REH;
   this.PTY = PTY;
   this.LGT = LGT;
   this.VEC = VEC;
   this.WSD = WSD;
   this.WEATHER_STATUS = '';
   this.WEATHER_ICON = '';
}

/**
 * 초 단기예보 조회
 * @param apikey
 * @param year
 * @param month
 * @param day
 * @param hours
 * @param minutes
 * @param _nx
 * @param _ny
 * @returns
 */
function downForecastGrib ( apikey, year, month, day, hours, minutes, _nx, _ny ) {
   /*
    * 기상청 40분마다 발표
    * 40분보다 작으면, 한시간 전 hours 값
    */
   if(minutes < 41){
      hours = hours - 1;
      if(hours < 0){
         // 자정 이전은 전날로 계산
         today.setDate(today.getDate() - 1);
         day = today.getDate();
         month = today.getMonth()+1;
         year = today.getFullYear();
         hours = 23;
      }
   }
   
   /* example
    * 9시 -> 09시 변경 필요
    */
   
   if(hours < 10) {
      hours = '0'+hours;
   }
   if(month < 10) {
      month = '0' + month;
   }    
   if(day < 10) {
      day = '0' + day;
   } 
   
   today = year+""+month+""+day;
   
   //ForecastGribURL = KMA_FORECAST_URL + "ForecastGrib";
   
   //console.log(ForecastGribURL);
   /* 
   var url = '/npmsAPI/SmartForeSvc10.mo';
   var param = '';
   param += 'reqUrl=http://apis.vworld.kr/coord2jibun.do';
   param += "&x="+x+"&y="+y+"&apiKey=5D311F92-D980-3E25-976C-34C324C59747&domain=ncpms.rda.go.kr&output=json&epsg=EPSG:4326";
   $.ajax({
      url: url
      ,data : param
      ,type: 'POST'
      ,success: function(msg) {
         alert("msg : " + msg);
      }
   });
    */
//   var ForecastGribURL = "/npms/WeatherForecastAjax.np";
   var ForecastGribURL = "/user/main/main_mod.do";
//   var ForecastGribURL = "/user/npms/WeatherForecastAjax.do";
//   var ForecastGribURL = "192.168.201.30";
   var ForecastGribParam = '';
   ForecastGribParam += "reqUrl=" + KMA_FORECAST_URL + "ForecastGrib";
   ForecastGribParam += "&ServiceKey=" + apikey;
   ForecastGribParam += "&base_date=" + today;
   ForecastGribParam += "&base_time=" + hours +"00";
   ForecastGribParam += "&nx=" + _nx + "&ny=" + _ny;
   ForecastGribParam += "&pageNo=1&numOfRows=10";
   ForecastGribParam += "&_type=json";
   
   // http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?ServiceKey=서비스키&base_date=20151201&base_time=0600&nx=55&ny=127&pageNo=1&numOfRows=1&_type=json
   var weatherSucFlag = "";
   
   $.ajax({
      url: ForecastGribURL
      ,data : ForecastGribParam
      ,type: 'post'
      ,dataType: 'json'
      ,success: function(msg) {
         weatherSucFlag = "Y";
//         console.log("msg : " + msg);
         
         //console.log(msg.response.body.items.item);
         
         //var text = msg.responseText;
         //console.log("text : "+text);
         //text = text.replace(/(<([^>]+)>)/ig,""); //HTML 태그 모두 공백으로 대체
         //text = '[' + text + ']';
         //var json = $.parseJSON(msg);
         //console.log(json);
         var T1H = '';
         var RN1 = '';
         var SKY = '';
         var UUU = '';
         var VVV = '';
         var REH = '';
         var PTY = '';
         var LGT = '';
         var VEC = '';
         var WSD = '';
         var WEATHER_STATUS = '';
         var WEATHER_ICON = '00';
         
         try {
            //var items = json[0].response.body.items.item;
            var items = msg.response.body.items.item;
            for( var i = 0; i < items.length; i++ ) {
               var category = items[ i ].category;
               var obsrValue = items[ i ].obsrValue;
               //console.log(category +' : '+ obsrValue);
               
               // 기상청 동네예보정보조회 예보구분: 초단기실황
               switch(category) {
                  // 기온
                  case 'T1H':
                     T1H = obsrValue;
                     break;
                  // 1시간 강수량
                  case 'RN1':
                     RN1 = obsrValue;
                     break;
                  // 하늘상태   맑음(1), 구름조금(2), 구름많음(3), 흐림(4)
                  case 'SKY':
                     SKY = obsrValue;
                     break;
                  // 동서바람성분
                  case 'UUU':
                     UUU = obsrValue;
                     break;
                  // 남북바람성분
                  case 'VVV':
                     VVV = obsrValue;
                     break;
                  // 습도
                  case 'REH':
                     REH = obsrValue;
                     break;
                  // 강수형태   없음(0), 비(1), 비/눈(2), 눈(3)
                  case 'PTY':
                     PTY = obsrValue;
                     break;
                  // 낙뢰         없음(0), 있음(1)
                  case 'LGT':
                     LGT = obsrValue;
                     break;
                  // 풍향
                  case 'VEC':
                     VEC = obsrValue;
                     break;
                  // 풍속
                  case 'WSD':
                     WSD = obsrValue;
                     break;
               }
            }
            
            if(PTY != 0) {
               switch(PTY) {
                  case 1:
                     WEATHER_STATUS = "비";
                     WEATHER_ICON = '05';
                     break;
                  case 2:
                     WEATHER_STATUS = "비/눈";
                     WEATHER_ICON = '06';
                     break;
                  case 3:
                     WEATHER_STATUS = "눈";
                     WEATHER_ICON = '07';
                     break;
               }
            } else {
               switch(SKY) {
                  case 1:
                     WEATHER_STATUS = "맑음";
                     WEATHER_ICON = '01';
                     break;
                  case 2:
                     WEATHER_STATUS = "구름조금";
                     WEATHER_ICON = '02';
                     break;
                  case 3:
                     WEATHER_STATUS = "구름많음";
                     WEATHER_ICON = '03';
                     break;
                  case 4:
                     WEATHER_STATUS = "흐림"; 
                     WEATHER_ICON = '04';
                     break;
               }
            } //if 종료
         } catch(err) {
            weatherSucFlag = "N";
            console.log('동네예보를 수신하는데 에러가 발생했습니다.');
         }
         
         var forecastGrib = new ForecastGribBean();
         forecastGrib.T1H = T1H;
         forecastGrib.RN1 = RN1;
         forecastGrib.SKY = SKY;
         forecastGrib.UUU = UUU;
         forecastGrib.VVV = VVV;
         forecastGrib.REH = REH;
         forecastGrib.PTY = PTY;
         forecastGrib.LGT = LGT;
         forecastGrib.VEC = VEC;
         forecastGrib.WSD = WSD;
         forecastGrib.WEATHER_STATUS = WEATHER_STATUS;
         forecastGrib.WEATHER_ICON = WEATHER_ICON;
         
//         console.log('forecastGrib.T1H : '+forecastGrib.T1H);
//         console.log('forecastGrib.RN1 : '+forecastGrib.RN1);
//         console.log('forecastGrib.SKY : '+forecastGrib.SKY);
//         console.log('forecastGrib.UUU : '+forecastGrib.UUU);
//         console.log('forecastGrib.VVV : '+forecastGrib.VVV);
//         console.log('forecastGrib.REH : '+forecastGrib.REH);
//         console.log('forecastGrib.PTY : '+forecastGrib.PTY);
//         console.log('forecastGrib.LGT : '+forecastGrib.LGT);
//         console.log('forecastGrib.VEC : '+forecastGrib.VEC);
//         console.log('forecastGrib.WSD : '+forecastGrib.WSD);
//         console.log('forecastGrib.WEATHER_STATUS : '+forecastGrib.WEATHER_STATUS);
//         console.log('forecastGrib.WEATHER_ICON : '+forecastGrib.WEATHER_ICON);
         
         setForecastGrib( forecastGrib );
      } //success func 종료
      ,error: function(msg) {
         weatherSucFlag = "N";
         console.log("기상정보 조회 실패. ", msg);
      }
      ,complete: function() {
         setHeaderRightHtml("Y", weatherSucFlag);   // 우측 헤더영역 html값 세팅
      }
   });
}