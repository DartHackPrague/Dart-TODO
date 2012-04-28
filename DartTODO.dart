#import('dart:html');
#import('Auth.dart');

class DartTODO {

  DartTODO() {
  }

  void run() {
    Auth auth = new Auth();
    String request = auth.buildJWT();
    
    //Base64 base64 = new Base64();
    
    //String out = base64.encode(request);
    //print(out);
    
    
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartTODO().run();
}
