// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    QrEditRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const QrEditPage());
    },
    ChangeColorRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeColorRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              ChangeColorPage(key: args.key, qrDesignType: args.qrDesignType));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'homePage', fullMatch: true),
        RouteConfig(HomeRoute.name, path: 'homePage'),
        RouteConfig(QrEditRoute.name, path: 'qrEditPage'),
        RouteConfig(ChangeColorRoute.name, path: 'changeColorPage')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'homePage');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [QrEditPage]
class QrEditRoute extends PageRouteInfo<void> {
  const QrEditRoute() : super(QrEditRoute.name, path: 'qrEditPage');

  static const String name = 'QrEditRoute';
}

/// generated route for
/// [ChangeColorPage]
class ChangeColorRoute extends PageRouteInfo<ChangeColorRouteArgs> {
  ChangeColorRoute({Key? key, required QrDesignType qrDesignType})
      : super(ChangeColorRoute.name,
            path: 'changeColorPage',
            args: ChangeColorRouteArgs(key: key, qrDesignType: qrDesignType));

  static const String name = 'ChangeColorRoute';
}

class ChangeColorRouteArgs {
  const ChangeColorRouteArgs({this.key, required this.qrDesignType});

  final Key? key;

  final QrDesignType qrDesignType;

  @override
  String toString() {
    return 'ChangeColorRouteArgs{key: $key, qrDesignType: $qrDesignType}';
  }
}
