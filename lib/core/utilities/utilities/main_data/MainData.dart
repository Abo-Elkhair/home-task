// ignore_for_file: deprecated_member_use, file_names

part of 'MainDataImports.dart';

class MainData {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<GenericBloc>(
            create: (BuildContext context) => GenericBloc('')),
      ];
}
