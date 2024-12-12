import 'package:flutter/material.dart';
import 'filter_dialog.dart';
import 'user_profile.dart';
import 'MatchDetailScreen.dart';

class MatchingScreen extends StatelessWidget {
  final MatchingService _matchingService = MatchingService();

  MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매칭'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: StreamBuilder<List<UserProfile>>(
        stream: _matchingService.getMatchesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('오류가 발생했습니다'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final matches = snapshot.data ?? [];
          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return MatchCard(
                profile: match,
                onTap: () => _showMatchDetails(context, match),
              );
            },
          );
        },
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const FilterDialog(),
    );
  }

  void _showMatchDetails(BuildContext context, UserProfile match) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatchDetailScreen(profile: match),
      ),
    );
  }
}

class MatchingService {
  Stream<List<UserProfile>> getMatchesStream() {
    // TODO: Implement actual matching service
    return Stream.value([]);
  }
}

class MatchCard extends StatelessWidget {
  final UserProfile profile;
  final VoidCallback onTap;

  const MatchCard({
    super.key,
    required this.profile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: profile.photoUrl != null
              ? NetworkImage(profile.photoUrl!)
              : null,
          child: profile.photoUrl == null
              ? const Icon(Icons.person)
              : null,
        ),
        title: Text(profile.name),
        subtitle: Text(profile.occupation),
        onTap: onTap,
      ),
    );
  }
}