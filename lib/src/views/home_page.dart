import 'package:fetch_random_user_api/src/controllers/user_controller.dart';
import 'package:fetch_random_user_api/src/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/user_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3e50),
        elevation: 0,
        title: Text(
          controller.isLoading ? 'Loading...' : 'Random Users',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF2c3e50),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: controller.users.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: UserTile(
                            user: user,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailPage(
                                    user: user,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
