import 'package:fit_life/core/components/extensions/string_extensions.dart';
import 'package:fit_life/mvvm/me/entity/user/user_profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'birthDay')
  final int? birthDay;

  @JsonKey(name: 'weight')
  final double weight;

  @JsonKey(name: 'height')
  final double height;

  @JsonKey(name: 'level')
  final String? level;

  @JsonKey(name: 'currentPlan')
  final String? currentPlan;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'frequency')
  final String? frequency;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'created')
  final bool created;

  UserProfileModel({
    required this.id,
    required this.birthDay,
    required this.weight,
    required this.height,
    required this.gender,
    required this.created,
    this.level,
    this.currentPlan,
    this.phone,
    this.frequency,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  UserProfile get toEntity => UserProfile(
        id: id,
        weight: weight,
        height: height,
        created: created,
        level: level,
        birthDay: DateTime.fromMillisecondsSinceEpoch(birthDay ?? 0),
        gender: gender?.toGender,
        frequency: frequency?.toFrequency,
        currentPlan: currentPlan,
        phone: phone,
      );
}
