import 'package:courseconnect/screen/admin_dashboard/admin_tambah_course.dart';
import 'package:courseconnect/screen/admin_dashboard/admin_ubah_course.dart';
import 'package:flutter/material.dart';
import '../admin_auth/admin_login_screen.dart';

class AdminCourseScreen extends StatefulWidget {
  final String username;

  const AdminCourseScreen({super.key, required this.username});

  @override
  _AdminCourseScreenState createState() => _AdminCourseScreenState();
}

class _AdminCourseScreenState extends State<AdminCourseScreen> {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'ReactJS Expertise',
      price: 50000,
      description: 'Master ReactJS with this comprehensive course.',
    ),
    Product(
      id: 2,
      name: 'MERN Stack Expertise',
      price: 75000,
      description: 'Learn the full-stack MERN development process.',
    ),
    Product(
      id: 3,
      name: 'NodeJS for Beginner',
      price: 45000,
      description: 'Get started with backend development using NodeJS.',
    ),
    Product(
      id: 4,
      name: 'ReactJS for Beginner',
      price: 50000,
      description: 'Learn ReactJS basics with this beginner-friendly course.',
    ),
    Product(
      id: 5,
      name: 'UI Design',
      price: 60000,
      description: 'Master UI/UX design techniques for stunning applications.',
    ),
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminLoginScreen(),
      ),
    );
  }

  void _search(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        final nameLower = product.name.toLowerCase();
        final descriptionLower = product.description.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower) ||
            descriptionLower.contains(searchLower) ||
            product.price.toString().contains(query);
      }).toList();
    });
  }

  void _deleteProduct(int id) {
    setState(() {
      products.removeWhere((product) => product.id == id);
      filteredProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'CourseConnect',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: _logout,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Admin Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: _search,
            decoration: InputDecoration(
              hintText: 'Search by course name or price',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 20),
          ...filteredProducts.map((product) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.15),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price: Rp${product.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000015),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminUbahCourse(
                                title: product.name,
                                description: product.description,
                                price: product.price.toDouble(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Ubah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                          // Implement course overview functionality here
                        },
                        child: const Text(
                          'Course Overview',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                            side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        onPressed: () {
                          _deleteProduct(product.id);
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminTambahCourse(),
            ),
          );
        },
        backgroundColor: const Color(0xFF000015),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}