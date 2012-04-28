/* 
 * dart document.cookie lib
 *
 * ported from
 * http://www.quirksmode.org/js/cookies.html
 *
 */
#library('cookies');
#import('dart:html');

class Cookies {
  
  Cookies() {
  }

void createCookie(String name, String value, int days) {
  String expires;
  if (days != null)  {
    Date now = new Date.now();
    Date date = new Date.fromEpoch(now.value + days*24*60*60*1000, new TimeZone.local());
    expires = '; expires=' + date.toString();    
  } else {
    Date then = new Date.fromEpoch(0, new TimeZone.utc());
    expires = '; expires=' + then.toString();
  }
  window.alert(name + '=' + value + expires + '; path=/');
}

String readCookie(String name) {
  String nameEQ = name + '=';
  List<String> ca = document.cookie.split(';');
  for (int i = 0; i < ca.length; i++) {
    String c = ca[i];
    c = c.trim();
    if (c.indexOf(nameEQ) == 0) {
      return c.substring(nameEQ.length);
    }
  }
  return null;  
}

  void eraseCookie(String name) {
      createCookie(name, '', null);
      }
}