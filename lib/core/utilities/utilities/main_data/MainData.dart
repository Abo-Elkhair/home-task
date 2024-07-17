// ignore_for_file: deprecated_member_use, file_names

part of 'MainDataImports.dart';

class MainData {
  /// We don't need to add [GenericBloc] to the providers list, because it's not more than an abstract class
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<GenericBloc>(
            create: (BuildContext context) => GenericBloc('')),
      ];
}
