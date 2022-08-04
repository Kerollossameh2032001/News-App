import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../modules/details/details_screen.dart';

Widget buildItem(list, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
    child: InkWell(
      onTap: () {
        navigateTo(
            context,
            DetailsScreen(
              imageUrl: list['urlToImage'] == null
                  ? 'assets/images/unloaded.png'
                  : list['urlToImage'],
              title: list['title'],
              date: list['publishedAt'],
              describtion: list['description'],
              content: list['content'],
              url: list['url'],
            ));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 110,
            color: Theme.of(context).backgroundColor,
          ),
          Positioned(
            left: -10,
            bottom: 25,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: list['urlToImage'] != null
                    ? DecorationImage(
                        image: NetworkImage("${list['urlToImage']}"),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage("assets/images/unloaded.png"),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 10,
            child: Container(
              width: 200,
              height: 200,
              child: Text(
                "${list['title']}",
                style: Theme.of(context).textTheme.headline6,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            left: 5,
            top: 110,
            child: Text(
              '${list['publishedAt']}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> extractImages(List<dynamic> list, List<Widget> slides) {
  list.forEach((element) {
    if (element['urlToImage'] != null) {
      slides.add(Stack(
        children: [
          Image(
            image: NetworkImage(element['urlToImage']),
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            left: 50,
            top: 80,
            child: Container(
              width: 200,
              height: 200,
              child: Text(
                element['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              element['publishedAt'],
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ));
    } else {
      slides.add(const Image(image: AssetImage('assets/images/unloaded.png')));
    }
  });
  return slides;
}

CarouselSlider buildCarouselSlider(List<Widget> images, carouselController) {
  return CarouselSlider(
    carouselController: carouselController,
    options: CarouselOptions(
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      initialPage: 0,
      enableInfiniteScroll: true,
    ),
    items: images,
  );
}

Widget integrateScreen(List<dynamic> list, List<Widget> images,
    BuildContext context, carouselController) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCarouselSlider(extractImages(list, images), carouselController),
        SizedBox(height: 30.0),
        Text(
          "Latest news",
          style: Theme.of(context).textTheme.headline4!.copyWith(
             // color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => buildItem(list[index], context),
            separatorBuilder: (context, index) => SizedBox(
              height: 5.0,
            ),
            itemCount: list.length,
          ),
        )
      ],
    ),
  );
}

void navigateTo(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
