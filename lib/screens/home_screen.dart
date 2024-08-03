import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/logic/book_cubit.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/widgets/book_cover_widget.dart';
import 'package:books_app/screens/categories/business_screen.dart';
import 'package:books_app/screens/categories/programming_screen.dart';
import 'package:books_app/screens/categories/science_screen.dart';
import 'package:books_app/screens/categories/free_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined, color: Colors.white),
            label: 'Categories',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off_outlined, color: Colors.white),
            label: 'Free',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline, color: Colors.white),
            label: 'Credits',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.white, // Set selected item color to white
        unselectedItemColor: Colors.white, // Set unselected item color to white
        backgroundColor: Colors.black, // Set navigation bar background color to black
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
      body: getPage(),
    );
  }

  getProgrammingBanner() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              var cubit = BookCubit.get(context);
      
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Success) {
                if (cubit.programmingBooks.isEmpty) {
                  return const Center(
                      child: Text("No programming books were found."));
                }
      
                return SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      var programmingBook = cubit.programmingBooks[index];
                      return BookCover(book: programmingBook);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                );
              }
              else {
                return const Center(child: Text("An error occurred."));
              }
            }
        ),
      ),
    );
  }

  getScienceBanner() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            var cubit = BookCubit.get(context);

            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Success) {
              if (cubit.scienceBooks.isEmpty) {
                return const Center(
                    child: Text("No science books were found."));
              }
              else {
                return SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      var scienceBook = cubit.scienceBooks[index];
                      return BookCover(book: scienceBook);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                );
              }
            }
            else {
              return const Center(child: Text("An error occurred."));
            }
          },
        ),
      ),
    );
  }

  getBusinessBanner() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            var cubit = BookCubit.get(context);
      
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Success) {
              if (cubit.businessBooks.isEmpty) {
                return const Center(
                    child: Text("No business books were found."));
              }
              else{
                return SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      var businessBook = cubit.businessBooks[index];
                      return BookCover(book: businessBook);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                );
              }
      

            }
            else {
              return const Center(child: Text("An error occurred."));
            }
          },
        ),
      ),
    );
  }

  Widget getPage(){
    return Container(
        decoration: BoxDecoration(
            color: bottomBarColor
        ),
        child: Container(
          decoration: BoxDecoration(
              color: appBgColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80)
              )
          ),
          child: IndexedStack(
            index: myIndex,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200, ///250
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                                      color: Colors.black
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.only(left: 35, right:15),
                                        child: const Text("Welcome to Cyberbooks", style: TextStyle(color: secondary, fontSize: 23, fontWeight: FontWeight.w600),),
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.only(left: 35, right:15),
                                        child: const Text("The Largest eBooks Library", style: TextStyle(color: secondary, fontSize: 15, fontWeight: FontWeight.w500),),
                                      ),
                                      const SizedBox(height: 35,),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  color: Colors.black,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: appBgColor,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(100))
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,), ///35
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProgrammingScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Programming Books",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward, size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        BlocProvider(
                          create: (context) => BookCubit()..getProgrammingBooks(),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: getProgrammingBanner(),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ScienceScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Science Books",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward, size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        BlocProvider(
                          create: (context) => BookCubit()..getScienceBooks(),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: getScienceBanner(),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BusinessScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Business Books",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward, size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        BlocProvider(
                          create: (context) => BookCubit()..getBusinessBooks(),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: getBusinessBanner(),
                          ),
                        ),
                        const SizedBox(height: 25,),
                      ],
                    ),
                  ],
                ),
              ),
              FreeScreen(),
              Center(
                child: Text("Cyberbooks by Selim Waly",style: TextStyle(
                    fontSize: 30
                ),),
              )
            ],
          ),
        ),
      );
  }

}