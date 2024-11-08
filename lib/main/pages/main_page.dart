import 'package:copyparrot/friend/pages/friend_page.dart';
import 'package:copyparrot/home/pages/home_page.dart';
import 'package:copyparrot/main/providers/main_viewmodel.dart';
import 'package:copyparrot/main/widgets/main_bottom_navbar.dart';
import 'package:copyparrot/record/pages/record_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ref.read(mainOnboardingViewmodelProvider));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodies = [HomePage(), RecordPage()];
    return Scaffold(
      body: bodies[ref.watch(mainIndexViewmodelProvider)],
      bottomNavigationBar: MainBottomNavbar(),
    );
  }
}
