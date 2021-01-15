import 'dart:async';
import 'package:chat/bloc/validators.dart';
import 'package:chat/models/room.dart';
import 'package:chat/models/rooms_response.dart';
import 'package:chat/models/ventilation.dart';
import 'package:chat/repository/rooms_repository.dart';
import 'package:rxdart/rxdart.dart';

class RoomBloc with Validators {
  final _nameController = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();
  final _co2Controller = BehaviorSubject<bool>();
  final _co2ControlController = BehaviorSubject<bool>();
  final _ventilationController = BehaviorSubject<List<Ventilation>>();
  final _kelvinController = BehaviorSubject<String>();
  final _wattsController = BehaviorSubject<String>();
  final _typeLightController = BehaviorSubject<String>();
  final _wideController = BehaviorSubject<String>();
  final _longController = BehaviorSubject<String>();
  final _tallController = BehaviorSubject<String>();

  final _roomsController = BehaviorSubject<List<Room>>();
  final RoomsRepository _repository = RoomsRepository();
  final BehaviorSubject<RoomsResponse> _subject =
      BehaviorSubject<RoomsResponse>();

  getRooms(String userId) async {
    print(userId);
    RoomsResponse response = await _repository.getRooms(userId);
    _subject.sink.add(response);
  }

  BehaviorSubject<RoomsResponse> get subject => _subject;
  // Recuperar los datos del Stream
  Stream<String> get nameStream =>
      _nameController.stream.transform(validationNameRequired);
  Stream<String> get descriptionStream =>
      _descriptionController.stream.transform(validationUserNameRequired);
  Stream<String> get typeLightStream =>
      _typeLightController.stream.transform(validationUserNameRequired);
  Stream<bool> get co2CompleteStream => _co2ControlController.stream;
  Stream<bool> get co2Stream => _co2Controller.stream;
  Stream<List<Ventilation>> get ventilationStream =>
      _ventilationController.stream;
  Stream<String> get kelvinStream => _kelvinController.stream;
  Stream<String> get wattsStream => _wattsController.stream;
  Stream<String> get wideStream => _wideController.stream;
  Stream<String> get longStream => _longController.stream;
  Stream<String> get tallStream => _tallController.stream;

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(nameStream, descriptionStream, (e, p) => true);
  Stream<List<Room>> get rooms => _roomsController.stream;
  // Insertar valores al Stream
  Function(List<Room>) get addRoom => _roomsController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeDescription => _descriptionController.sink.add;
  Function(List<Ventilation>) get changeVentilation =>
      _ventilationController.sink.add;
  Function(bool) get changeCo2 => _co2Controller.sink.add;
  Function(bool) get changeCo2Control => _co2ControlController.sink.add;
  Function(String) get changeKelvin => _kelvinController.sink.add;
  Function(String) get changeWatts => _wattsController.sink.add;
  Function(String) get changeTypeLight => _typeLightController.sink.add;
  Function(String) get changeWide => _wideController.sink.add;
  Function(String) get changeLong => _longController.sink.add;
  Function(String) get changeTall => _tallController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get name => _nameController.value;
  String get description => _descriptionController.value;

  dispose() {
    _subject.close();
    _nameController?.close();
    _ventilationController?.close();
    _co2Controller?.close();
    _co2Controller?.close();
    _co2ControlController?.close();
    _descriptionController?.close();
    _kelvinController?.close();
    _wattsController?.close();
    _typeLightController?.close();
    _wideController?.close();
    _longController?.close();
    _tallController?.close();
    //  _roomsController?.close();
  }

  disposeRooms() {
    _roomsController?.close();
  }
}

final roomBloc = RoomBloc();
