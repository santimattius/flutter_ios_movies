import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_movies/home/upcoming/shared/presentation/up_coming_ui_model.dart';

class UpComingItem extends StatelessWidget {
  final UpComingModel model;
  final Function onTap;

  const UpComingItem({Key? key, required this.model, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          child: Row(
            children: [
              Container(
                height: 200,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${model.image}",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            model.title,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8.0)),
                          Text(
                            model.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 16.0)),
                          Text(
                              "${model.releaseDate == "" ? "" : "Date: ${model.releaseDate}"}"),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
