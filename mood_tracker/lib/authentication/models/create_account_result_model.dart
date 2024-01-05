class CreateAccountResultModel {
  final String userId;
  final String email;

  CreateAccountResultModel({required this.userId, required this.email});
  CreateAccountResultModel.empty()
      : userId = '',
        email = '';
}
