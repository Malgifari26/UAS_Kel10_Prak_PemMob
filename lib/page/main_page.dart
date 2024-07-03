import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:absensi_flutter/services/auth.dart';
import 'package:absensi_flutter/page/absen/absen_page.dart';
import 'package:absensi_flutter/page/history/history_page.dart';
import 'package:absensi_flutter/page/leave/leave_page.dart';
import 'package:absensi_flutter/screens/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required int selectedPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    Future<bool> _showLogoutDialog(BuildContext context) async {
      return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text("Anda yakin ingin keluar dari aplikasi?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Ya"),
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 171, 64),
                  Colors.deepOrangeAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text('Main Page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 50,
                    70.0,
                    MediaQuery.of(context).size.width,
                    0.0,
                  ),
                  items: [
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: const [
                          Icon(Icons.logout, color: Colors.black),
                          SizedBox(width: 8),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ],
                ).then((value) async {
                  if (value == 'logout') {
                    bool? logout = await _showLogoutDialog(context);
                    if (logout == true) {
                      await _auth.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Tambahkan logika untuk tampilan notifikasi
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Tambahkan logika untuk tampilan pencarian
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/ic_absen.png',
                        text: 'Absen Kehadiran',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AbsenPage(),
                            ),
                          );
                        },
                      ),
                      MenuItem(
                        imagePath: 'assets/images/ic_leave.png',
                        text: 'Cuti / Izin',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeavePage(),
                            ),
                          );
                        },
                      ),
                      MenuItem(
                        imagePath: 'assets/images/ic_history.png',
                        text: 'Riwayat Absensi',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -50,
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pengumuman',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum arcu eu sapien tincidunt, vel suscipit ex pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum arcu eu sapien tincidunt, vel suscipit ex pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum arcu eu sapien tincidunt, vel suscipit ex pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum arcu eu sapien tincidunt, vel suscipit ex pharetra.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "INFO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              "Apa Anda ingin keluar dari aplikasi?",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text("Ya"),
              ),
            ],
          ),
        )) ??
        false;
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF36454F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
