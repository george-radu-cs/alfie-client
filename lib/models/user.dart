class User {
  final int? id;
  final String email;
  final String firstName;
  final String lastName;
  final bool verified;
  final bool loginCanCheck2FA;
  final String? token;

  User({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.verified,
    required this.loginCanCheck2FA,
    required this.token,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        verified: json['verified'] == 1,
        loginCanCheck2FA: json['loginCanCheck2FA'] == 1,
        token: json['token'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'verified': verified ? 1 : 0,
        'loginCanCheck2FA': loginCanCheck2FA ? 1 : 0,
        'token': token,
      };

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? verified,
    bool? loginCanCheck2FA,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      verified: verified ?? this.verified,
      loginCanCheck2FA: loginCanCheck2FA ?? this.loginCanCheck2FA,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, verified: $verified, loginCanCheck2FA: $loginCanCheck2FA, token: $token)';
  }
}
