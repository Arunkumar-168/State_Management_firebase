import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Movie_Details_Page.dart';

final List<Map<String, dynamic>> movieScroll = [
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsq1Fk7U7daINaTZQdEUu0GqUgKTfqvwyg_w&s',
  },
  {
    'image':
    'https://mir-s3-cdn-cf.behance.net/projects/404/ffcc1e237252055.Y3JvcCwyMTc1LDE3MDEsMCw3ODA.png',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk-z0zZzPL4Um2ojK9zDUeUBXjWdUj_eamgg&s',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfKKqfsjQlAfVHJjm5phSSqhuqoOZOPSw8XA&s',
  },
  {
    'image':
    'https://pbs.twimg.com/media/FIwDVgdVcAIhgUF?format=jpg&name=large',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-N_9Zskg0s9ZcQ2LQwdB04X4GoeKdzkHDU509svpuI40n0D1Adh0kVpnfzmp1cght6po&usqp=CAU',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsq1Fk7U7daINaTZQdEUu0GqUgKTfqvwyg_w&s',
  },
  {
    'image':
    'https://mir-s3-cdn-cf.behance.net/projects/404/ffcc1e237252055.Y3JvcCwyMTc1LDE3MDEsMCw3ODA.png',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk-z0zZzPL4Um2ojK9zDUeUBXjWdUj_eamgg&s',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfKKqfsjQlAfVHJjm5phSSqhuqoOZOPSw8XA&s',
  },
  {
    'image':
    'https://pbs.twimg.com/media/FIwDVgdVcAIhgUF?format=jpg&name=large',
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-N_9Zskg0s9ZcQ2LQwdB04X4GoeKdzkHDU509svpuI40n0D1Adh0kVpnfzmp1cght6po&usqp=CAU',
  },
];


final List<Map<String, dynamic>> othersMovie = [
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQEe-_w9BeGgoNz-C8d8_90eu7rhw9SytyBK9hSHpLJ_qYyZxjL31i6ChzB0TWSjWrWMQ&usqp=CAU'
  },
  {
    'image': 'https://www.wallsnapy.com/img_gallery/kanguva-surya-hd-images-4k-8036767.jpg'
  },
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXp65XbeTP7hS6j8bpptaVuvtHpQW1n456rBwlwPR_sztRs-rgmwXHgaWpqhTmvHN5vA&usqp=CAU'
  },
  {
    'image': 'https://iansportalimages.s3.amazonaws.com/ianslive_watermark/202505033394712.jpg'
  },
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQEe-_w9BeGgoNz-C8d8_90eu7rhw9SytyBK9hSHpLJ_qYyZxjL31i6ChzB0TWSjWrWMQ&usqp=CAU'
  },
  {
    'image': 'https://www.wallsnapy.com/img_gallery/kanguva-surya-hd-images-4k-8036767.jpg'
  },
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXp65XbeTP7hS6j8bpptaVuvtHpQW1n456rBwlwPR_sztRs-rgmwXHgaWpqhTmvHN5vA&usqp=CAU'
  },
  {
    'image': 'https://iansportalimages.s3.amazonaws.com/ianslive_watermark/202505033394712.jpg'
  }
];

class MovieDrawer extends StatelessWidget {
  const MovieDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: movieScroll.map((item) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            clipBehavior: Clip.hardEdge,
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
    );
  }
}


class MovieCard extends StatelessWidget {
  final String imageLink;
  final String title;
  final Function callBack;
  final bool active;

  const MovieCard({
    Key? key,
    required this.title,
    required this.imageLink,
    required this.callBack,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
            onTap: callBack as void Function()?,
            child: SizedBox(
              width: active
                  ? MediaQuery
                  .of(context)
                  .size
                  .width / 3
                  : MediaQuery
                  .of(context)
                  .size
                  .width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(imageLink),
              ),
            ),
          ),
        ),
        Text(
          active ? title : '',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}


class OthersMovie extends StatelessWidget {
  const OthersMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: othersMovie.map((item) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          clipBehavior: Clip.hardEdge,
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
    );
  }
}


