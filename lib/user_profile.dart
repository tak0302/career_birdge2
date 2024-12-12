class UserProfile {
  final String uid;
  final String name;
  final int age;
  final String occupation;
  final List<String> interests;
  final String experience;
  final String profileImageUrl;
  final Map<String, dynamic> skills;

  UserProfile({
    required this.uid,
    required this.name,
    required this.age,
    required this.occupation,
    required this.interests,
    required this.experience,
    this.profileImageUrl = '',
    required this.skills,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'occupation': occupation,
      'interests': interests,
      'experience': experience,
      'profileImageUrl': profileImageUrl,
      'skills': skills,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      occupation: map['occupation'] ?? '',
      interests: List<String>.from(map['interests'] ?? []),
      experience: map['experience'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      skills: Map<String, dynamic>.from(map['skills'] ?? {}),
    );
  }

  get photoUrl => null;
}