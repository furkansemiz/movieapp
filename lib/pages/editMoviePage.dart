import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/managers/movieManager.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/models/category.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/roundedButtonWidget.dart';

class EditMoviePage extends StatelessWidget {
  Movie movie;
  EditMoviePage({Key key,this.movie}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  Category selectedCategory;

  @override
  Widget build(BuildContext context) {
    nameController.text = movie.name;
    selectedCategory = movie.category;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                child: DropdownSearch<Category>(
                  dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )
                      )
                  ),
                  mode: Mode.BOTTOM_SHEET,
                  items: MovieManager().categories,
                  hint: "Categories",
                  selectedItem: movie.category,
                  showSearchBox: true,
                  isFilteredOnline: true,
                  showClearButton: true,
                  onFind: (String filter) => MovieManager().searchCategory(filter),
                  itemAsString: (Category u) => u.toString(),
                  onChanged: (Category  data) => selectedCategory= data,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Ad',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                ),
              ),
            ),
            RoundedMyButton(

              text: 'Film ekle',
              press: () {
                MovieManager().editMovie(Movie(id: movie.id,name: nameController.text,category: selectedCategory,userId: movie.userId),context);
              },
            ),
          ],


        ),
      ),
    );
  }
}
