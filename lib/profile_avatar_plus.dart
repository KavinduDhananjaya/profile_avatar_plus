import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double radius;
  final String? profileImageUrl;
  final VoidCallback? onChangeProfilePicture;
  final bool isEditEnabled;
  final double borderWidth;
  final Color borderColor;
  final Widget? editIcon;

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