# Profile Avatar Plus

profile_avatar_plus is a lightweight, customizable Flutter package that provides an elegant solution for displaying user avatars in your applications.

## Features
- Display user initials or a profile image.
- Customizable border with adjustable width and color.
- Optional edit overlay with customizable icon.
- Callback for handling profile picture changes.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  profile_avatar_plus: ^1.0.1
```

---

## Usage

Import the package in your Dart file:
```
import 'package:loadix/loadix.dart';
```

1. Basic Profile Avatar with Initials

This instance of ProfileAvatar displays the user's initials because no profile image URL is provided.

```

ProfileAvatar(
  firstName: "John",
  lastName: "Doe",
  radius: 100,
),

```

2. Profile Avatar with Image and No Edit Option

```
ProfileAvatar(
  firstName: "John",
  lastName: "Doe",
  radius: 100,
  profileImageUrl: "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
  isEditEnabled: false,
),

```

3. Profile Avatar with Image and Edit Option

```
ProfileAvatar(
  firstName: "John",
  lastName: "Doe",
  radius: 100,
  profileImageUrl: "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
  onChangeProfilePicture: () {
    log("Profile picture changed");
  },
  isEditEnabled: true,
),

```

4. Profile Avatar with Custom Border

```
ProfileAvatar(
  firstName: "John",
  lastName: "Doe",
  radius: 100,
  profileImageUrl: "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
  onChangeProfilePicture: () {
    log("Profile picture changed");
  },
  isEditEnabled: true,
  borderWidth: 2,
  borderColor: Colors.red,
),
```
5. Profile Avatar with Custom Edit Icon

```
ProfileAvatar(
  firstName: "John",
  lastName: "Doe",
  radius: 100,
  profileImageUrl: "https://i.postimg.cc/wBK7N78c/photo-1535713875002-d1d0cf377fde.jpg",
  onChangeProfilePicture: () {
    log("Profile picture changed");
  },
  isEditEnabled: true,
  editIcon: Icon(Icons.edit, color: Colors.blue, size: 40),
),
```


## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

MIT License © Kavindu Dhannjaya

---

Happy coding! 🚀
