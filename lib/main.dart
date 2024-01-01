import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'pages/home_page.dart';
import 'pages/all_widgets_page.dart';
import 'pages/themes_page.dart';
import 'pages/settings_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Configure the light theme
    final lightTheme = FlexThemeData.light(
      scheme: FlexScheme.greenM3,
      usedColors: 4,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      tooltipsMatchBackground: true,
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepSecondary: true,
        keepPrimaryContainer: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

    // Configure the dark theme
    final darkTheme = FlexThemeData.dark(
      scheme: FlexScheme.greenM3,
      usedColors: 4,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      tooltipsMatchBackground: true,
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

    return MaterialApp(
      title: 'Flex Color Scheme App',
      theme: lightTheme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: lightTheme.colorScheme.primary,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: darkTheme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: darkTheme.colorScheme.primaryContainer,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AllWidgetsPage(),
    const ThemesPage(),
    const SettingsPage(),
    const MenuPage(),
  ];

  final List<String> _titles = [
    'Home',
    'All Widgets',
    'Themes',
    'Settings',
    'Menu',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets), label: 'All Widgets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens), label: 'Themes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
