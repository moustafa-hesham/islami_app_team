import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c9/model/details_screen_args.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String fileContent = "";
  int ayaCount = 0;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContent.isEmpty){
      readFile();
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.backgorund), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(arguments.suraOrHadethName, style: AppTheme.appBarTitleTextStyle,),
        ),
        body: fileContent.isEmpty ? const Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(fileContent,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 24, color: AppColors.accent),),
          ),
        ),
      ),
    );
  }

  void readFile() async {
   String file = await rootBundle.loadString(arguments.isQuranFile ?
   "assets/files/quran/${arguments.fileName}":"assets/files/ahadeth/${arguments.fileName}" );
   fileContent = file;
   List<String> fileLines = file.split("\n");
   for(int i = 0; i< fileLines.length ;i++){
      fileLines[i] += arguments.isQuranFile ? "(${i+1})": " ";
   }
   fileContent = fileLines.join();
   setState(() {});
  }
}
