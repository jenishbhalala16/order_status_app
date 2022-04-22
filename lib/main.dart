import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = [HomeTab(), SearchTab() ,ProfileTab(), ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle:Text("Cupertino Store",style: TextStyle(fontSize: 20),),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Product",
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: "Search"
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              )
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return data[index];
              },
            );
          },
        )
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return Material(
        child:Column(
          children: [
            SizedBox(height: 70,),
            ListTile(
             leading: Image.asset("assets/1sst.jpg"),
             title: Text("Chashmish bachha",),
             subtitle: Text("Innocent"),
             trailing: IconButton(onPressed: () {},
              icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
             )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/2nd.jpg"),
                title: Text("Stylish men"),
                subtitle: Text("Cool"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/3rd.jpg"),
                title: Text("Boy cut baal vali ladki"),
                subtitle:  Text("Super women"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/4th.jpg"),
                title: Text("Shyam Sundar"),
                subtitle: Text("Black Lover"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/5th.jpg"),
                title: Text("Panda"),
                subtitle: Text("Always Lazy"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/6th.jpg"),
                title: Text("Chotu"),
                subtitle: Text("Charming"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
            SizedBox(height: 30,),
            ListTile(
                leading: Image.asset("assets/7th.jpg"),
                title: Text("Chashmish Chotu"),
                subtitle: Text("Dagli"),
                trailing: IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.add_circled,color: Colors.blue,),
                )
            ),
          ],
        )
    );
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}


class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int _currentIndex = 0;

    String? name;
    int? phone;
    String? address;

    final GlobalKey<FormState> _contactInfoFormkey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _address1Controller = TextEditingController();

    return Material(

        child:Column(
          children: [

            SizedBox(height: 30,),
            Expanded(

              child: IndexedStack(
                index: _currentIndex,
                children: [
                  //  contact
                  Container(
                    margin: const EdgeInsets.all(28),
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 28,
                    ),
                    color: Colors.white,
                    child:   SingleChildScrollView(
                      child: Form(
                        key: _contactInfoFormkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "assets/6th.jpg",
                                    height: 25,
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Expanded(
                                  flex: 10,
                                  child: TextFormField(
                                    controller: _nameController,
                                    validator: (val){
                                      if (val!.isEmpty){
                                        return "Enter your name first";
                                      }
                                      return null;
                                    },
                                    onSaved: (val){
                                      name = val;
                                    },
                                    decoration: const InputDecoration(
                                      label: Text("Name"),
                                      hintText: "Enter your name here",
                                      border: UnderlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "assets/8th.jpg",
                                    height: 25,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                    flex: 10,
                                    child: TextFormField(
                                      controller: _phoneController,
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "Enter your phone number";
                                        }else if (val.length != 10){
                                          return "Invalid length of your phone number";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        phone = int.parse(val!);
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        label: Text("phone"),
                                        hintText: "Enter your phone number here",
                                        border: UnderlineInputBorder(),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "assets/9th.jpg",
                                    height: 25,
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Expanded(
                                  flex: 10,
                                  child: TextFormField(
                                    controller: _address1Controller,
                                    validator: (val){
                                      if(val!.isEmpty){
                                        return "Enter your address";
                                      }
                                      return null;
                                    },
                                    onSaved: (val){
                                      address = val;
                                    },
                                    decoration: const InputDecoration(
                                      label: Text("Address"),
                                      hintText: "Enter your address here",
                                      border: UnderlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [

                                MaterialButton(
                                  child: Text(
                                    "Pick Date",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext builder) {
                                          return CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.dateAndTime,
                                            onDateTimeChanged: (value) {

                                            },
                                            initialDateTime: DateTime.now(),
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            ListTile(
                                leading: Image.asset("assets/6th.jpg"),
                                title: Text("Chotu"),
                                subtitle: Text("Charming"),
                                trailing: Text('Charming')
                            ),
                            SizedBox(height: 10,),
                            ListTile(
                                leading: Image.asset("assets/3rd.jpg"),
                                title: Text("Boy cut baal vali ladki"),
                                subtitle:  Text("Super women"),
                                trailing: Text('Super Women')
                            ),
                            SizedBox(height: 10,),
                            ListTile(
                                leading: Image.asset("assets/7th.jpg"),
                                title: Text("Chashmish Chotu"),
                                subtitle: Text("Dagli"),
                                trailing: Text('Dagli')
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}
