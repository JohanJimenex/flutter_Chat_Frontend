import 'package:dio/dio.dart';
import 'package:test_app/domain/entities/message.dart';
import 'package:test_app/infraestruture/models/yes_no_model.dart';

class YesNoService {
  final Dio _http = Dio();

  Future<Message> getAnswer() async {
    final resp = await _http.get("https://yesno.wtf/api");
    //forma de fernando, se usa un modelo para mapear y crear una capa de proteccion por si cambia alguna propiedad del json  
    // YesNoModel respMap = YesNoModel.fromJsonObj(resp.data);
    //mi forma
    YesNoModel respMap = YesNoModel(resp.data);

    return Message(
        fromWho: FromWho.other,
        textMsg: respMap.answer,
        imageUrl: respMap.imgaeUrl);
  }
}
