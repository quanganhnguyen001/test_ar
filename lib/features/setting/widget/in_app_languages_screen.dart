import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_style.dart';
import '../../first_languages/bloc/languages_bloc.dart';
import '../../first_languages/model/languages_model.dart';

class InAppLanguagesScreen extends StatefulWidget {
  const InAppLanguagesScreen({super.key});

  @override
  State<InAppLanguagesScreen> createState() => _InAppLanguagesScreenState();
}

class _InAppLanguagesScreenState extends State<InAppLanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.current.languages,
          style: AppStyle.titleStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.check,
                color: Color.fromRGBO(55, 133, 250, 1),
              )),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: BlocBuilder<LanguagesBloc, LanguagesState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: listLanguages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: InkWell(
                        onTap: () {
                          context.read<LanguagesBloc>().add(SubmitLanguageEvent(
                              locale: Locale(listLanguages[index].languageCode),
                              selectedIndex: index));
                        },
                        child: Container(
                          height: 48,
                          decoration: state.selectedIndex != index
                              ? BoxDecoration(
                                  color: const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(24))
                              : BoxDecoration(
                                  color:
                                      const Color.fromRGBO(55, 133, 250, 0.3),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(55, 133, 250, 1),
                                      width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  listLanguages[index].imageAssest,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  listLanguages[index].name,
                                  style: const TextStyle(
                                      fontFamily: 'SVNGilroy Bold',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
