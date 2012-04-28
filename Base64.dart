#library('base64');

class Base64 {
  
  String _keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  
  String encode(String input) {
    var output = "";
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
    var i = 0;
    
    input = this.utf8Encode(input);

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
  
  
  String utf8Encode(String string) {
    // private method for UTF-8 encoding
    string = string.replaceAll('/\r\n/g',"\n");
    var utftext = "";

    for (var n = 0; n < string.length; n++) {

        var c = string.charCodeAt(n);

        if (c < 128) {
            utftext += new String.fromCharCodes([c]); //String.fromCharCode(c);
        }
        else if((c > 127) && (c < 2048)) {
            utftext += new String.fromCharCodes([(c >> 6) | 192]); //String.fromCharCode((c >> 6) | 192);
            utftext += new String.fromCharCodes([(c & 63) | 128]);//String.fromCharCode((c & 63) | 128);
        }
        else {
            utftext += new String.fromCharCodes([(c >> 12) | 224]); //String.fromCharCode((c >> 12) | 224);
            utftext += new String.fromCharCodes([((c >> 6) & 63) | 128]); //String.fromCharCode(((c >> 6) & 63) | 128);
            utftext += new String.fromCharCodes([(c & 63) | 128]); //String.fromCharCode((c & 63) | 128);
        }

    }
    return utftext;
    
}
  
  
}
