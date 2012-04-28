#library('base64');

class Base64 {
  
  String _keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  
  String encode(String input) {
    var output = "";
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
    var i = 0;

    //input = Base64._utf8_encode(input);

    while (i < input.length) {

        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (chr2.isNaN()) {
            enc3 = enc4 = 64;
        } else if (chr3.isNaN()) {
            enc4 = 64;
        }

        output = output +
        this._keyStr[enc1] + this._keyStr[enc2] +
        this._keyStr[enc3] + this._keyStr[enc4];

    }

    return output;  
  }
  
}
