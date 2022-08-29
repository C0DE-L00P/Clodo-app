import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbumCard extends StatelessWidget {
  final String? title;
  Color titleColor = Colors.white;
  Color subTitleColor = Colors.grey;
  String? img,
      latestUpdate;
  int? imgCount, vidCount;

  AlbumCard({
    Key? key,
    required this.title,
    required this.titleColor,
    this.img,
    this.latestUpdate,
    this.imgCount,
    this.vidCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black38,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 160,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              image: AssetImage(
                img ?? 'assets/images/album_placeholder.jpg',
              ),
              placeholder:
                  const AssetImage('assets/images/album_placeholder.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title!,
                      style: TextStyle(color: titleColor, fontSize: 22)),
                  Text(
                    '${imgCount ?? 0} images ${vidCount != null ? "& $vidCount videos" : ""}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                latestUpdate != null ? "Last Update $latestUpdate" : '',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
             Positioned.fill(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      onTap: () => print('object'),
                    ))),
          ],
        ),
      ),
    );
  }
}
