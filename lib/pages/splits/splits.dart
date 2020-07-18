import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/app_screen_title_with_image_widget.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/splits/split_description.dart';
import 'package:splttr/widgets/large_avatar_tile.dart';
import 'package:splttr/widgets/two_button_row.dart';
import 'package:splttr/dataPages/user.dart';

class Splits extends StatefulWidget {
  @override
  _SplitsState createState() => _SplitsState();
}

class _SplitsState extends State<Splits> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List _splitsList = DummyData.splitsList;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _splitsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0)
          return AppScreenTitleWithImageWidget(
            imagePath: 'assets/images/outings.png',
            title: 'Splits',
            buttonRow: TwoButtonRow(
              buttonOneOnPressed: () {},
              buttonOneText: 'Add Group',
              buttonTwoOnPressed: () {},
              buttonTwoText: 'Add split',
            ),
            showEmptyListMessage: (_splitsList.length == 0),
            message: EmptyListEmoticonMessage(
              message:
                  'You have no splits :(\n\nGo ahead, add a split, share your expenses.',
              emotion: Emotion.sad,
            ),
          );

        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: LargeAvatarTile(
              tag: _splitsList[index]['tag'],
              avatar: _splitsList[index]['avatar'],
              title: _splitsList[index]['outing-name'],
              body: LargeAvatarTile.createBodyFromList(
                  _splitsList[index]['friends']),
              subtitle: _dateformat.format(_splitsList[index]['date']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SplitPage(
                      tag: _splitsList[index]['tag'],
                      name: _splitsList[index]['outing-name'],
                      avatar: _splitsList[index]['avatar'],
                    ),
                  ),
                );
              },
              backgroundColor: PurpleTheme.blue,
              splashColor: Theme.of(context).splashColor),
        );
      },
    );
  }
}
