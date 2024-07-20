import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  // This widget is the root of your application.
  Locale _locale = const Locale("en");

  @override
  Widget build(BuildContext context) {
    Color surfaceColor = const Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark) {
              _themeMode = ThemeMode.light;
            } else {
              _themeMode = ThemeMode.dark;
            }
          });
        },
        updateSelectedlanguagechanged:(_Language newSelectedLanguageByUser){
setState(() {
  

          _locale=newSelectedLanguageByUser==_Language.en?const Locale('en'):const Locale("fa");});
        } ,
        
      ),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryfontfamily = 'IranYekan';
  final primaryColor = Colors.pink.shade400;
  final Brightness brightness;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color appBarColor;
  final Color backgroundColor;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(
          255,
          30,
          30,
          30,
        ),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(
          255,
          235,
          235,
          235,
        ),
        brightness = Brightness.light;

  ThemeData getTheme(String languagecode) {
    return ThemeData(
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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(primaryColor))),
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      brightness: brightness,
      dividerTheme: const DividerThemeData(indent: 32, endIndent: 32),
      dividerColor: surfaceColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor, elevation: 0),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor),
      textTheme: languagecode == "en" ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
        displayMedium: TextStyle(fontSize: 22, color: primaryTextColor),
        headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: secondaryTextColor),
        headlineMedium: TextStyle(fontSize: 15, color: primaryTextColor),
        headlineSmall: TextStyle(fontSize: 11, color: primaryTextColor),
      ));

  TextTheme get faPrimaryTextTheme => TextTheme(
        displayMedium: TextStyle(
            fontSize: 22,
            color: primaryTextColor,
            fontFamily: faPrimaryfontfamily),
        headlineLarge: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: secondaryTextColor,
            fontFamily: faPrimaryfontfamily),
        headlineMedium: TextStyle(
            fontSize: 15,
            color: primaryTextColor,
            fontFamily: faPrimaryfontfamily,
            height: 2),
        headlineSmall: TextStyle(
            fontSize: 10,
            color: primaryTextColor,
            fontFamily: faPrimaryfontfamily),
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(_Language _language) updateSelectedlanguagechanged;
  const MyHomePage({super.key, required this.toggleThemeMode, required this.updateSelectedlanguagechanged});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;
  _Language _language = _Language.en;

  void _updateSelectedSkill(_SkillType skilltype) {
    setState(() {
      this._skill = skilltype;
    });
  }

  void _updateSelectedlanguage(_Language language) {
    widget.updateSelectedlanguagechanged(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.profiletitle,
          style: Theme.of(context).textTheme.displayMedium,
          
        ),
        
        actions: [
          CupertinoSlidingSegmentedControl<_Language>(
              groupValue: _language,//مقدار اولیه رو مشخص میکنه
              // thumbColor: Theme.of(context).colorScheme.primary,
              children: {
                _Language.en: Text(localization.enLanguage,style: const TextStyle(fontSize: 10),),
                _Language.fa: Text(localization.faLanguage,style: const TextStyle(fontSize: 10),),
              },
              onValueChanged: (value) {
                if (value != null) _updateSelectedlanguage(value);
              }),
              const SizedBox(width: 8,),
          const Icon(CupertinoIcons.chat_bubble),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.sun_max_fill),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                          localization.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(localization.jobtitle),
                        const SizedBox(
                          height: 5,
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
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              localization.location,
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
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                localization.summary,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(localization.skill,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(width: 2),
                  const Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    type: _SkillType.photoshop,
                    title: "Photoshop",
                    imagePath: "assets/images/app_icon_01.png",
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.photoshop,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  Skill(
                    type: _SkillType.xd,
                    title: "Adobe XD",
                    imagePath: "assets/images/app_icon_05.png",
                    shadowColor: Colors.pink,
                    isActive: _skill == _SkillType.xd,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                  Skill(
                    type: _SkillType.illustrator,
                    title: "Illustrator",
                    imagePath: "assets/images/app_icon_04.png",
                    shadowColor: Colors.orange,
                    isActive: _skill == _SkillType.illustrator,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  Skill(
                    type: _SkillType.afterEffect,
                    title: "After Effect",
                    imagePath: "assets/images/app_icon_03.png",
                    shadowColor: Colors.blue.shade800,
                    isActive: _skill == _SkillType.afterEffect,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.afterEffect);
                    },
                  ),
                  Skill(
                    type: _SkillType.lightRoom,
                    title: "Lightroom",
                    imagePath: "assets/images/app_icon_02.png",
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.lightRoom,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.lightRoom);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(localization.personalinformation,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: localization.email,
                        prefixIcon: const Icon(CupertinoIcons.at)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText:localization.password,
                        prefixIcon: const Icon(CupertinoIcons.lock)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 48,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text(localization.save)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skill({
    super.key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultborderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultborderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: defaultborderRadius)
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

enum _SkillType {
  photoshop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

enum _Language {
  en,
  fa,
}
