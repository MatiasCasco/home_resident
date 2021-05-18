import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
//import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:home_resident/widget/image_question.dart';

import 'option_cuestionary.dart';
//import 'package:quiz_app/controllers/question_controller.dart';
//import 'package:quiz_app/models/Questions.dart';

//import '../../../constants.dart';
//import 'option.dart';

class CuestionaryCard extends StatelessWidget {
  const CuestionaryCard({
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
    CuestionaryController _controller = Get.put(CuestionaryController());
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: screenWidth*2-padding.top-padding.bottom,
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
                    (index) => OptionCuestionary(
                  index: index,
                  text: question.options[index].replaceAll("\"", ""),
                  page: page,
                  press: () => _controller.isAnsweredCorrect ? null : _controller.markAns(question, index, page),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
