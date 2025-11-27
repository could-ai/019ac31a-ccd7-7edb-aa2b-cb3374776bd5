import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/logo_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isGeneratingPdf = false;

  void _downloadPdf() async {
    setState(() {
      _isGeneratingPdf = true;
    });

    // Simulate PDF generation delay
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isGeneratingPdf = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text("Success"),
            ],
          ),
          content: const Text("Your Career Report PDF has been successfully generated and downloaded to your device."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Results'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWidget(size: 24),
            const SizedBox(height: 32),
            const Icon(Icons.analytics_outlined, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              'Analysis Complete!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Based on your psychometric profile, we have identified the best career paths for you.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            
            // Mock Results Preview
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                children: [
                  Text(
                    "Top Career Matches",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.computer)),
                    title: Text("Software Engineering"),
                    subtitle: Text("95% Match"),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.science)),
                    title: Text("Data Science"),
                    subtitle: Text("88% Match"),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.business)),
                    title: Text("Project Management"),
                    subtitle: Text("82% Match"),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _isGeneratingPdf ? null : _downloadPdf,
                icon: _isGeneratingPdf 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                  : const Icon(Icons.picture_as_pdf),
                label: Text(_isGeneratingPdf ? "Generating Report..." : "DOWNLOAD FULL REPORT (PDF)"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
