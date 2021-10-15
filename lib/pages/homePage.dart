import 'package:flutter/material.dart';
import 'package:movieapp/managers/movieManager.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/pages/addMoviePage.dart';
import 'package:movieapp/widgets/movieCard.dart';
import 'package:movieapp/widgets/roundedButtonWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          actions: [
            GestureDetector(
              onTap: () {
                UserManager().logout(context);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Text('Çıkış yap'),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.logout),
                ],
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Provider.of<MovieManager>(context, listen: false).notify();
            setState(() {});
            return;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                movieStream(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedMyButton(
                    text: "Film ekle",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddMoviePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget movieStream() {
    context.watch<MovieManager>().movies;
    return SizedBox(
      height: 550,
      child: ListView.builder(
        itemCount: MovieManager().movies.length,
        itemBuilder: (context, position) {
          return MovieCard(movie: MovieManager().movies[position]);
        },
      ),
    );
  }
}
