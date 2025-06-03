import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_avatar_plus/profile_avatar_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Avatar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Profile Avatar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// Basic Profile Avatar with Initials
              ProfileAvatar(
                firstName: "John",
                lastName: "Doe",
                radius: 100,
              ),
              SizedBox(height: 24),

              /// Profile Avatar with Image and No Edit Option
              ProfileAvatar(
                firstName: "John",
                lastName: "Doe",
                radius: 100,
                profileImageUrl:
                    "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
                isEditEnabled: false,
              ),
              SizedBox(height: 24),

              /// Profile Avatar with Image and Edit Option
              ProfileAvatar(
                firstName: "John",
                lastName: "Doe",
                radius: 100,
                profileImageUrl:
                    "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
                onChangeProfilePicture: () {
                  log("Profile picture changed");
                },
                isEditEnabled: true,
              ),
              SizedBox(height: 24),

              /// Profile Avatar with Custom Border
              ProfileAvatar(
                firstName: "John",
                lastName: "Doe",
                radius: 100,
                profileImageUrl:
                    "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
                borderWidth: 2,
                borderColor: Colors.red,
              ),
              SizedBox(height: 24),

              /// Profile Avatar with Custom Edit Icon
              ProfileAvatar(
                firstName: "John",
                lastName: "Doe",
                radius: 100,
                profileImageUrl:
                    "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
                onChangeProfilePicture: () {
                  log("Profile picture changed");
                },
                isEditEnabled: true,
                editIcon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
