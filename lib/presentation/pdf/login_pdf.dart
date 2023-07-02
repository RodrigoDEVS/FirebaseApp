import 'dart:io';

import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class LoginPdf {
  final pdf = pw.Document();
  final DateTime date = DateTime.now();

  Future generatePdf(String name, String password) async {
    pdf.addPage(pw.Page(
        build: (context) => pw.Column(children: [
              pw.Container(
                  margin: const pw.EdgeInsets.only(top: 60, bottom: 20),
                  child: pw.Text("Usuario Logueado")),
              pw.TableHelper.fromTextArray(data: [
                ["Nombre", "Contraseña"],
                [name, password]
              ]),
              pw.SizedBox(height: 70),
              pw.Text("Rodrigo Gallego"),
              pw.Text("Consultor de Desarrollo")
            ])));
    try {
      //final output = await getApplicationDocumentsDirectory();
      final downloadsPath = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await DownloadsPath.downloadsDirectory();
      //final downloadsPath = (await DownloadsPath.downloadsDirectory())?.path;
      final file = File(
          "${downloadsPath?.path}/${date.year}_${date.month}_${date.day}.pdf");

      await file.writeAsBytes(await pdf.save());

      await OpenFilex.open(
          '${downloadsPath?.path}/${date.year}_${date.month}_${date.day}.pdf');

      return {
        "path": file.path,
        "code": 1,
      };
    } catch (e) {
      print('el error: $e');
      return {"path": "-1", "code": -1};
    }
  }
}
