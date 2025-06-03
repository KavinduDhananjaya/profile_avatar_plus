import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  /// The first name of the user. Used to generate initials if no image is provided.
  final String firstName;

  /// The last name of the user. Used to generate initials if no image is provided.
  final String lastName;

  /// The radius of the avatar. Determines the size of the avatar.
  final double radius;

  /// The URL of the profile image. If provided, the image is displayed instead of initials.
  final String? profileImageUrl;

  /// Callback function triggered when the edit overlay is tapped.
  /// Only works if [isEditEnabled] is true.
  final VoidCallback? onChangeProfilePicture;

  /// Determines whether the edit overlay is displayed.
  /// If true, the overlay with the edit icon is shown.
  final bool isEditEnabled;

  /// The width of the border around the avatar.
  final double borderWidth;

  /// The color of the border around the avatar.
  final Color borderColor;

  /// Custom widget for the edit icon displayed in the overlay.
  /// If not provided, a default camera icon is used.
  final Widget? editIcon;

  /// Creates a [ProfileAvatar] widget.
  ///
  /// The [firstName] and [lastName] are required to generate initials if no image is provided.
  /// The [radius] defaults to 26, [borderWidth] defaults to 2.0, and [borderColor] defaults to transparent.
  const ProfileAvatar({
    super.key,
    required this.firstName,
    required this.lastName,
    this.radius = 26,
    this.profileImageUrl,
    this.onChangeProfilePicture,
    this.isEditEnabled = false, // Default to false if not provided
    this.borderWidth = 2.0, // Default border width
    this.borderColor = Colors.transparent, // Default border color
    this.editIcon, // Custom edit icon
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEditEnabled ? onChangeProfilePicture : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: radius * 2 + borderWidth * 2,
            height: radius * 2 + borderWidth * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: borderWidth),
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.lightBlueAccent,
              child: _buildAvatarContent(),
            ),
          ),
          if (isEditEnabled && onChangeProfilePicture != null)
            Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: editIcon ?? Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: radius / 2,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatarContent() {
    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: profileImageUrl!,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => _buildInitials(),
        ),
      );
    } else {
      return _buildInitials();
    }
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        _getInitials(firstName, lastName),
        style: TextStyle(
          fontSize: (radius - 5),
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getInitials(String firstName, String lastName) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return "${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}";
    } else if (firstName.isNotEmpty) {
      return firstName[0].toUpperCase();
    } else if (lastName.isNotEmpty) {
      return lastName[0].toUpperCase();
    } else {
      return '';
    }
  }
}