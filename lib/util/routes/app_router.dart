import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/signin/controller/signin_controller.dart';
import 'package:cloundry_care/util/routes/route_paths.dart';
import 'package:get/get.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePaths.signin,
          page: SigninView.page,
          initial: true,
        ),
        AutoRoute(
          path: RoutePaths.dashboard,
          page: DashboardView.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          path: RoutePaths.cleaners,
          page: CleanersView.page,
          guards: [AuthGuard()],
        ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  final SigninController controller = Get.put(SigninController());

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    var loginResponse = await controller.getCurrentUser();
    if (loginResponse?.userId == null &&
        !router.currentPath.contains('signin')) {
      router.replace(const SigninView());
    } else {
      resolver.next(true);
    }
  }
}
