import 'package:flutter/material.dart';

import '../constant/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyHomePageState();
}

List storyList = [
  {
    "name": "Anusha",
    "isOnline": true,
    "hasStory": true,
    "imageUrl": "images/img1.jpg",
  },
  {
    "name": "Bishnu",
    "imageUrl": "images/img2.jpg",
    "isOnline": false,
    "hasStory": false,
  },
  {
    "name": "Ashish",
    "imageUrl": "images/img3.jpg",
    "isOnline": true,
    "hasStory": false,
  },
  {
    "name": "Samikshya",
    "imageUrl": "images/img4.jpg",
    "isOnline": true,
    "hasStory": true,
  },
  {
    "name": "Punam",
    "imageUrl": "images/img2.jpg",
    "isOnline": false,
    "hasStory": false,
  },
];

class _MyHomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        backgroundColor: tdWhite,
        title: TextButton(
          onPressed: () {},
          child: const Text(
            "Instagram",
            style: TextStyle(color: tdBlack, fontSize: 20),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: tdBlack,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.messenger_outline,
              color: tdBlack,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(
            children: [
              Column(
                children: [
                  _stories(),
                  _body(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: tdBlack,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

_stories() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 30.0, // Change the radius as needed
                backgroundImage:
                    AssetImage('images/img1.jpg'), // Replace with your image
              ),
              // Add Icon
              Icon(
                Icons.add,
                color: Colors.black,
                size: 30.0,
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 75,
                child: Align(
                    child: Text(
                  'Your Story',
                  overflow: TextOverflow.ellipsis,
                )),
              )
            ],
          ),
        ),
        Row(
            children: List.generate(storyList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      storyList[index]['hasStory']
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: tdBlue, width: 3)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              storyList[index]['imageUrl']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            )
                          : Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          storyList[index]['imageUrl']),
                                      fit: BoxFit.cover)),
                            ),
                      storyList[index]['hasStory']
                          ? Positioned(
                              top: 38,
                              left: 42,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: tdGreen,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: tdWhite, width: 3)),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    storyList[index]['name'],
                    overflow: TextOverflow.ellipsis,
                  )),
                )
              ],
            ),
          );
        }))
      ],
    ),
  );
}

_body() {
  return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
      child: Column(children: [
        Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/img4.jpg'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Bishnu_Sharma",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          child: Text('Save to Device'),
                          value: 'Unfollow',
                        ),
                        const PopupMenuItem(
                          child: Text('Save'),
                          value: 'Save',
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset(
                'images/img4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_bank_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.near_me_outlined),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  "Liked by",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Bishnu",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "and",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "others",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Row(
              children: [
                Text("Hello world"),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/img2.jpg'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Anu_sha987",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 86,
                  ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          child: Text('Save To Device'),
                          value: 'Svae',
                        ),
                        const PopupMenuItem(
                          child: Text('Ingore this Id'),
                          value: 'Ingore',
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset(
                'images/img2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_bank_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.near_me_outlined),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  "Liked by",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Ashish",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "and",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "others",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Row(
              children: [
                Text("Hello World"),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/img3.jpg'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Ashish_Acharya",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 86,
                  ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          child: Text('Save To Device'),
                          value: 'Svae',
                        ),
                        const PopupMenuItem(
                          child: Text('Ingore this Id'),
                          value: 'Ingore',
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset(
                'images/img3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_bank_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.near_me_outlined),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  "Liked by",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Anusha",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "and",
                  style: TextStyle(color: tdBlack),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "others",
                  style: TextStyle(color: tdBlack, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Row(
              children: [
                Text("Hello World"),
              ],
            ),
          ],
        ),
      ]));
}
