enum TechnicalStack {
  flutter,
  dart,
  kotlin,
  compose,
  reactNative,
  swiftUI,
  ciCd,
  fastlane,
  aws,
  docker,
  golang,
  django,
  cleanArchitecture,
  mvvm,
}

extension TechnicalStackExtension on TechnicalStack {
  String get name {
    switch (this) {
      case TechnicalStack.flutter:
        return 'Flutter';
      case TechnicalStack.django:
        return 'Django';
      case TechnicalStack.golang:
        return 'Golang';
      case TechnicalStack.compose:
        return 'Jetpack Compose';
      case TechnicalStack.kotlin:
        return 'Kotlin';
      case TechnicalStack.dart:
        return 'Dart';
      case TechnicalStack.reactNative:
        return 'React Native';
      case TechnicalStack.swiftUI:
        return 'SwiftUI';
      case TechnicalStack.ciCd:
        return 'CI/CD';
      case TechnicalStack.fastlane:
        return 'Fastlane';
      case TechnicalStack.aws:
        return 'AWS';
      case TechnicalStack.docker:
        return 'Docker';
      case TechnicalStack.cleanArchitecture:
        return 'Clean Architecture';
      case TechnicalStack.mvvm:
        return 'MVVM';
    }
  }
}
