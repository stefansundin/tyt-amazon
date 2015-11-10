var tag = "theyoungturks-20";

function updateQueryParam(url, key, value) {
  var re = new RegExp("^([^#]*[?&])"+key+"=.*?(&|#|$)", "i");
  if (url.match(re)) {
    return url.replace(re, "$1"+key+"="+value+"$2");
  }
  else {
    var separator = (url.indexOf("?") == -1 || url.indexOf("#") < url.indexOf("?")) ? "?" : "&";
    return url.replace(/(#|$)/, separator+key+"="+value+"$1");
  }
}

chrome.webRequest.onBeforeRequest.addListener(
  function(details) {
    // console.log(details);
    if (details.method == "GET") {
      if (details.url.indexOf("tag="+tag) == -1) {
        var url = updateQueryParam(details.url, "tag", tag);
        console.log("Applying tag, redirecting to", url);
        return { redirectUrl: url };
      }
    }
    return {};
  },
  {
    urls: [ // You can find a list of these at the bottom of amazon.com
      "*://www.amazon.com/*",
      "*://www.amazon.com.au/*",
      "*://www.amazon.com.br/*",
      "*://www.amazon.ca/*",
      "*://www.amazon.cn/*",
      "*://www.amazon.fr/*",
      "*://www.amazon.de/*",
      "*://www.amazon.in/*",
      "*://www.amazon.it/*",
      "*://www.amazon.co.jp/*",
      "*://www.amazon.com.mx/*",
      "*://www.amazon.nl/*",
      "*://www.amazon.es/*",
      "*://www.amazon.co.uk/*"
    ],
    types: ["main_frame"]
  },
  ["blocking"]
);
