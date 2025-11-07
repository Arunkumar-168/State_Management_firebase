import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'First_Scroll_Page.dart';
import 'Model/Movie_List_Model.dart';
import 'Movie_Details_Page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Movies', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Tamil Movies'), Text('View All')],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const MovieDetailsPage());
                },
                child: MovieDrawer(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Trending Movies'), Text('Show All')],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      title: movies[index].title,
                      imageLink: movies[index].imageURL,
                      active: index == selectedIndex,
                      callBack: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('others Movies'), Text('Show All')],
              ),
              SizedBox(height: 5),
              OthersMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
