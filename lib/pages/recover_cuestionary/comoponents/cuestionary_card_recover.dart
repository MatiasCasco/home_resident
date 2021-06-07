
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_recover_controller.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:home_resident/widget/image_question.dart';

import 'option_cuestionary_recover.dart';

class CuestionaryCardRecover extends StatelessWidget {
  const CuestionaryCardRecover({
    Key key,
    // it means we have to pass this
    @required this.question,
    @required this.page,
  }) : super(key: key);

  final QuestionCuestionary question;
  final int page;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenheigth = screenSize.height;
    //QuestionController _controller = Get.put(QuestionController());
    CuestionaryRecoverController _controller = Get.put(CuestionaryRecoverController());
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: screenWidth*3-padding.top-padding.bottom,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              //"https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg"
              ImageQuestion(image: question.image),
              Text(
                question.question.replaceAll("\"", ""),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: kBlackColor),
              ),
              SizedBox(height: kDefaultPadding / 2),
              ...List.generate(
                question.options.length,
                    (index) => OptionCuestionaryRecover(
                  index: index,
                  text: question.options[index].replaceAll("\"", ""),
                  page: page,
                  press: () => (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
