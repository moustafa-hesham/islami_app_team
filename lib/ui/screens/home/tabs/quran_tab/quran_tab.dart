import 'package:flutter/material.dart';
import 'package:islami_sun_c9/model/details_screen_args.dart';
import 'package:islami_sun_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:islami_sun_c9/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranTabLogo)),
        Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        Text(
          "Sura name",
          style: AppTheme.quranTabTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        Divider(
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
                       arguments: DetailsScreenArgs(suraOrHadethName: Constants.suraNames[index],
                           fileName: "${index+1}.txt",
                           isQuranFile: true));
                    },
                    child: Text(
                      Constants.suraNames[index],
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
