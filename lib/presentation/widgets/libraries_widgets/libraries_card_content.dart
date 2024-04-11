import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LibrariesCardContet extends StatelessWidget {
  const LibrariesCardContet({super.key, required this.library});

  final Library library;

  @override
  Widget build(BuildContext context) {
    bool position = MediaQuery.of(context).orientation == Orientation.portrait;
    double screenWidth = MediaQuery.of(context).size.width;
    double remainigWidth = position ? screenWidth * 0.25 : screenWidth * 0.3;
    double versionWidth = screenWidth * 0.026;
    double nameWidth = screenWidth * 0.06;
    List<String> keywords = [];
    String keywordsString = '';

    /*
        for(int i=0; i < library.keywords!.length; i++){
            keywordsText.add(library.keywords![i]);
            keywordsString= keywordsText.join(',');

            if(keywordsString.length >screenWidth* 0.030){
              keywordsText.removeLast();
              keywordsString=keywordsText.join(',');
              break;
            }

        }*/

    for (String keyword in library.keywords!) {
      TextPainter textPainter = TextPainter(
        text: TextSpan(text: keyword),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      double keywordWidth = textPainter.width + 8.0;

      if (keywordWidth <= remainigWidth) {
        keywords.add(keyword);
        remainigWidth -= keywordWidth;
      } else {
        break;
      }
    }

    keywordsString = keywords.join(',');
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  library.name!.length > nameWidth
                      ? '${library.name!.substring(0, nameWidth.toInt())}...'
                      : library.name!,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/Conversion_path.png', // Putanja do vaše PNG ikone
                            width:
                                24, // Opciono: Možete postaviti širinu i visinu ikone
                            height: 24,
                          ),
                          Container(
                            width: screenWidth * 0.25,
                            child: Text(
                              library.latestReleaseNumber != null
                                  ? (library.latestReleaseNumber!.length >
                                          versionWidth
                                      ? '${library.latestReleaseNumber!.substring(0, versionWidth.toInt())}...'
                                      : library.latestReleaseNumber.toString())
                                  : '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            keywordsString == ''
                                ? SizedBox()
                                : Icon(MdiIcons.tag,
                                    color: textColor,
                                    size: position
                                        ? screenWidth * 0.05
                                        : screenWidth * 0.03),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Container(
                              width: position
                                  ? screenWidth * 0.25
                                  : screenWidth * 0.5,
                              child: Text(
                                keywordsString,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
          // SizedBox(width:  position ? screenWidth * 0.05 : screenWidth * 0.2),
          /* Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                   //  SizedBox(width: screenWidth* 0.02,),
                     Align(
                      alignment: Alignment.topRight,
                      child: Icon(MdiIcons.heartOutline,size: 30,)
                      ),
                    ],
                 ) */
        ],
      ),
    );
  }
}
