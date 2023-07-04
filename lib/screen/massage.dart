import 'package:flutter/material.dart';

class Profile {
  String id;
  String name;
  String email;

  Profile({required this.id, required this.name, required this.email});
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Profile> profiles = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Memuat data profil dari penyimpanan atau sumber data lainnya
    loadProfiles();
  }

  void loadProfiles() {
    // Simulasikan memuat profil dari penyimpanan atau sumber data lainnya
    profiles = [];
  }

  void addProfile() {
    String name = nameController.text;
    String email = emailController.text;

    // Validasi nama dan email
    if (name.isNotEmpty && email.isNotEmpty) {
      // Generate ID baru untuk profil
      String id = DateTime.now().millisecondsSinceEpoch.toString();

      // Buat objek profil baru
      Profile newProfile = Profile(id: id, name: name, email: email);

      // Simpan profil ke penyimpanan atau sumber data lainnya
      profiles.add(newProfile);

      // Reset input field
      nameController.clear();
      emailController.clear();

      // Perbarui tampilan halaman dengan daftar profil yang diperbarui
      setState(() {});

      // Tampilkan snackbar atau notifikasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Catatan berhasil ditambahkan')),
      );
    }
  }

  void deleteProfile(Profile profile) {
    // Hapus profil dari penyimpanan atau sumber data lainnya
    profiles.remove(profile);

    // Perbarui tampilan halaman dengan daftar profil yang diperbarui
    setState(() {});

    // Tampilkan snackbar atau notifikasi sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Catatan berhasil dihapus')),
    );
  }

  void updateProfile(Profile profile, String newName, String newEmail) {
    // Cari indeks profil yang akan diperbarui
    int profileIndex = profiles.indexOf(profile);

    // Validasi indeks
    if (profileIndex != -1) {
      // Perbarui nama dan email profil
      profiles[profileIndex].name = newName;
      profiles[profileIndex].email = newEmail;

      // Perbarui tampilan halaman dengan daftar profil yang diperbarui
      setState(() {});

      // Tampilkan snackbar atau notifikasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Catatan berhasil diperbarui')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Catatan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daftar Catatan:'),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  Profile profile = profiles[index];
                  return ListTile(
                    title: Text(profile.name),
                    subtitle: Text(profile.email),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteProfile(profile),
                    ),
                    onTap: () => _editProfileDialog(profile),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Tambah Catatan:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Isi'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: addProfile,
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfileDialog(Profile profile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController newNameController =
            TextEditingController(text: profile.name);
        TextEditingController newEmailController =
            TextEditingController(text: profile.email);

        return AlertDialog(
          title: Text('Edit Catatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newNameController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: newEmailController,
                decoration: InputDecoration(labelText: 'Isi'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                String newName = newNameController.text;
                String newEmail = newEmailController.text;
                updateProfile(profile, newName, newEmail);
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'CRUD Profil',
    home: Builder(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Halaman Catatan')),
        body: ProfilePage(),
      );
    }),
  ));
}
