import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Olá, ${userManager.user?.name ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                accountEmail: Text(
                  '${userManager.user?.email ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                  ),

                ),

                //TODO TERMINAR LISTA DE WIDGETS
                //TODO ROTAS DO DRAWER
              ),
            ],
          );
        },
      ),
    );
  }
}
