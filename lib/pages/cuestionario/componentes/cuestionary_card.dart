import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
//import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/utils/constants.dart';

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
    //QuestionController _controller = Get.put(QuestionController());
    CuestionaryController _controller = Get.put(CuestionaryController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
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
              text: question.options[index],
              page: page,
              press: () => _controller.checkAns(question, index, page),
            ),
          ),
        ],
      ),
    );
  }
}
