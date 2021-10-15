import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/managers/movieManager.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/models/category.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/user.dart';
import 'package:movieapp/widgets/roundedButtonWidget.dart';
import 'package:movieapp/widgets/roundedInputField.dart';

class AddMoviePage extends StatelessWidget {
  AddMoviePage({Key key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
   Category selectedCategory;
  @override
  Widget build(BuildContext context) {
    print(MovieManager().categories.length);
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
                  hint: "Kategoriler",
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
                  MovieManager().addMovie(userId: UserManager().user.id,
                      category: selectedCategory,
                      name: nameController.text,
                      context: context);
                }
            ),

          ],
        ),
      ),
    );
  }
}
