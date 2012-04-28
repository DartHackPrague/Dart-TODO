#library('auth');

class Auth {
  
  final String ISS = '';
  
  final String SCOPE = 'https://www.googleapis.com/auth/tasks';
  
  final String AUD = 'https://accounts.google.com/o/oauth2/token';
  
  // Constructor.  
  Auth() {
    
  }
  
  // Build JWT from params.
  String buildJWT() {
    StringBuffer buffer = new StringBuffer();
    // Header.
    buffer.add('{"alg":"RS256","typ":"JWT"}.');
    
    String exp = '';
    String iat = '';
    
    // Body.
    buffer.add('{');
    
    buffer.add('"iss":"' + ISS + '",');
    buffer.add('"scope":"' + SCOPE + '",');
    buffer.add('"aud":"' + AUD + '",');
    buffer.add('"exp":"' + exp + '",');
    buffer.add('"iat":"' + iat + '"');    
    
    buffer.add('}.');
    return buffer.toString();
  }
  
  // Encode JWT into base64.
  String encodeJWT(String jwt) {
    
  }
  
  
  
  
  
  
}
