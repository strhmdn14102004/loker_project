import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satset/module/home/home_bloc.dart';
import 'package:satset/module/home/home_state.dart';
import 'package:satset/module/infodevice.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satset/module/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  bool showPassword = false; // to track password visibility

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoadLoading) {
          setState(() {});
        } else if (state is HomeLoadSuccess) {
          // Handle success if needed
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.person,
                              size: 40,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Satria Ramadan",
                              style: GoogleFonts.tektur(),
                            ),
                            Text("Junior Programmer",
                                style: GoogleFonts.tektur()),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.info, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoDevice(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Cari Lowongan Pekerjaan",
                          style: GoogleFonts.tektur()),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "Cari Lowongan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search_sharp),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    // Row of Images with Reduced Spacing
                    Container(
                      height: 130,
                      child: PageView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Image.asset(
                              "assets/images/sample.png",
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    // Two Columns with Two Companies in Each
                    Column(children: [
                      Row(
                        children: [
                          Container(width: 175, child: CompanyCard("sasat")),
                          Container(width: 175, child: CompanyCard("Satset")),
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: 175, child: CompanyCard("sasat")),
                          Container(width: 175, child: CompanyCard("Satset")),
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: 175, child: CompanyCard("sasat")),
                          Container(width: 175, child: CompanyCard("Satset")),
                        ],
                      )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CompanyCard(String companyName) {
    return Card(
      color: Colors.grey,
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  companyName,
                  style: GoogleFonts.tektur(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text("Alamat Perusahaan : Jakarta Utara",
                  style: GoogleFonts.tektur()),
              Text("Bidang : IT", style: GoogleFonts.tektur()),
              Text("Posted on: DD/MM/YYYY", style: GoogleFonts.tektur()),
            ],
          ),
        ),
      ),
    );
  }
}
