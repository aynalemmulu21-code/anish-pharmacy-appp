import 'package:flutter/material.dart';

void main() {
  runApp(const AnishApp());
}

class AnishApp extends StatelessWidget {
  const AnishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anish',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    DashboardPage(),
    PracticePage(),
    TopicsPage(),
    ProgressPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('anish'),
        centerTitle: false,
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.quiz_outlined), selectedIcon: Icon(Icons.quiz), label: 'Practice'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Topics'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Progress'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('EHPLE / COC Pharmacy Study',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Study smarter. Practice more. Be exam ready.'),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quick Start', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                const Text('Start a practice session with pharmacy MCQs and review explanations.'),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Practice'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _StatCard(title: 'Questions', value: '0', icon: Icons.quiz)),
            const SizedBox(width: 10),
            Expanded(child: _StatCard(title: 'Accuracy', value: '0%', icon: Icons.track_changes)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _StatCard(title: 'Mock Exams', value: '0', icon: Icons.timer)),
            const SizedBox(width: 10),
            Expanded(child: _StatCard(title: 'Streak', value: '0 days', icon: Icons.local_fire_department)),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  const _StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Practice', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _PracticeTile(title: 'Quick Practice', subtitle: '10 random questions', icon: Icons.flash_on),
        _PracticeTile(title: '50-Question Test', subtitle: 'Timed mock examination', icon: Icons.assignment),
        _PracticeTile(title: 'Full Mock Exam', subtitle: 'Exam-style simulation', icon: Icons.timer),
        _PracticeTile(title: 'Review Mistakes', subtitle: 'Study questions you missed', icon: Icons.replay),
      ],
    );
  }
}

class _PracticeTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const _PracticeTile({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      'Pharmacology',
      'Pharmaceutics',
      'Pharmaceutical Chemistry',
      'Clinical Pharmacy',
      'Hospital Pharmacy',
      'Pharmacy Practice',
      'Pharmacotherapy',
      'Public Health Pharmacy',
    ];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Pharmacy Topics', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        ...topics.map((topic) => Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(topic),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        )),
      ],
    );
  }
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('My Progress', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.insights, size: 56),
                const SizedBox(height: 12),
                Text('Your progress will appear here.',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text('Complete practice questions to track accuracy, weak topics, and exam readiness.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
