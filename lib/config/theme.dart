import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4b5c92),
      surfaceTint: Color(0xff4b5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdbe1ff),
      onPrimaryContainer: Color(0xff00174b),
      secondary: Color(0xff595e72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdde1f9),
      onSecondaryContainer: Color(0xff161b2c),
      tertiary: Color(0xff745470),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd6f8),
      onTertiaryContainer: Color(0xff2b122b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      onSurfaceVariant: Color(0xff45464f),
      outline: Color(0xff757680),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffb4c5ff),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00174b),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff334478),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff161b2c),
      secondaryFixedDim: Color(0xffc1c5dd),
      onSecondaryFixedVariant: Color(0xff414659),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff2b122b),
      tertiaryFixedDim: Color(0xffe2bbdb),
      onTertiaryFixedVariant: Color(0xff5b3d58),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe3e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f4074),
      surfaceTint: Color(0xff4b5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6172aa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3d4255),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f7488),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff563954),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8c6a87),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      onSurfaceVariant: Color(0xff41424b),
      outline: Color(0xff5d5f67),
      outlineVariant: Color(0xff797a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffb4c5ff),
      primaryFixed: Color(0xff6172aa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff485a8f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f7488),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff565b6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8c6a87),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff71526e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe3e2e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff081e52),
      surfaceTint: Color(0xff4b5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2f4074),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1c2233),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3d4255),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff331932),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff563954),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff22242b),
      outline: Color(0xff41424b),
      outlineVariant: Color(0xff41424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffe8ebff),
      primaryFixed: Color(0xff2f4074),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff162a5d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3d4255),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff272c3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff563954),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e233d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe3e2e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4c5ff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff1b2d60),
      primaryContainer: Color(0xff334478),
      onPrimaryContainer: Color(0xffdbe1ff),
      secondary: Color(0xffc1c5dd),
      onSecondary: Color(0xff2b3042),
      secondaryContainer: Color(0xff414659),
      onSecondaryContainer: Color(0xffdde1f9),
      tertiary: Color(0xffe2bbdb),
      onTertiary: Color(0xff422740),
      tertiaryContainer: Color(0xff5b3d58),
      onTertiaryContainer: Color(0xffffd6f8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121318),
      onSurface: Color(0xffe3e2e9),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f909a),
      outlineVariant: Color(0xff45464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff4b5c92),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00174b),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff334478),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff161b2c),
      secondaryFixedDim: Color(0xffc1c5dd),
      onSecondaryFixedVariant: Color(0xff414659),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff2b122b),
      tertiaryFixedDim: Color(0xffe2bbdb),
      onTertiaryFixedVariant: Color(0xff5b3d58),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac9ff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff001240),
      primaryContainer: Color(0xff7d8fc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc5cae1),
      onSecondary: Color(0xff101626),
      secondaryContainer: Color(0xff8b90a5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe6bfe0),
      onTertiary: Color(0xff250d25),
      tertiaryContainer: Color(0xffa986a4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xfffcfaff),
      onSurfaceVariant: Color(0xffcacad4),
      outline: Color(0xffa2a2ac),
      outlineVariant: Color(0xff82828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff34467a),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff000e35),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff213367),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff0b1021),
      secondaryFixedDim: Color(0xffc1c5dd),
      onSecondaryFixedVariant: Color(0xff303648),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff1f081f),
      tertiaryFixedDim: Color(0xffe2bbdb),
      onTertiaryFixedVariant: Color(0xff492d47),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcfaff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbac9ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc5cae1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe6bfe0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffcfaff),
      outline: Color(0xffcacad4),
      outlineVariant: Color(0xffcacad4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff13275a),
      primaryFixed: Color(0xffe1e6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbac9ff),
      onPrimaryFixedVariant: Color(0xff001240),
      secondaryFixed: Color(0xffe1e6fe),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc5cae1),
      onSecondaryFixedVariant: Color(0xff101626),
      tertiaryFixed: Color(0xffffddf8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe6bfe0),
      onTertiaryFixedVariant: Color(0xff250d25),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
