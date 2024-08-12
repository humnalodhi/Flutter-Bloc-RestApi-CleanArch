import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';

part 'person_model.g.dart';

@Freezed()
class PersonModel with _$PersonModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory PersonModel({
    @Default('') String name,
    @Default(0) int age,
    @Default([]) List<String> personName,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

/// The above code automatically handles all the things that is handled in the below class.
// class PersonModel {
//   String? name;
//
//   PersonModel({
//     this.name,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is PersonModel &&
//           runtimeType == other.runtimeType &&
//           name == other.name;
//
//   @override
//   int get hashCode => name.hashCode;
//
//   PersonModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
//
//   PersonModel copyWith({
//     String? name,
//   }) {
//     return PersonModel(
//       name: name ?? name,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'Person(firstName: $name)';
//   }
// }
