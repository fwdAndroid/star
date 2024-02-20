import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/utils/colors.dart';
import 'package:uuid/uuid.dart';

class Skill {
  String name;
  double rating;

  Skill(this.name, this.rating);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rating': rating,
    };
  }
}

class AddLessons extends StatefulWidget {
  const AddLessons({super.key});

  @override
  State<AddLessons> createState() => _AddLessonsState();
}

class _AddLessonsState extends State<AddLessons> {
  List<Skill> skills = [];
  TextEditingController skillNameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  List<String> usernames = [];
  String selectedUsername = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsernames();
  }

  void fetchUsernames() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('pulip')
          .where("instructorUid",
              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      List<String> fetchedUsernames =
          querySnapshot.docs.map((doc) => doc['username'].toString()).toList();

      setState(() {
        usernames = fetchedUsernames;
        if (usernames.isNotEmpty) {
          selectedUsername =
              usernames[0]; // Set the initial value to the first item
        }
      });
    } catch (e) {
      print("Error fetching usernames: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        title: Text(
          'Skills',
          style: GoogleFonts.acme(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('Select Pulip Name'),
          DropdownButton(
            value: selectedUsername,
            items: usernames.map((username) {
              return DropdownMenuItem(
                value: username,
                child: Text(username),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedUsername = value as String;
              });
            },
          ),
          SizedBox(height: 20),
          Text('Selected Username: $selectedUsername'),
          TextField(
            controller: skillNameController,
            decoration: InputDecoration(labelText: 'Skill Name'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: ratingController,
            decoration: InputDecoration(labelText: 'Rate Your Skill'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              addSkill();
            },
            child: Text('Add Skill'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('${skills[index].name} - ${skills[index].rating}%'),
                  subtitle: LinearProgressIndicator(
                    value: skills[index].rating / 100,
                  ),
                );
              },
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (skillNameController.text.isEmpty ||
                        ratingController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("All fields are required")));
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      var uuid = Uuid().v4();
                      await FirebaseFirestore.instance
                          .collection("lessons")
                          .doc(uuid)
                          .set({
                        "skills": skills.map((skill) => skill.toMap()).toList(),
                        "pulipName": selectedUsername,
                        "uid": FirebaseAuth.instance.currentUser!.uid,
                        "uuid": uuid,
                      });
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save Pulip Skill'),
                ),
        ]),
      ),
    );
  }

  void addSkill() {
    String skillName = skillNameController.text;
    double rating = double.tryParse(ratingController.text) ?? 0.0;

    if (skillName.isNotEmpty) {
      setState(() {
        skills.add(Skill(skillName, rating));
        // skillNameController.clear();
        // ratingController.clear();
      });
    }
  }
}
