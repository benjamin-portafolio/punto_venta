import 'package:punto_venta/data/models/espacio_model.dart';
import 'package:punto_venta/data/models/synchronization/espacio_response.dart';

class SynchronizationResponse {
  final int? status;
  final List<Espacio>? espacioResponse;

  SynchronizationResponse({required this.status, this.espacioResponse});

  factory SynchronizationResponse.fromJson(Map<String, dynamic> json) {
    var espacioResponse = <Espacio>[];
    if (json['espacios'] != null) {
      json['espacios'].forEach((v) {
        espacioResponse.add(Espacio.fromServerJson(v));
      });
    }
    return SynchronizationResponse(
      status: json['status'] as int?,
      espacioResponse: espacioResponse,
    );
    //return SynchronizationResponse(status: json['status'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}
