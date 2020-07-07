import 'dart:convert';

LoginToken loginTokenFromJson(String str) => LoginToken.fromJson(json.decode(str));

String loginTokenToJson(LoginToken data) => json.encode(data.toJson());

class LoginToken {
    String tokenType;
    int expiresIn;
    String accessToken;
    String refreshToken;

    LoginToken({
        this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
    });

    factory LoginToken.fromJson(Map<String, dynamic> json) => new LoginToken(
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "access_token": accessToken == null ? null : accessToken,
        "refresh_token": refreshToken == null ? null : refreshToken,
    };

}