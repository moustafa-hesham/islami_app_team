import 'package:flutter/material.dart';
import 'package:islami_sun_c9/model/details_screen_args.dart';
import 'package:islami_sun_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:islami_sun_c9/ui/utils/constants.dart';

class AhadethTab extends StatelessWidget {
  List<String> ahadethNames = List.generate(50, (index) {
    return "${index+1}الحديث رقم ";
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.ahadehtTabLogo)),
        const Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        const Text(
          "Hadeth name",
          style: AppTheme.quranTabTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(suraOrHadethName: ahadethNames[index],
                              fileName: "h${index+1}.txt",
                              isQuranFile: false));
                    },
                    child: Text(
                      ahadethNames[index],
                      textAlign: TextAlign.center,
                      style: AppTheme.quranTabTitleTextStyle
                          .copyWith(fontWeight: FontWeight.normal),
                    ));
              }),
        )
      ],
    );
  }
}
