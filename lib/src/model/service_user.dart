import 'package:equatable/equatable.dart';

class ServiceUser extends Equatable {
  const ServiceUser(this.id, this.email);

  final String id;
  final String email;

  @override
  List<Object> get props => [id];

  static const empty = ServiceUser('-', '-');
}
