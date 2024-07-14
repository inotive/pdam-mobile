class UserData {
  UserData(
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.username,
    this.role,
  );

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String roleId;
  String username;
  RoleData? role;
}

class RoleData {
  RoleData(
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String guardName;
  String createdAt;
  String updatedAt;
}
