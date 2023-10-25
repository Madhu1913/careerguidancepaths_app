import 'dart:io';
import 'package:careerguidancepaths_app/app/account/AddpathPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
    required this.age,
    required this.name,
    required this.occupationOfPerson,
  });
  final name;
  final age;
  final occupationOfPerson;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    '@UserName',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, bottom: 30),
              child: Row(
                children: [
                  profilePic(),
                  Column(
                    children: [
                      Text(
                        'Name: ${widget.name}',
                        style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Age: ${widget.age}',
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${widget.occupationOfPerson}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Favourites',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Text(
                    'Add Path',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: const Text(
                    'Your Paths',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const addPathPage()));
            }, icon: const Icon(Icons.add_circle,size: 80,color: Colors.red,))
          ],
      ),
    );
  }

  Widget profilePic() {
    return GestureDetector(
        onTap: () {
          _openImagePicker();
        },
        child: CircleAvatar(
            radius: 100,
            child: ClipOval(
                child: AspectRatio(
              aspectRatio: 1,
              child: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                      fit: BoxFit.cover,
                    ),
            ))));
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }
}
