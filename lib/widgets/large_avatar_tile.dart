import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/currency.dart';

class LargeAvatarTile extends StatelessWidget {
  final String tag;
  final String avatar;
  final String title;
  final String body;
  final String subtitle;
  final int amount;
  final void Function() onTap;
  final Color splashColor;
  final Color backgroundColor;

  const LargeAvatarTile({
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


  static String createBodyFromList(List<String> list){
     switch (list.length) {
      case 0:
        return '';
      case 1:
        return 'with ${list[0]}';
      case 2:
        return 'with ${list[0]} and ${list[1]}';
      case 3:
        return 'with ${list[0]}, ${list[1]} and ${list[2]}';
      default:
        return 'with ${list[0]}, ${list[1]} and ${list.length - 2} others';
    }
  }

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
                                  .subtitle1
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
                              style: Theme.of(context).textTheme.bodyText2,
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
                                  Theme.of(context).textTheme.subtitle2.copyWith(
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