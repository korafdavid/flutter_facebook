// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:fbclone/post_widget.dart';
import 'package:fbclone/profile.dart';
import 'package:fbclone/responsive.dart';
import 'package:fbclone/status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: (Platform.isAndroid || Platform.isIOS) ? Colors.grey[300]: Colors.white,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          if (Platform.isIOS || Platform.isAndroid)
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/profile2.jpg'),
                        radius: 24,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.red[390],
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'What\'s On your mind, David'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (isLargeScreen(context))
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Status(
                    viewed: true,
                    userImage: 'assets/profile2.jpg',
                    mainImage: 'assets/profileImage.jpeg',
                  ),
                  Status(
                    viewed: true,
                    userImage: 'assets/giannis.jpg',
                    mainImage: 'assets/Mentor.png',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/image2.jpg',
                    mainImage: 'assets/Mentor.png',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/profile2.jpg',
                    mainImage: 'assets/giannis.jpg',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/Mentor.png',
                    mainImage: 'assets/profile2.jpg',
                  ),
                ],
              ),
              Align(
                  alignment: const Alignment(0.8, 1),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next)))
            ])
          else
            Container(
              color: Colors.white,
              height: 200,
              child: ListView(
                children:  [
                  InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StatusPage() )),
                    child: Status(
                      viewed: true,
                        userImage: 'assets/profile2.jpg',
                      mainImage: 'assets/profileImage.jpeg',
                    ),
                  ),
                  Status(
                    viewed: true,
                    userImage: 'assets/giannis.jpg',
                    mainImage: 'assets/Mentor.png',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/image2.jpg',
                    mainImage: 'assets/Mentor.png',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/profile2.jpg',
                    mainImage: 'assets/giannis.jpg',
                  ),
                  Status(
                    viewed: false,
                    userImage: 'assets/Mentor.png',
                    mainImage: 'assets/profile2.jpg',
                  ),
                ],
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            ),
          if (kIsWeb || Platform.isWindows)
            Container(
              margin: isLargeScreen(context)
                  ? EdgeInsets.symmetric(horizontal: 150, vertical: 8)
                  : EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/profile2.jpg'),
                          radius: 24,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.red[390],
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              hintText: 'What\'s On your mind, David'),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          hoverColor: Colors.white10,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(children: const [
                              Icon(
                                Icons.video_camera_front,
                                color: Colors.red,
                              ),
                              Text('Live Video')
                            ]),
                          )),
                      InkWell(
                          hoverColor: Colors.white10,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(children: const [
                              Icon(Icons.photo_library, color: Colors.green),
                              Text('Photo/Video')
                            ]),
                          )),
                      InkWell(
                          hoverColor: Colors.white10,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(children: const [
                              Icon(Icons.emoji_emotions, color: Colors.yellow),
                              Text('Feeling/Activity')
                            ]),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ListView(
              physics: RangeMaintainingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                PostWidget(
                  profileFunction: (() => Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()))),
                  profileImage: ClipOval(
                      child: Image.asset('assets/giannis.jpg', height: 50)),
                  image: Image.asset('assets/profile2.jpg', fit: BoxFit.fill),
                  date: '3h',
                  name: 'David Okoroafor',
                  username: 'koraf',
                  mainText: '''Give it up for Juan Toscano-Anderson. 🙌
Out of the rotation the last couple of games. Comes into the game, plays the entire 4th quarter, finishes with 7b points,… See more''',
                ),
                PostWidget(
                  profileFunction: (() => Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()))),
                  profileImage: ClipOval(
                      child: Image.asset('assets/giannis.jpg', height: 45)),
                  image: Image.asset('assets/image2.jpg', fit: BoxFit.cover),
                  date: '3h',
                  name: 'David Okoroafor',
                  username: 'koraf',
                  mainText: '''Give it up for Juan Toscano-Anderson. 🙌
Out of the rotation the last couple of games. Comes into the game, plays the entire 4th quarter, finishes with 7b points,… See more''',
                ),
                PostWidget(
                  profileFunction: (() => Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()))),
                  profileImage: ClipOval(
                      child: Image.asset('assets/giannis.jpg', height: 45)),
                  image: Image.asset('assets/giannis.jpg', fit: BoxFit.cover),
                  date: '3h',
                  name: 'David Okoroafor',
                  username: 'koraf',
                  mainText: '''Give it up for Juan Toscano-Anderson. 🙌
Out of the rotation the last couple of games. Comes into the game, plays the entire 4th quarter, finishes with 7b points,… See more''',
                ),
              ],
              shrinkWrap: true),
        ],
      ),
    );
  }
}

class Status extends StatelessWidget {
  final String mainImage;
  final String userImage;
  final bool viewed;
  const Status({
    Key? key,
    required this.mainImage,
    required this.userImage,
    required this.viewed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onDoubleTap: () => debugPrint('dfdfdf'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StatusPage())),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
            height: 170,
            width: 110,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(mainImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(14)),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(userImage)),
            border: Border.all(width: 4, color: viewed ? Colors.grey :Colors.blue),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
