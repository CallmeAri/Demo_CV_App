import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade900,
        brightness: Brightness.dark,
        dividerTheme: DividerThemeData(indent: 32, endIndent: 32),
        dividerColor: surfaceColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            displayMedium: TextStyle(fontSize: 30),
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(200, 255, 255, 255)),
            headlineMedium: TextStyle(fontSize: 15),
            headlineSmall: TextStyle(
                fontSize: 11, color: Color.fromARGB(100, 255, 255, 255)),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiculum Vitae'),
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(
            width: 8,
          ),
          Icon(CupertinoIcons.ellipsis_vertical),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/profile_image.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brice Serophin",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text("Product & Print Designer"),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            size: 15,
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Paris,Germany",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              "Cras id tempor quam, quis placerat nulla. Proin hendrerit interdum pellentesque. Etiam feugiat nulla ante, eget posuere arcu semper a. Aliquam non arcu vitae diam posuere aliquam ut at nisi. Sed ut porta tortor. Sed non dolor pharetra, mollis eros non, molestie lorem. Quisque venenatis metus non rhoncus mollis. Curabitur blandit tellus et pretium rhoncus",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Skills",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w900)),
                SizedBox(width: 2),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            ),
          ),
          SizedBox(height: 12,),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                Skill(
                  title: "Photoshop",
                  imagePath: "assets/images/app_icon_01.png",
                  shadowColor: Colors.blue,
                  isActive: true,
                ),
                  Skill(
                  title: "Adobe XD",
                  imagePath: "assets/images/app_icon_05.png",
                  shadowColor: Colors.pink,
                  isActive: false,
                ),  Skill(
                  title: "Illustrator",
                  imagePath: "assets/images/app_icon_04.png",
                  shadowColor: Colors.orange,
                  isActive: false,
                ),  Skill(
                  title: "After Effect",
                  imagePath: "assets/images/app_icon_03.png",
                  shadowColor: Colors.blue.shade800,
                  isActive: false,
                ),  Skill(
                  title: "Lightroom",
                  imagePath: "assets/images/app_icon_02.png",
                  shadowColor: Colors.blue,
                  isActive: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  
  const Skill({
    super.key, required this.title, required this.imagePath, required this.shadowColor,required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: isActive?BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(16)):null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
           imagePath,
            width: 40,
            height: 40,
          ),
          SizedBox(height: 8,),
          Text(title),
        ],
      ),
    );
  }
}
