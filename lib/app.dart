import 'package:boring_template/pages/commissions/commissions_page.dart';
import 'package:boring_template/pages/example_page_1/employees_page.dart';
import 'package:boring_template/template_widgets/boring_drawer_header.dart';
import 'package:boring_template/template_widgets/boring_footer_drawer.dart';
import 'package:boring_template/template_widgets/boring_theme.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:boring_ui/drawer/app_bar_content.dart';
import 'package:boring_ui/drawer/section_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';

import 'pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BoringApp(
      initialLocation: '/login',
      rootNavigator: globalKey,
      themeConfig: BoringTheme.boringThemeConfig(context),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      refreshListenable: EnterpriseLayer.auth.listenable,
      boringNavigation: BoringNavigationDrawer<AppBarContent>(
        drawerStyle: BoringTheme.drawerStyle,
        tileStyle: BoringTheme.drawerTileStyle,
        drawerHeaderBuilder: (context) => const BoringDrawerHeader(),
        drawerFooterBuilder: (context) => BoringDrawerFooter(),
        appBarBuilder: _appBarBuilder,
        appBarNotifier: appBarNotifier,
      ),
      redirect: _redirect,
      pages: _pages,
    );
  }

  List<BoringPage> get _pages => [
        LoginPage(),
        EmployeesPage(),
        CommissionsPage(),
        BoringPageWidget(
          navigationEntry: BoringNavigationEntry('/test', label: 'test'),
          builder: (context, state) => Text('123'),
        )
      ];

  AppBar? _appBarBuilder(
    BuildContext context,
    GoRouterState state,
    List<BoringNavigationGroupWithSelection> navGroups,
    ValueNotifier<AppBarContent>? appBarNotifier,
  ) {
    if (state.path == '/login') {
      return null;
    }

    return SectionAppBar2.buildProjectAppBar(
      context,
      state,
      navGroups,
      appBarNotifier!.value,
    );
  }

  Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    appBarNotifier.reset();
    if (await EnterpriseLayer.auth.isAuthorized()) {
      if (state.fullPath == '/login') {
        return EmployeesPage.path;
      }
      return null;
    } else {
      return '/login';
    }
  }
}
