import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/currency.dart';

class Tile extends StatelessWidget {
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
    this.avatar = '',
    this.title = '',
    this.body = '',
    this.subtitle = '',
    this.backgroundColor,
    this.amount,
    this.onTap,
    this.splashColor,
  }) : super(key: key);

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
              CircleAvatar(
                child: Avatars.getAssetFromName(avatar),
                radius: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(
                width: (amount == null)
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: (amount == null) ? 16.0 : 8.0, bottom: 4.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 16.0,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (amount == null) ? 16.0 : 8.0, bottom: 4.0),
                      child: Text(
                        body,
                        style: Theme.of(context).textTheme.body1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (amount == null) ? 16.0 : 8.0, bottom: 4.0),
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                              color: Colors.black54,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              amount != null
                  ? Expanded(
                      child: Text(
                        '${amount > 0 ? '+' : ''}${Currency.currencyFormat.format(amount).replaceAll(".00", "")}',
                        style: TextStyle(
                          color: amount > 0
                              ? Currency.profitColor
                              : Currency.lossColor,
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
