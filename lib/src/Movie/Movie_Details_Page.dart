import 'package:flutter/material.dart';

import 'Shape/Movie_Details_Shape.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final List<Map<String, dynamic>> movieCast = [
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/suriya-sivakumar-20190423095612-2747.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/disha-patani-20241118153929-35289.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/bobby-deol-4.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/anand-raj-20180907124227-31266.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/yogi-babu-20191205130221-35602.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/suriya-sivakumar-20190423095612-2747.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/disha-patani-20241118153929-35289.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/bobby-deol-4.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/anand-raj-20180907124227-31266.jpg',
    },
    {
      'image':
          'https://images.filmibeat.com/webp/192x258/img/popcorn/profile_photos/yogi-babu-20191205130221-35602.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Image.network(
                        'https://images.moneycontrol.com/static-mcnews/2024/07/20240702081931_kanguva.png?impolicy=website&width=770&height=431',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: Row(
                    children: [
                      ClipPath(
                        clipper: HexagonClipper(),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            'https://www.kerala9.com/wp-content/uploads/2024/10/kanguva-movie-images-hd-002-1002x1024.webp',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 100,
                  right: 10, // gives width automatically across screen
                  child: Text(
                    'Zeta, now in Goa, encounters Francis and starts following him. '
                    'After witnessing Colt kill a bounty target, Zeta seeks refuge with Angela '
                    'but is quickly retrieved by Francis. While travelling with Francis, Zeta suffers a seizure. '
                    'Francis takes Zeta to the hospital. He allows the child to stay with Colt and himself. '
                    'At Francis\'s home, he begins drawing tribal patterns on the walls, triggering mysterious '
                    'flashbacks from Francis\'s past life.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('cast'),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: movieCast.map((item) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      item['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
