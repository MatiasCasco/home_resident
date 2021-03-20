import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/utils/constants.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  // estamos pasando como parametro el objeto pregunta
  const QuestionCard({
    Key key,@required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                .copyWith(color: kBlackColor,),
          ),
          SizedBox(height: kDefaultPadding,),
          Option(),
          Option(),
          Option(),
          Option(),
        ],
      ),
    );
  }
}