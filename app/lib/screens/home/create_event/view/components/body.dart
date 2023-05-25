import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/database/user_realm.dart';
import 'package:switchit/network/network_storage_controller.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/create_event/view/components/post_card.dart';
import 'package:realm/realm.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(DatabaseRealm().getUserDocIds()).collection('events').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          },
        ),
    );
  }
}

//Create event posts
class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController captionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File? image;



  Future<void> selectImage() async {
    final imagepicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(imagepicked != null) {
      setState(() {
        image = File(imagepicked.path);
      });
    }
  }

  Container buildSplashScreen() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/upload_wallpaper2.jpg'),
            fit: BoxFit.cover,
          )
      ),
      child: ElevatedButton(
        onPressed: () => selectImage(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),),),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)) {
              return Colors.indigo;
            }
            return Colors.grey[350];
          }
          ),
        ),
        child: const Text("Upload Image",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  void clearImage() {
    setState(() {
      image = null;
    });
  }

  void handleSubmit() async {
    String mediaUrl = await NetworkStorageController().uploadPhoto(image!.path);
    bool event = await NetworkFirestoreController().addEventCurrentUserToCloud(
        captionController.text,
        dateController.text,
        locationController.text,
        mediaUrl);
    captionController.clear();
    dateController.clear();
    locationController.clear();
    setState(() {
      image = null;
    });
  }
  Scaffold buildUploadForm(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: clearImage,
        ),
        title: Text('Caption Post',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () => handleSubmit(),
              child: Text('Post',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(
                  hintText: "Write a description of the event...",
                ),
              )
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit_calendar, color: Colors.orangeAccent, size: 40.0),
            title: Container(
                width: 250.0,
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: "Write the date of the event...",
                  ),
                )
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pin_drop, color: Colors.blueAccent, size: 40.0),
            title: Container(
                width: 250.0,
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText: "Write the address of the event",
                  ),
                )
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return image == null ?  buildSplashScreen() : buildUploadForm();
  }
}
