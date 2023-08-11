// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:cloundry_care/app/modules/cleaners/views/cleaners_view.dart'
    as _i1;
import 'package:cloundry_care/app/modules/dashboard/views/dashboard_view.dart'
    as _i2;
import 'package:cloundry_care/app/modules/signin/views/signin_view.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CleanersView.name: (routeData) {
      final args = routeData.argsAs<CleanersViewArgs>(
          orElse: () => const CleanersViewArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CleanersView(key: args.key),
      );
    },
    DashboardView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardView(),
      );
    },
    SigninView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SigninView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CleanersView]
class CleanersView extends _i4.PageRouteInfo<CleanersViewArgs> {
  CleanersView({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CleanersView.name,
          args: CleanersViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CleanersView';

  static const _i4.PageInfo<CleanersViewArgs> page =
      _i4.PageInfo<CleanersViewArgs>(name);
}

class CleanersViewArgs {
  const CleanersViewArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'CleanersViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DashboardView]
class DashboardView extends _i4.PageRouteInfo<void> {
  const DashboardView({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardView.name,
          initialChildren: children,
        );

  static const String name = 'DashboardView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SigninView]
class SigninView extends _i4.PageRouteInfo<void> {
  const SigninView({List<_i4.PageRouteInfo>? children})
      : super(
          SigninView.name,
          initialChildren: children,
        );

  static const String name = 'SigninView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
