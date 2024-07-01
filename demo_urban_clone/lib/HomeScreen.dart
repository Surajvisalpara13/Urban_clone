import 'package:flutter/material.dart';
import 'dart:async';

import 'DetilsPage.dart';
import 'Rewards.dart';
import 'Mybooking.dart';
import 'Profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  final List<String> services = [
    'Salon at Home',
    'Massage at Home',
    'Cleaning',
    'Electrician, Plumber, Carpenter',
    'Appliances & Electronics Repair',
    'Makeup & Hairstyling',
    'Fitness & Yoga',
    'Painting',
    'Pest Control'
  ];

  final List<String> serviceImages = [
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_ff4015a0.png',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_30936e80.png',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_6a7a5f30.png',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_5612ca90.png',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_9093fa70.jpeg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_ea9a9700.jpeg',
  ];

  final List<String> scrollImages = [
    'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_394,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1715685371430-6b3871.jpeg',
    'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_394,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1701759875987-8b654d.jpeg',
    'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_394,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/home-screen/1711428209166-2d42c0.jpeg',
    'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_394,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/home-screen/1678463309015-2b92d2.jpeg',
    'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_394,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/home-screen/1678450687690-81f922.jpeg',
  ];

  final List<String> itemTitles = [
    "Women's Salon & Spa",
    "Salon Prime for kids & men",
    "Appliance Repair",
    "Cleaning",
    "Electrician, Plumber & Carpenters",
    "RO & Water Purifier Repair",
  ];

  final List<String> itemImages = [
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_salon_women.jpg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_salon_men.jpg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_appliance_repair.jpg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_cleaning.jpg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_electrician.jpg',
    'https://res.cloudinary.com/urbanclap/image/upload/q_auto,f_auto,fl_progressive:steep/categories/category_v2/category_ro.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (_pageController.page == scrollImages.length - 1) {
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Urban Company',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),

              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(itemTitles.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController textEditingController =
                                TextEditingController();
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Icon(Icons.event_note, color: Colors.black),
                                  SizedBox(width: 10),
                                  Text('Appointment'),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Details',
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'Close',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    String enteredText =
                                        textEditingController.text;
                                    Navigator.of(context).pop();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: Colors.green),
                                              SizedBox(width: 10),
                                              Text('Booking Appointment'),
                                            ],
                                          ),
                                          content: Text(
                                              'Your Appointment Booked $enteredText'),
                                          actions: [
                                            TextButton(
                                              child: Text(
                                                'Close',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Image.network(
                              itemImages[index],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey,
                                  child: Icon(Icons.broken_image),
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                itemTitles[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 2.6,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              service: services[index],
                              imageUrl:
                                  serviceImages[index % serviceImages.length],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              serviceImages[index % serviceImages.length],
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                services[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: scrollImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(scrollImages[index]),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 210, top: 8, bottom: 5, left: 8),
                      child: Text(
                        'New and noteworthy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template,q_auto:low,f_auto/w_600,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1710823009022-7427f2.jpeg',
                                'AC Service and Repair'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_category/w_400,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1710322828550-146ca1.jpeg',
                                'Washing Machine Repair'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_600,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1700137613735-a7d95a.jpeg',
                                'Refrigerator Repair'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_category/w_400,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1710404567511-2b93ab.jpeg',
                                'Microwave Repair'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_category/w_400,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1695976081663-a11ad6.jpeg',
                                'Water Purifier'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 210, top: 8, bottom: 5, left: 8),
                      child: Text(
                        'Cleaning & pest control',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_231,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1700141161917-028287.jpeg',
                                'Cleaning Service'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_231,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1700204929955-75dd47.jpeg',
                                'Pest Control'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 210, top: 8, bottom: 5, left: 8),
                      child: Text(
                        'Salon for Women',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_231,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1700143543316-c5eb5c.jpeg',
                                'Carpet Cleaning'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_231,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1700143539186-26f4e5.jpeg',
                                'Home Cleaning'),
                            buildIconContainer(
                                'https://res.cloudinary.com/urbanclap/image/upload/t_high_res_template/w_231,dpr_1,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/growth/luminosity/1700143553928-f5f936.jpeg',
                                'Office Cleaning'),
                            buildIconContainer(
                                'https://www.google.com/imgres?q=pedicure%20in%20urban%20company&imgurl=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Furbanclap-prod%2Fcategories%2Fcategory_v2%2Fcategory_59cf7270.jpeg&imgrefurl=https%3A%2F%2Fwww.urbancompany.com%2Fhyderabad-salon-at-home&docid=y3YDV-R1A9YugM&tbnid=ubXqW2YKdmVCgM&vet=12ahUKEwitoa3t3YOHAxVuk1YBHeeZAa4QM3oECFIQAA..i&w=5624&h=3750&hcb=2&ved=2ahUKEwitoa3t3YOHAxVuk1YBHeeZAa4QM3oECFIQAA',
                                'Pedicure'),
                            buildIconContainer(
                                'https://www.google.com/imgres?q=waxing%20in%20urban%20company&imgurl=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Furbanclap-prod%2Fimages%2Fgrowth%2Fhome-screen%2F1603078787966-226e17.jpeg&imgrefurl=https%3A%2F%2Fwww.urbancompany.com%2Fahmedabad-salon-basics&docid=vkWL1OdX-XAqtM&tbnid=r25X56BVly3O8M&vet=12ahUKEwilyMD73YOHAxXvsFYBHSvgCFgQM3oECFEQAA..i&w=1440&h=810&hcb=2&ved=2ahUKEwilyMD73YOHAxXvsFYBHSvgCFgQM3oECFEQAA',
                                'Waxing'),
                            buildIconContainer(
                                'https://www.google.com/imgres?q=manicure%20in%20urban%20company&imgurl=https%3A%2F%2Fres.cloudinary.com%2Furbanclap%2Fimage%2Fupload%2Ft_high_res_category%2Fw_400%2Cdpr_2%2Cfl_progressive%3Asteep%2Cq_auto%3Alow%2Cf_auto%2Cc_limit%2Fimages%2Fgrowth%2Fluminosity%2F1695974284899-91b371.jpeg&imgrefurl=https%3A%2F%2Fwww.urbancompany.com%2Fahmedabad-salon-nails&docid=Rxiwo-LKQMlUuM&tbnid=TrtpVQNrr6KKJM&vet=12ahUKEwidocKM3oOHAxWTrlYBHSo1Ai8QM3oECFwQAA..i&w=800&h=450&hcb=2&ved=2ahUKEwidocKM3oOHAxWTrlYBHSo1Ai8QM3oECFwQAA',
                                'Manicure'),
                            buildIconContainer(
                                'https://www.google.com/imgres?q=facial%20%26%20cleanup%20in%20urban%20company&imgurl=https%3A%2F%2Fres.cloudinary.com%2Furbanclap%2Fimage%2Fupload%2Ft_high_res_category%2Fw_400%2Cdpr_2%2Cfl_progressive%3Asteep%2Cq_auto%3Alow%2Cf_auto%2Cc_limit%2Fimages%2Fsupply%2Fcustomer-app-supply%2F1718462140414-c4f9e4.png&imgrefurl=https%3A%2F%2Fwww.urbancompany.com%2Fmumbai-salon-at-home&docid=qMzjmg4Y9M2wgM&tbnid=Dwmj3fUzrRH19M&vet=12ahUKEwj_8fmk3oOHAxVMs1YBHQCHDA8QM3oECDgQAA..i&w=800&h=449&hcb=2&ved=2ahUKEwj_8fmk3oOHAxVMs1YBHQCHDA8QM3oECDgQAA',
                                'Facial & Cleanup'),
                            buildIconContainer(
                                'https://www.google.com/imgres?q=bleach%20%26%20Detan%20in%20urban%20company&imgurl=https%3A%2F%2Fres.cloudinary.com%2Furbanclap%2Fimage%2Fupload%2Ft_high_res_template%2Fdpr_2%2Cfl_progressive%3Asteep%2Cq_auto%3Alow%2Cf_auto%2Cc_limit%2Fimages-stage%2Fgrowth%2Fblog%2F1718357992874-d0980c.jpeg&imgrefurl=https%3A%2F%2Fwww.urbancompany.com%2Fblog%2Fbeauty-basics-face-bleach-benefits-you-must-know&docid=2XRkBk4UntdssM&tbnid=oE_Y6S3k1GCAIM&vet=12ahUKEwity9fL3oOHAxWopVYBHS7mDcMQM3oECB8QAA..i&w=1000&h=648&hcb=2&ved=2ahUKEwity9fL3oOHAxWopVYBHS7mDcMQM3oECB8QAA',
                                'Bleach & Detan'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 6, color: Colors.grey.shade300),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBookingScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RewardsScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'My Bookings',
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            label: 'Rewards',
            icon: Icon(Icons.wallet_giftcard),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_circle),
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

Widget buildIconContainer(String imageUrl, String label) {
  return Container(
    width: 100,
    margin: EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.green.shade50,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
