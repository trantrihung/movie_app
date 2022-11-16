import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/route/app_route_name.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/feature/detail/presentation/widget/detail_info_widget.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text("Movie Detail",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(movie.assetsImage),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DetailInfoWidget(
                          iconData: Icons.video_call_rounded,
                          title: "Genre",
                          value: movie.type),
                      DetailInfoWidget(
                          iconData: Icons.access_time_filled_rounded,
                          title: "Duration",
                          value: movie.duration),
                      DetailInfoWidget(
                          iconData: Icons.stars_rounded,
                          title: "Rating",
                          value: movie.type),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(height: 32),
            Text(
              "Synopsis",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouteName.booking);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Text(
            "Booking Now",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
