import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double radius;
  final String? profileImageUrl;

  const ProfileAvatar({
    super.key,
    required this.firstName,
    required this.lastName,
    this.radius = 26,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.lightBlueAccent,
      child: _buildAvatarContent(),
    );
  }


  Widget _buildAvatarContent() {
    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: profileImageUrl!,
          width: radius * 1.98,
          height: radius * 1.98,
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
