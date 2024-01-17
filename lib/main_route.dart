import 'package:boring_template/views/example_view/example_view_page.dart';
import 'package:boring_template/views/login/login_page.dart';
import 'package:boring_template/widgets/bottom_drawer.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:boring_ui/drawer/app_bar_content.dart';
import 'package:boring_ui/drawer/section_app_bar_2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BoringApp(
      initialLocation: '/login',
      rootNavigator: globalKey,
      themeConfig: BoringThemeConfig(
        theme: buildTheme(context),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      refreshListenable: EnterpriseLayer.auth.listenable,
      boringNavigation: BoringNavigationDrawer<AppBarContent>(
        drawerStyle: drawerStyle(),
        tileStyle: BoringDrawerTileStyle(
          selectedColor: mainColor.withAlpha(20),
          unSelectedTextColor: dialogTitleColor,
          selectedTextColor: mainColor,
        ),
        drawerHeaderBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: Text("YOUR LOGO HERE"),
          );
        },
        drawerFooterBuilder: (context) => const BottomDrawer(),
        appBarBuilder: (context, state, navGroups, appBarNotifier) {
          if (state.path == '/login') {
            return null;
          }
          return SectionAppBar2.buildProjectAppBar(
            context,
            state,
            navGroups,
            appBarNotifier!.value,
          );
        },
        appBarNotifier: appBarNotifier,
      ),
      redirect: (context, state) async {
        appBarNotifier.reset();
        if (await EnterpriseLayer.auth.isAuthorized()) {
          if (state.fullPath == '/login') {
            return ExampleViewPage.path;
          }
          return null;
        } else {
          return '/login';
        }
      },
      pages: [
        LoginPage(),
        ExampleViewPage(),
      ],
    );
  }
}
