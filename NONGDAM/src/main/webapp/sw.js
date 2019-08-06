//importScripts('/js/cropsdoctor/pwa/idb.js');
//importScripts('/js/cropsdoctor/pwa/utility.js');

var CACHE_STATIC_NAME = 'static-v24';
var CACHE_DYNAMIC_NAME = 'dynamic-v2';
var STATIC_FILES = [
  '/',
// '/index.html',
// '/offline.html',
  '/js/cropsdoctor/pwa/app.js',
// '/js/cropsdoctor/pwa/feed.js',
  '/js/cropsdoctor/pwa/idb.js',
  '/js/cropsdoctor/pwa/utility.js'
// '/js/cropsdoctor/pwa/promise.js',
// '/js/cropsdoctor/pwa/fetch.js',
// '/js/cropsdoctor/pwa/material.min.js'
// '/src/css/app.css',
// '/src/css/feed.css',
// '/src/images/main-image.jpg',
// 'https://fonts.googleapis.com/css?family=Roboto:400,700',
// 'https://fonts.googleapis.com/icon?family=Material+Icons',
// 'https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.3.0/material.indigo-pink.min.css'
];

self.addEventListener('install', function (event) {
  console.log('[Service Worker] Installing Service Worker ...', event);
  event.waitUntil(
    caches.open(CACHE_STATIC_NAME)
      .then(function (cache) {
        console.log('[Service Worker] Precaching App Shell');
        cache.addAll(STATIC_FILES);
      })
  )
});

self.addEventListener('activate', function (event) {
	  console.log('[Service Worker] Activating Service Worker ....', event);
	  event.waitUntil(
	    caches.keys()
	      .then(function (keyList) {
	        return Promise.all(keyList.map(function (key) {
	          if (key !== CACHE_STATIC_NAME && key !== CACHE_DYNAMIC_NAME) {
	            console.log('[Service Worker] Removing old cache.', key);
	            return caches.delete(key);
	          }
	        }));
	      })
	  );
	  return self.clients.claim();
	});

function isInArray(string, array) {
  var cachePath;
  if (string.indexOf(self.origin) === 0) { // request targets domain where we
											// serve the page from (i.e. NOT a
											// CDN)
    console.log('matched ', string);
    cachePath = string.substring(self.origin.length); // take the part of the
														// URL AFTER the domain
														// (e.g. after
														// localhost:8080)
  } else {
    cachePath = string; // store the full request (for CDNs)
  }
  return array.indexOf(cachePath) > -1;
}

self.addEventListener('fetch', function (event) {

  var url = 'https://pwagram-99adf.firebaseio.com/posts';
  if (event.request.url.indexOf(url) > -1) {
    event.respondWith(fetch(event.request)
      .then(function (res) {
        var clonedRes = res.clone();
        clearAllData('posts')
          .then(function () {
            return clonedRes.json();
          })
          .then(function (data) {
            for (var key in data) {
              writeData('posts', data[key])
            }
          });
        return res;
      })
    );
  } else if (isInArray(event.request.url, STATIC_FILES)) {
    event.respondWith(
      caches.match(event.request)
    );
  } else {
	  return;
//    event.respondWith(
//      caches.match(event.request)
//        .then(function (response) {
//          if (response) {
//            return response;
//          } else {
//            return fetch(event.request)
//              .then(function (res) {
//                return caches.open(CACHE_DYNAMIC_NAME)
//                  .then(function (cache) {
//                    // trimCache(CACHE_DYNAMIC_NAME, 3);
//                    cache.put(event.request.url, res.clone());
//                    return res;
//                  })
//              })
//              .catch(function (err) {
//                return caches.open(CACHE_STATIC_NAME)
//                  .then(function (cache) {
//                    if (event.request.headers.get('accept').includes('text/html')) {
//                      return cache.match('/user/main/offline.do');
//                    }
//                  });
//              });
//          }
//        })
//    );
  }
});

// click Action
self.addEventListener('notificationclick', function(event) {
  var notification = event.notification;
  var action = event.action;

  console.log("notification : " + notification);
  console.log("notification.body : " + notification.body);
  var url = notification.data.url;
  console.log("notification.data.url : " + url);
  
  console.log('Confirm was chosen');
  clients.openWindow(url);
  notification.close();
  
});

// close Action
self.addEventListener('notificationclose', function(event) {
  console.log('Notification was closed', event);
});



// push Action
self.addEventListener('push', function(event){
	console.log('Push Notification received', event);
	console.log("event : " + event);
	console.log("event.data : " + event.data);
	console.log("event.data.text() : " + event.data.text());
//	console.log("JSON.parse(event.data) : " + JSON.parse(event.data));
	console.log("JSON.parse(event.data.text()) : " + JSON.parse(event.data.text()));
	var resp = JSON.parse(event.data.text());
	var cat = resp.cat;
	var url = resp.url;
	console.log("resp.cat : " + cat);
	console.log("resp.url : " + url);
	
//	var tempData = event.data;
//	var text = tempData.text();
	var result;
	if(cat == "답변"){
		result = {title : '답변등록', content : '답변이 등록되었습니다.'};
	}else if(cat == "알람"){
		result = {title : '알람', content : '그만 일하고 집에 가자'};
	}
	
	
	
	var options = {
		body : result.content,
		data : {
			url : url
		},
		icon : '/img/pwa/icons/bed-bug_96x96.png',
		badge : '/img/pwa/icons/bed-bug_96x96.png',
	};
	
	event.waitUntil(
		self.registration.showNotification(result.title, options)
	);
	
});

