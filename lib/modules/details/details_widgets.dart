import 'package:flutter/material.dart';
import '../../shared/componants/style.dart';

AppBar detailsCustomAppBar(BuildContext context, imageUrl, date) {
  return AppBar(
    elevation: 12,
    automaticallyImplyLeading: false,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    )),
    toolbarHeight: 250,
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('$imageUrl'), fit: BoxFit.fill),
            ),
          ),
          Positioned(
              top: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: 250,
            left: 30,
            child: Text(
              "$date",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey[50]),
            ),
          ),
        ],
      ),
    ),
  );
}

Directionality buildTitle(String? title,context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      width: 300,
      height: 150,
      child: Row(
        children: [
          VerticalDivider(
            color: defaultColor,
            thickness: 5,
          ),
          Expanded(
            child: Text(
              "${title}",
              style: Theme.of(context).textTheme.headline6,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

Directionality buildBody(BuildContext context, String? body) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        '$body',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ),
  );
}
