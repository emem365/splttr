import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';

class SmallAvatarTile extends StatelessWidget {
  final String avatar;
  final String title;
  final String subtitle;
  final void Function() onTap;
  final List<Widget> actions;

  const SmallAvatarTile(
      {Key key,
      @required this.avatar,
      @required this.title,
      subtitle,
      this.onTap,
      this.actions})
      : this.subtitle = subtitle ?? '',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PurpleTheme.blue,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Avatars.getAssetFromName(avatar),
          ),
          title: Text(title),
          subtitle: Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: actions),
          onTap: onTap,
        ),
      ),
    );
  }
}
