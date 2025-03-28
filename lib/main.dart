import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'E-Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "E-Shopping List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Organize your shopping items, add reference links, and check the items when purchased.",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "Shopping List Features"),
              Tab(icon: Icon(Icons.settings), text: "About"),
            ],
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/coverImage.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.8), // White gradient start
                      Colors.white.withOpacity(0.4), // Middle fade
                    ],
                  ),
                ),
                child: const TabBarView(
                  children: [
                    FeaturesScreen(),
                    AboutScreen(),
                  ],
                ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              heroTag: 'Download the Android Version', // Needed when multiple FABs exist
              onPressed: () => _launchURL('https://appdistribution.firebase.google.com/testerapps/1:985202200278:android:6ee3e75bccf42ac4280377/releases/2prskdsg2hg1g?utm_source=firebase-console'),
              icon: Icon(Icons.android_sharp),
              tooltip: 'Android App',
              label: Text('Download'),
            ),
            SizedBox(width: 10),
            // Space between buttons
            FloatingActionButton.extended(
              heroTag: 'Demo',
              onPressed: () => _launchURL('https://drive.google.com/file/d/1ueqfc98v7D0TmYQbsUf5tGSUKgV3Z8kt/view?usp=sharing'),
              icon: Icon(Icons.video_camera_back),
              tooltip: 'Demo',
              label: Text('Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FeatureItem(
            screenshot: 'images/screenshot4.png',
            title: "Login with phone number (feature#1)",
            description: "Easily login with your phone number and receive the OTP",
          ),
          FeatureItem(
            screenshot: 'images/screenshot3.png',
            title: "All shopping lists cards (feature#2)",
            description: "View all created lists with the ability \nto add new list or delete any of the existing",
          ),
          FeatureItem(
            screenshot: 'images/screenshot1.png',
            title: "Check Items (feature#3)",
            description: "Check any of the created cards with the ability to \nadd external links and check the item when purchased",
          ),
        ],
      ),
    );
  }
}


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Why I Built This App?\n',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          '- I wanted an app for daily use to organize my shopping items.\n- Needed a simple, efficient way to add and mark items as completed.\n- Inspired to create something useful and user-friendly.\n- Completing ALX Portfolio Project\n',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, color: Colors.grey[900]),
        ),
        SizedBox(height: 8),
        Text(
          'Github Link: https://github.com/DoEhab/my-shopping-list.git',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'I am the sole contributor to this project:\n',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'My Github: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'https://github.com/DoEhab\n',
                style: TextStyle(fontSize: 16, color: Colors.grey[900]),
              ),
              TextSpan(
                text: 'My Twitter username: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'DoEhab\n',
                style: TextStyle(fontSize: 16, color: Colors.grey[900]),
              ),
              TextSpan(
                text: 'My LinkedIn: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'www.linkedin.com/in/doha-eh\n',
                style: TextStyle(fontSize: 16, color: Colors.grey[900]),
              ),
            ],
          ),
        )
      ],
    )
    );
  }

}

class FeatureItem extends StatelessWidget {
  final String screenshot;
  final String title;
  final String description;

  const FeatureItem({
    required this.screenshot,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey[900]),
        ),
        SizedBox(height: 6),
        Image.asset(screenshot, width: 250, height: 520, fit: BoxFit.cover),

      ],
    );
  }
}
