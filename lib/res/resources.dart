import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/colors.dart';

class TabBarWithBackground extends StatelessWidget
    implements PreferredSizeWidget {
  final Color backgroundColor;
  final TabBar tabBar;

  TabBarWithBackground({this.tabBar, this.backgroundColor})
      : assert(tabBar != null);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        child: tabBar,
        color: backgroundColor,
      );
}

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

class Tile extends StatelessWidget {
  final String tag;
  final String avatar;
  final String title;
  final String body;
  final String subtitle;
  final int amount;
  final void Function() onTap;
  final Color splashColor;
  final Color backgroundColor;

  const Tile({
    Key key,
    this.tag,
    this.avatar,
    this.title = '',
    this.body = '',
    this.subtitle = '',
    this.backgroundColor,
    this.amount,
    this.onTap,
    this.splashColor,
  })  : assert((avatar == null) ? (tag == null) : (tag != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        splashColor: splashColor,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              (avatar != null)
                  ? Hero(
                      tag: tag,
                      child: CircleAvatar(
                        child: Avatars.getAssetFromName(avatar),
                        radius: MediaQuery.of(context).size.width / 8,
                      ),
                    )
                  : null,
              SizedBox(
                width: (amount == null)
                    ? MediaQuery.of(context).size.width / 2
                    : (avatar == null)
                        ? MediaQuery.of(context).size.width / 1.5
                        : MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (title != '')
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                    fontSize: (avatar == null) ? 18.0 : 16.0,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : null,
                    (body != '')
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              body,
                              style: Theme.of(context).textTheme.body1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : null,
                    (subtitle != '')
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              subtitle,
                              style:
                                  Theme.of(context).textTheme.subtitle.copyWith(
                                        color: Colors.black54,
                                      ),
                            ),
                          )
                        : null,
                  ].where((test) => test != null).toList(),
                ),
              ),
              amount != null
                  ? Expanded(
                      child: Text(
                        '${Currency.currencyFormat.format(amount).replaceAll(".00", "")}',
                        style: TextStyle(
                          color: amount > 0
                              ? Currency.profitColor
                              : Currency.lossColor,
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    )
                  : null,
            ].where((test) => test != null).toList(),
          ),
        ),
      ),
    );
  }
}
