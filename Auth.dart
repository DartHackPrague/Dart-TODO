#library('auth');

#import('Base64.dart');

class Auth {
  
  final String ISS = '444182523525.apps.googleusercontent.com';
  final String SCOPE = 'https://www.googleapis.com/auth/tasks';  
  final String AUD = 'https://accounts.google.com/o/oauth2/token';
  
  Base64 base64;
  
  // Constructor.  
  Auth() {
    base64 = new Base64();
  }
  
  // Build JWT from params.
  String buildJWT() {
    String exp = '';
    String iat = '';
    
    String header = '{"alg":"RS256","typ":"JWT"}';
    
    StringBuffer claim = new StringBuffer();
    
    // Body.
    claim.add('{');    
    claim.add('"iss":"' + ISS + '",');
    claim.add('"scope":"' + SCOPE + '",');
    claim.add('"aud":"' + AUD + '",');
    claim.add('"exp":"' + exp + '",');
    claim.add('"iat":"' + iat + '"');  
    claim.add('}');
    
    // Signature.
    StringBuffer signature = new StringBuffer();
    signature.add('{');
    signature.add(this.base64.encode(header));
    signature.add('.');
    signature.add(this.base64.encode(claim.toString()));  
    signature.add('}');
    
    print(header);
    print(claim.toString());
    print(signature.toString());
    
    StringBuffer buffer = new StringBuffer();
    buffer.add(this.base64.encode(header));
    buffer.add('.');
    buffer.add(this.base64.encode(claim.toString()));
    buffer.add('.');
    buffer.add(this.base64.encode(signature.toString()));
    
    return buffer.toString();
  }
  
    
}
