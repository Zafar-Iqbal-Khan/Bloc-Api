// To parse this JSON data, do
//
//     final userProfileModal = userProfileModalFromJson(jsonString);

import 'dart:convert';

UserProfileModal userProfileModalFromJson(String str) =>
    UserProfileModal.fromJson(json.decode(str));

String userProfileModalToJson(UserProfileModal data) =>
    json.encode(data.toJson());

class UserProfileModal {
  int? statusId;
  dynamic createdBy;
  dynamic creationTime;
  dynamic updatedBy;
  dynamic updateTime;
  int? profileId;
  bool? isOrg;
  String? fullName;
  String? countryOriginCode;
  String? identificationId;
  String? passportNo;
  DateTime? passportExpiryDate;
  String? email;
  String? phone;
  String? mobile;
  bool? hasPrStatus;
  bool? hasWorkPermit;
  dynamic orgContactPerson;
  dynamic orgContactPersonDepartment;
  dynamic orgContactPersonDesignation;
  dynamic wpOriginCountryCode;
  dynamic wpNumber;
  dynamic nationalityIdentificationTypeId;
  List<PrfProfileAddress>? prfProfileAddress;
  dynamic prfProfilePrIdentities;
  MobileCountryCode? phoneCountryCode;
  MobileCountryCode? mobileCountryCode;
  dynamic vecRegNo;
  dynamic verificationCode;
  int? id;
  bool? active;
  String? error;

  UserProfileModal({
    this.statusId,
    this.createdBy,
    this.creationTime,
    this.updatedBy,
    this.updateTime,
    this.profileId,
    this.isOrg,
    this.fullName,
    this.countryOriginCode,
    this.identificationId,
    this.passportNo,
    this.passportExpiryDate,
    this.email,
    this.phone,
    this.mobile,
    this.hasPrStatus,
    this.hasWorkPermit,
    this.orgContactPerson,
    this.orgContactPersonDepartment,
    this.orgContactPersonDesignation,
    this.wpOriginCountryCode,
    this.wpNumber,
    this.nationalityIdentificationTypeId,
    this.prfProfileAddress,
    this.prfProfilePrIdentities,
    this.phoneCountryCode,
    this.mobileCountryCode,
    this.vecRegNo,
    this.verificationCode,
    this.id,
    this.active,
    this.error,
  });

  factory UserProfileModal.fromJson(Map<String, dynamic> json) =>
      UserProfileModal(
        statusId: json["statusId"],
        createdBy: json["createdBy"],
        creationTime: json["creationTime"],
        updatedBy: json["updatedBy"],
        updateTime: json["updateTime"],
        profileId: json["profileId"],
        isOrg: json["isOrg"],
        fullName: json["fullName"],
        countryOriginCode: json["countryOriginCode"],
        identificationId: json["identificationId"],
        passportNo: json["passportNo"],
        passportExpiryDate: json["passportExpiryDate"] == null
            ? null
            : DateTime.parse(json["passportExpiryDate"]),
        email: json["email"],
        phone: json["phone"],
        mobile: json["mobile"],
        hasPrStatus: json["hasPrStatus"],
        hasWorkPermit: json["hasWorkPermit"],
        orgContactPerson: json["orgContactPerson"],
        orgContactPersonDepartment: json["orgContactPersonDepartment"],
        orgContactPersonDesignation: json["orgContactPersonDesignation"],
        wpOriginCountryCode: json["wpOriginCountryCode"],
        wpNumber: json["wpNumber"],
        nationalityIdentificationTypeId:
            json["nationalityIdentificationTypeId"],
        prfProfileAddress: json["prfProfileAddress"] == null
            ? []
            : List<PrfProfileAddress>.from(json["prfProfileAddress"]!
                .map((x) => PrfProfileAddress.fromJson(x))),
        prfProfilePrIdentities: json["prfProfilePrIdentities"],
        phoneCountryCode: json["phoneCountryCode"] == null
            ? null
            : MobileCountryCode.fromJson(json["phoneCountryCode"]),
        mobileCountryCode: json["mobileCountryCode"] == null
            ? null
            : MobileCountryCode.fromJson(json["mobileCountryCode"]),
        vecRegNo: json["vecRegNo"],
        verificationCode: json["verificationCode"],
        id: json["id"],
        active: json["active"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "statusId": statusId,
        "createdBy": createdBy,
        "creationTime": creationTime,
        "updatedBy": updatedBy,
        "updateTime": updateTime,
        "profileId": profileId,
        "isOrg": isOrg,
        "fullName": fullName,
        "countryOriginCode": countryOriginCode,
        "identificationId": identificationId,
        "passportNo": passportNo,
        "passportExpiryDate":
            "${passportExpiryDate!.year.toString().padLeft(4, '0')}-${passportExpiryDate!.month.toString().padLeft(2, '0')}-${passportExpiryDate!.day.toString().padLeft(2, '0')}",
        "email": email,
        "phone": phone,
        "mobile": mobile,
        "hasPrStatus": hasPrStatus,
        "hasWorkPermit": hasWorkPermit,
        "orgContactPerson": orgContactPerson,
        "orgContactPersonDepartment": orgContactPersonDepartment,
        "orgContactPersonDesignation": orgContactPersonDesignation,
        "wpOriginCountryCode": wpOriginCountryCode,
        "wpNumber": wpNumber,
        "nationalityIdentificationTypeId": nationalityIdentificationTypeId,
        "prfProfileAddress": prfProfileAddress == null
            ? []
            : List<dynamic>.from(prfProfileAddress!.map((x) => x.toJson())),
        "prfProfilePrIdentities": prfProfilePrIdentities,
        "phoneCountryCode": phoneCountryCode?.toJson(),
        "mobileCountryCode": mobileCountryCode?.toJson(),
        "vecRegNo": vecRegNo,
        "verificationCode": verificationCode,
        "id": id,
        "active": active,
        "error": error,
      };
  UserProfileModal.withError(String message) {
    error = message;
  }
}

class MobileCountryCode {
  int? statusId;
  int? createdBy;
  DateTime? creationTime;
  dynamic updatedBy;
  dynamic updateTime;
  String? code;
  String? code2;
  String? tag;
  String? mobileCode;
  String? description;
  String? id;
  bool? active;

