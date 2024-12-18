import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grocery_ui/item_widget.dart';

import 'bloc/product_bloc.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restu aplication',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final data = Product(
  //   'Bayam',
  //   '2.000',
  //   '1ikat',
  //   'assets/img1.png',
  //   'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral, dan serat pangan. Sebagian vitamin dan mineral yang terkandung dalam sayuran dan buah-buahan berperan untuk membantu proses-proses metabolisme di dalam tubuh, sedangkan antioksidan mampu menangkal senyawa-senyawa hasil oksidasi, radikal bebas, yang mampu menurunkan kondisi kesehatan tubuh',
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 254, 97, 0),
        // leading: const Icon(
        //   Icons.menu,
        //   color: Color.fromARGB(255, 255, 255, 255),
        // ),
        title: const Text(
          'Restu store',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                      child: const Center(
                        child: Text(
                          "7",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductSuccess) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(product: state.products[index]);
                },
                itemCount: state.products.length,
              ),
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
