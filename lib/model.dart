
class LoginResponse {
  final LoginPayload? login;  // Make login nullable

  LoginResponse({required this.login});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'login' is null before accessing its properties
    return LoginResponse(
      login: json['login'] != null ? LoginPayload.fromJson(json['login']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login?.toJson(),
    };
  }
}

class LoginPayload {
  final String accessToken;
  final String refreshToken;
  final User user;

  LoginPayload({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginPayload.fromJson(Map<String, dynamic> json) {
    return LoginPayload(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user.toJson(),
    };
  }
}

class User {
  final String? avatarUrl;
  final DateTime createdAt;
  final String email;
  final bool emailVerified;
  final String firstName;
  final String fullName;
  final String id;
  final String? invitationStatus;
  final String? phoneNumber;
  final bool status;
  final DateTime updatedAt;
  final String userName;

  User({
    this.avatarUrl,
    required this.createdAt,
    required this.email,
    required this.emailVerified,
    required this.firstName,
    required this.fullName,
    required this.id,
    this.invitationStatus,
    this.phoneNumber,
    required this.status,
    required this.updatedAt,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatarUrl: json['avatarUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      email: json['email'],
      emailVerified: json['emailVerified'],
      firstName: json['firstName'],
      fullName: json['fullName'],
      id: json['id'],
      invitationStatus: json['invitationStatus'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      updatedAt: DateTime.parse(json['updatedAt']),
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatarUrl': avatarUrl,
      'createdAt': createdAt.toIso8601String(),
      'email': email,
      'emailVerified': emailVerified,
      'firstName': firstName,
      'fullName': fullName,
      'id': id,
      'invitationStatus': invitationStatus,
      'phoneNumber': phoneNumber,
      'status': status,
      'updatedAt': updatedAt.toIso8601String(),
      'userName': userName,
    };
  }
}