  MobileCountryCode({
    this.statusId,
    this.createdBy,
    this.creationTime,
    this.updatedBy,
    this.updateTime,
    this.code,
    this.code2,
    this.tag,
    this.mobileCode,
    this.description,
    this.id,
    this.active,
  });

  factory MobileCountryCode.fromJson(Map<String, dynamic> json) =>
      MobileCountryCode(
        statusId: json["statusId"],
        createdBy: json["createdBy"],
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        updatedBy: json["updatedBy"],
        updateTime: json["updateTime"],
        code: json["code"],
        code2: json["code2"],
        tag: json["tag"],
        mobileCode: json["mobileCode"],
        description: json["description"],
        id: json["id"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "statusId": statusId,
        "createdBy": createdBy,
        "creationTime": creationTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "updateTime": updateTime,
        "code": code,
        "code2": code2,
        "tag": tag,
        "mobileCode": mobileCode,
        "description": description,
        "id": id,
        "active": active,
      };
}

class PrfProfileAddress {
  int? statusId;
  dynamic createdBy;
  dynamic creationTime;
  dynamic updatedBy;
  dynamic updateTime;
  dynamic id;
  String? address1;
  String? address2;
  dynamic address3;
  dynamic address4;
  String? city;
  String? postcode;
  dynamic prfProfile;
  RefAddressType? refAddressType;
  MobileCountryCode? refGeoCountry;
  MobileCountryCode? refGeoState;
  bool? active;

  PrfProfileAddress({
    this.statusId,
    this.createdBy,
    this.creationTime,
    this.updatedBy,
    this.updateTime,
    this.id,
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.city,
    this.postcode,
    this.prfProfile,
    this.refAddressType,
    this.refGeoCountry,
    this.refGeoState,
    this.active,
  });

  factory PrfProfileAddress.fromJson(Map<String, dynamic> json) =>
      PrfProfileAddress(
        statusId: json["statusId"],
        createdBy: json["createdBy"],
        creationTime: json["creationTime"],
        updatedBy: json["updatedBy"],
        updateTime: json["updateTime"],
        id: json["id"],
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
        address4: json["address4"],
        city: json["city"],
        postcode: json["postcode"],
        prfProfile: json["prfProfile"],
        refAddressType: json["refAddressType"] == null
            ? null
            : RefAddressType.fromJson(json["refAddressType"]),
        refGeoCountry: json["refGeoCountry"] == null
            ? null
            : MobileCountryCode.fromJson(json["refGeoCountry"]),
        refGeoState: json["refGeoState"] == null
            ? null
            : MobileCountryCode.fromJson(json["refGeoState"]),
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "statusId": statusId,
        "createdBy": createdBy,
        "creationTime": creationTime,
        "updatedBy": updatedBy,
        "updateTime": updateTime,
        "id": id,
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "address4": address4,
        "city": city,
        "postcode": postcode,
        "prfProfile": prfProfile,
        "refAddressType": refAddressType?.toJson(),
        "refGeoCountry": refGeoCountry?.toJson(),
        "refGeoState": refGeoState?.toJson(),
        "active": active,
      };
}

class RefAddressType {
  int? id;
  String? tag;

  RefAddressType({
    this.id,
    this.tag,
  });

  factory RefAddressType.fromJson(Map<String, dynamic> json) => RefAddressType(
        id: json["id"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
      };
}
