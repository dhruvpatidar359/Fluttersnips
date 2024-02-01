import 'package:fluttersnips/models/card_model.dart';
import 'package:fluttersnips/widgets/wild_list/carousels/carousel_wild_list.dart';

const List<CardModel> carouselListW = [
  CardModel(
    'sarangabhavani1231@gmail.com',
    '''import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//Run this command on terminal - flutter pub add carousel_slider
//Run this command on terminal - flutter pub add smooth_page_indicator

class Carousel1 extends StatefulWidget {
  const Carousel1({super.key});

  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
  int activeIndex = 0;
  final images = [
    "assets/images/boat.jpg",
    "assets/images/sea.jpg",
    "assets/images/tree.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
              height: 400,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
        ),
        Positioned(
          left: 250,
          bottom: 10,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: images.length,
            effect: const WormEffect(
              dotWidth: 7,
              dotHeight: 7,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
''',
    'carousel',
    Carousel1(),
    'Carousel1',
  ),
  CardModel(
    'sarangabhavani1231@gmail.com',
    '''
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//Run this command on terminal - flutter pub add carousel_slider
//Run this command on terminal - flutter pub add smooth_page_indicator


List<Datamodel> dataList = [
  Datamodel("Serene Forest", "assets/images/forest.jpg"),
  Datamodel("A Floral Symphony", "assets/images/pink.jpg"),
  Datamodel("Graceful Butterflies", "assets/images/butterflies.jpg")
];

class Carousel2 extends StatefulWidget {
  const Carousel2({super.key});

  @override
  State<Carousel2> createState() => _Carousel2State();
}

class _Carousel2State extends State<Carousel2> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index, realIndex) {
        return Stack(
          children: [
            Image.asset(
              dataList[index].image,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Text(
                dataList[index].title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 32, 241, 220),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Positioned(
              left: 200,
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: dataList.length,
                effect: const WormEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: Color.fromARGB(255, 9, 9, 9),
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
       
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
    );
  }
}

''',
    'carousel',
    Carousel2(),
    'Carousel2',
  )
];
