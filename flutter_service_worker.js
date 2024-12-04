'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "806c11505520eb5a875b464a57603eb9",
".git/config": "cae3123af8cf1065cf4886631e8db50e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "10019c3c6e5ab3164fa947bd44e97411",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "81cea9eb37c3cc8754ca0e0c426eb8b5",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "06d0f6c2c13140f43d8ae91314e1cd90",
".git/logs/refs/heads/backup-gh-pagse": "6971233bc775e3e3e4d9fe21aa9e0168",
".git/logs/refs/heads/gh-pages": "39501d1485ed66dcfb7b0ba1614f03fe",
".git/logs/refs/remotes/origin/gh-pages": "22f8093d67343ea821a2c62c197cfcac",
".git/logs/refs/remotes/origin/master": "3e8bd743b642c77188a2286dc1d36294",
".git/objects/04/d3c6c52f1f27b6006d74041735ef4cc6987cfd": "fa469d7796ade3477fd0220b9f386a71",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/10/49f0642318ab17de436010400e37723c1c3c43": "6f10c7a680a230babf30eb6623a448e3",
".git/objects/27/93b7d7ea25162417393ee5ca2f6057f64632cd": "3d12e8d9ddc6834e5c240c33483005e1",
".git/objects/2b/09b8f8be09580e28fdba2ddd6cc23b75f9ded7": "219cf64facc6169017d5bbe7c2e4bd01",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/44/3129a651c821a5c157ec935409a01760b867ea": "fd4e29eb328b8b30a7256887318e7d82",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/44/d70bf8287d936649891586814eb2725c6932f7": "9ab2e4cff1b56d075a7275a5e4d0bb6a",
".git/objects/48/d6f12a362e39c07dc4241327c164702567765d": "de7d7c359553d267add1ce64938193a5",
".git/objects/61/2258dd15310333732d948faa30221b601232f5": "dafced849a1beebc4e67d4f8775347f0",
".git/objects/69/2d2678caf071ca1d4e9ee4e4158e534e0cf667": "11e81b45b47a8405ccce2f6838c452f2",
".git/objects/6b/b115b24327164cc5e0b6dc3ac85845bc8b7a44": "d673f289e423afc7d52e8a68d0f370ee",
".git/objects/6b/be36b31355b0130a6942ee2b4f930332b24349": "824f322427385759e02dc033198e06f2",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/6e/77b469d617199cd1db67df5a4186d0ead12d34": "ad2ee30b00f8b11424632ba9b57b193f",
".git/objects/6f/c0cffd64fa205da5a4d92f93fb9c6a57514d8c": "544095ac6a669e09b5be42a1ed249e0a",
".git/objects/78/0ed7e13898bbd770ce01d6c21b2b438cb7e301": "6318b0bffc5175f05a92087b0e48b136",
".git/objects/78/bacac0d44402291a88ad5dcf9d1a1df6ff1293": "de99fd01bed33218361b7fa264b669c1",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/7c/39e5448454457f50405da676006382e82d833c": "8cc9a27021afd090a355c0e738456eb8",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/84/e6f579468acefd92100cf4fc94f4cbb6b24feb": "27fe86200c62408d651ee2e00feb667f",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/9a/760401e3b433acf67c315d0512f2431e387b42": "04dcfee63db1eb8d70257eda5185deb3",
".git/objects/9f/f3e878a79059541c7b7aea92ec383d00458eb7": "4e1fb14e22c890f1fe04869e959604b5",
".git/objects/a8/40395cd5bfe4f97f243f94acf586d6e0b14664": "1926b84ff4ae24d520458fb77d3e4746",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/8c87792d7a68ffd71898fa598b9b983f7e7ef9": "f455d63cfccab304798020f3d589d259",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/cc/6a7f6fe4a58d42b73cdbd1bdff3382ad9e0225": "472c293f494a55038340d724627fe159",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d0/eb35337cbb57f3b10f62562ecd17075c92ec70": "5dd948254b812f217e868dd60dde7e66",
".git/objects/d4/0e5a0a09342133c9a0474498b6a10d8e7be778": "f67d06761629348241623f020d0fd28d",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/dd11d997b616364c38385f04e73c3d318c3da6": "3587c77f59476ae736f127a116d7b12f",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/e8/1a7909a4c07cadfdac480d669ee44462791032": "db1dce0c5cc934b7897281c555344b70",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f7/46ffe90426a005e8f9286d2c3998d827a37396": "7105efdf7c8c1dfd875b15eb63a34133",
".git/objects/fe/c0302bdbe3cae80430ebb2c6578daba6ecc055": "51894f274fea3e5d9991b40db5f8ed2f",
".git/objects/pack/pack-5e427df575908e3a9bec886f94c90496972e9c65.idx": "51be04a377952430e66ec0bae89c637a",
".git/objects/pack/pack-5e427df575908e3a9bec886f94c90496972e9c65.pack": "8dc0ddf629734e9ea892fcff4f756808",
".git/objects/pack/pack-5e427df575908e3a9bec886f94c90496972e9c65.rev": "be528808d56878d7426802c68b7521d0",
".git/ORIG_HEAD": "4a25107676adb334bf713ae676e114c0",
".git/refs/heads/backup-gh-pagse": "4a25107676adb334bf713ae676e114c0",
".git/refs/heads/gh-pages": "4a25107676adb334bf713ae676e114c0",
".git/refs/remotes/origin/gh-pages": "4a25107676adb334bf713ae676e114c0",
".git/refs/remotes/origin/master": "98ad304235d1e6ab44ba23a649bdbff2",
"assets/AssetManifest.bin": "fe7ffff9a9f8afd46a0e5857c8f9f9ec",
"assets/AssetManifest.bin.json": "ac7886552761c923372e97bd62420ae8",
"assets/AssetManifest.json": "b204d5af3252f7ff1f126c87bde771ff",
"assets/assets/audio/background_music.mp3": "092f8b9ed8ddc3ae6198bc09b9fbedf8",
"assets/assets/audio/explosion.mp3": "b4e8d8cff400c6e9cc863c875d2857eb",
"assets/assets/audio/laser.mp3": "29922677553a3d4ddb08a760cfc92032",
"assets/assets/images/background_layer1.png": "1a5eb253120d76a972ac4bfa3c163c7c",
"assets/assets/images/background_layer2.png": "e2de67182f1ceb55db78cb264e8b7f1e",
"assets/assets/images/background_layer3.png": "262b72565f264be78ffab7cc64ce492a",
"assets/assets/images/background_layer4.png": "5935f52e84845ef13c52808d5adf61eb",
"assets/assets/images/bullet.png": "f9c49eb595e02bb4122aae17542d5798",
"assets/assets/images/enemy_spaceship.png": "a5e641ad8df5ed9c0984e450773c810f",
"assets/assets/images/player.png": "ea9e367f45927784349b2004ceed0aed",
"assets/assets/images/smoke_explosion.png": "95a5d5aaabc8811c1da5cc987b9dacc8",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "e62080dff031fe14dab377e5c93ca407",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "dac1454b18e7292bf9855ca83290a782",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6a27cb7de0827ab2ca67d4a1273c4a8c",
"/": "6a27cb7de0827ab2ca67d4a1273c4a8c",
"main.dart.js": "5e32a1c9f159ba1c3b62f7853d97a785",
"manifest.json": "74d25a0ecb902f1b55dc0307237901f8",
"version.json": "7be5c6536a8d8f2531a632a05b828a39"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
