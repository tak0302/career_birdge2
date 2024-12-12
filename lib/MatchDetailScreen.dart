// match_detail_screen.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';

class MatchDetailScreen extends StatelessWidget {
  final UserProfile profile;

  const MatchDetailScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 상세'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profile.photoUrl != null
                    ? NetworkImage(profile.photoUrl!)
                    : null,
                child: profile.photoUrl == null
                    ? const Icon(Icons.person, size: 60)
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.occupation,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Divider(height: 32),
                    const Text(
                      '경력',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(profile.experience ?? '경력 정보 없음'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: 채팅 시작 구현
                  },
                  icon: const Icon(Icons.chat),
                  label: const Text('채팅하기'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    // TODO: 멘토링 신청 구현
                  },
                  icon: const Icon(Icons.school),
                  label: const Text('멘토링 신청'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}