import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/utils/api_service.dart';
import 'package:wajba/core/utils/dio_factory.dart';
import 'package:wajba/features/Account/presentation/view/widgets/refer_and_earn_view.dart';
import 'package:wajba/features/Authentication/presentations/views/login_view/login_view.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_location.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_notification.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/app_share.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/password_changed.dart';
import 'package:wajba/features/Authentication/presentations/views/signup_view/signup_view.dart';
import 'package:wajba/features/Home/data/repo/home_repo_imp.dart';
import 'package:wajba/features/Home/presentation/view/home_screen.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/viewall_categories_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_viewall.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/shortcuts_view.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import 'package:wajba/features/Order_Tracking/presentation/view/track_screen_view.dart';
import 'package:wajba/core/widgets/item_view.dart';
import 'package:wajba/features/Notification/presentation/view/notification_view.dart';
import 'package:wajba/features/OnBoarding/presentations/view/onboarding.dart';
import 'package:wajba/features/Profile/presentation/profile_view.dart';
import 'package:wajba/features/Search/presenatation/view/search_screen.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_view_body.dart';
import 'package:wajba/features/Wallet/presentation/view/wajbah_wallet_view.dart';
import 'features/Authentication/presentations/views/ResetPassword/reset_password.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) {
      return WajbahUser();
    },
  ));
}

class WajbahUser extends StatelessWidget {
  const WajbahUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TryThisTodayCubit(homeRepo: HomeRepoImpl(DioFactory.getDio()))
                ..getMeals(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Biryani"),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          "Onboarding": (context) => const OnBoardingScreen(),
          "login": (context) => const LoginView(),
          "register": (context) => const RegisterView(),
          "home": (context) => const HomeScreen(),
          "search": (context) => const SearchScreen(),
          "Allow notification": (context) => const AllowNotification(),
          "Allow location": (context) => const AllowLocation(),
          "Password changed": (context) => const PasswordChanged(),
          "App share": (context) => const ShareApp(),
          "reset password": (context) => const ResetPassword(),
          "shinning viewall": (context) => const ShinningAll(),
          "categories viewall": (context) => const CategoriesItemListView(),
          "Shortcuts View": (context) => const ShortcutsViewScreen(),
          "Profile View": (context) => const ProfileView(),
          "Refer and Earn": (context) => const ReferAndEarnView(),
          "Notification View": (context) => const NotificationView(
                notificaions: [],
              ),
          "Wajbah Wallet": (context) => const WajbahWalletView(),
          "Item View": (context) => ItemViewScreen(),
          "Track View": (context) => TrackScreenView(),
        },
      ),
    );
  }
}
