import 'package:dio/dio.dart';

class CustomException implements Exception {
  String? errorMessage;
  CustomException({this.errorMessage});

  factory CustomException.fromDioError(DioError dioError) {
    _getHttpErrorDescription(DioError dioError) {
      switch (dioError.response!.statusCode) {
        case 400:
          return "Não foi possível processar sua requisição";
        case 401:
          return "Não foi possível autenticar o usuário";
        case 403:
          return "Verifique se o usuário possui as permissões necessárias para acessar o app";
        default:
          return "Erro desconhecido";
      }
    }

    _getDioErrorDescription(DioError dioError) {
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
          return "Não foi possível se conectar à API.";
        case DioErrorType.receiveTimeout:
          return "O servidor não respondeu a solicitação.\nTente novamente.";
        case DioErrorType.sendTimeout:
          return "Falha ao enviar a requisição para o servidor.";
        case DioErrorType.cancel:
          return "A requisição foi cancelada.\nTente novamente.";
        default:
          if (dioError.response != null) {
            return _getHttpErrorDescription(dioError);
          }
          return "Erro desconhecido.\n" + dioError.message;
      }
    }

    if (dioError.response != null) {
      return CustomException(errorMessage: _getDioErrorDescription(dioError));
    } else {
      return CustomException(errorMessage: _getHttpErrorDescription(dioError));
    }
  }

  factory CustomException.fromStatusCode(int statusCode) {
    late String message;
    switch (statusCode) {
      case 400:
        message = "Requisição inválida. Verifique os dados enviados";
        break;
      case 401:
        message = "Usuário não autenticado";
        break;
      case 403:
        message = "Usuário sem acesso ao recurso";
        break;
      case 404:
        message = "URL inválida";
        break;
      default:
        message = "Erro desconhecido";
        break;
    }

    return CustomException(errorMessage: message);
  }
}
