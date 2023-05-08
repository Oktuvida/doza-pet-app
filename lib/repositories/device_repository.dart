import 'package:doza_pet/models/device.dart';
import 'package:doza_pet/repositories/repository.dart';

class DeviceRepository extends Repository<Device> {
  DeviceRepository() : super(table: "dispositivo", primaryTableKey: "id");

  @override
  Device fromRequestData(Map<String, dynamic> data) {
    return Device.fromMap(data);
  }

  @override
  Map<String, dynamic> toRequestData(Device data) {
    return data.toMap();
  }
}
