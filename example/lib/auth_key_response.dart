
class GetAuthKeyResponse {
  String authKey;
  String transactionRef;

  GetAuthKeyResponse({this.authKey, this.transactionRef});

  GetAuthKeyResponse.fromJson(Map<String, dynamic> json) {
    authKey = json['authKey'];
    transactionRef = json['transactionRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authKey'] = this.authKey;
    data['transactionRef'] = this.transactionRef;
    return data;
  }
}