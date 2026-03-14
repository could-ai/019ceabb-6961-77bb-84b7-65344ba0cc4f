import 'package:flutter/material.dart';

void main() {
  runApp(const PetStoreApp());
}

class PetStoreApp extends StatelessWidget {
  const PetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Store Specials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PetStoreHomePage(),
      },
    );
  }
}

class PetStoreHomePage extends StatefulWidget {
  const PetStoreHomePage({super.key});

  @override
  State<PetStoreHomePage> createState() => _PetStoreHomePageState();
}

class _PetStoreHomePageState extends State<PetStoreHomePage> {
  // Create the two boolean variables as requested
  bool isCatOwner = false;
  bool isDogOwner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Store'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Tell us about your pets!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Toggles for the boolean variables
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('I am a Cat Owner 🐱'),
                    value: isCatOwner,
                    onChanged: (bool value) {
                      setState(() {
                        isCatOwner = value;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('I am a Dog Owner 🐶'),
                    value: isDogOwner,
                    onChanged: (bool value) {
                      setState(() {
                        isDogOwner = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Display area for the specials
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.local_offer, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Specials:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  
                  // Logic to display the correct messages
                  if (isCatOwner)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Use the code MEOW for 20% off cat items.',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                  if (isDogOwner)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Use the code WOOF for 20% off dog items.',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                  if (!isCatOwner && !isDogOwner)
                    const Text(
                      'Welcome to the pet store!',
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
