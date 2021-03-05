# Blinder
Blocking app screen capture

```dart
// Set secure screen
Blinder.open().then((value) => setState(() => isBlind = false));
```

```dart
// Clear secure screen
Blinder.blind().then((value) => setState(() => isBlind = true));
```
## TODO
 - [ ] iOS
