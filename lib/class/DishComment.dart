class DishComment {
  String _dishCommentId;
  String _userId;
  String _userName;
  String _userImage;
  String _dishComment;
  String _dishCommentDay;
  String _dishCommentUp;
  String _dishCommentDown;
  String _ownerStatus;

  DishComment(
      this._dishCommentId,
      this._userId,
      this._userName,
      this._userImage,
      this._dishComment,
      this._dishCommentDay,
      this._dishCommentUp,
      this._dishCommentDown,
      this._ownerStatus
      );

  String get dishCommentId => _dishCommentId;
  String get userId => _userId;
  String get userName => _userName;
  String get userImage => _userImage;
  String get dishComment => _dishComment;
  String get dishCommentDay => _dishCommentDay;
  String get dishCommentUp => _dishCommentUp;
  String get dishCommentDown => _dishCommentDown;
  String get ownerStatus => _ownerStatus;
}