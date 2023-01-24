import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_riverpod/controllers/controller.dart';
import 'package:grock/grock.dart';
import 'package:restfull_api_riverpod/widgets/loading_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var read = ref.read(controller);
    var watch = ref.watch(controller);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Riverpod'.capitalizeEachUpper,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: LoadingWidget(
        isLoading: watch.isloading,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: OutlinedButton(
                        onPressed: () => read.notSavedButton(),
                        child: Text(
                          'Kullanıcılar (${watch.users.length})',
                          style: TextStyle(),
                        )),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 6,
                    child: OutlinedButton(
                        onPressed: () => read.savedButton(),
                        child: Text(
                          'Kaydedilenler (${watch.saved.length})',
                          style: TextStyle(),
                        )),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: watch.pageController,
                  children: [
                    notSaved(watch),
                    saved(watch),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView notSaved(Controller watch) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            shape: RoundedRectangleBorder(borderRadius: 15.allBR),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(watch.users[index]!.avatar!),
                radius: 20,
              ),
              title: Text(
                "${watch.users[index]?.firstName ?? ""}" +
                    "${watch.users[index]?.lastName ?? ""}",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                "${watch.users[index]?.email ?? ""}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey.shade400),
              ),
              trailing: IconButton(
                icon: Icon(Icons.send_and_archive_outlined),
                onPressed: () => watch.addSaved(watch.users[index]!),
              ),
            ));
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
      itemCount: watch.users.length,
    );
  }
}

ListView saved(Controller watch) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return Card(
          shape: RoundedRectangleBorder(borderRadius: 15.allBR),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(watch.saved[index]!.avatar!),
              radius: 20,
            ),
            title: Text(
              "${watch.saved[index]?.firstName ?? ""}" +
                  "${watch.saved[index]?.lastName ?? ""}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            subtitle: Text(
              "${watch.saved[index]?.email ?? ""}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.grey.shade400),
            ),
          ));
    },
    separatorBuilder: (context, index) {
      return const SizedBox(height: 15);
    },
    itemCount: watch.saved.length,
  );
}
