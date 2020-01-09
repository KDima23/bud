# bud_app

budget helper (aplikacja do kontrolowania własnych finansów)  

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Limits of our data
We can set your data limit with offline persistence, to use offline persistence, you don't need to make any changes to the code that you use to access Cloud Firestore data. With offline persistence enabled, the Cloud Firestore client library automatically manages online and offline data access and synchronizes local data when the device is back online.
### Configure offline persistence
When you initialize Cloud Firestore, you can enable or disable offline persistence:
For Android and iOS, offline persistence is enabled by default. To disable persistence, set the PersistenceEnabled option to false.
For the web, offline persistence is disabled by default. To enable persistence, call the enablePersistence method. Cloud Firestore's cache isn't automatically cleared between sessions. Consequently, if your web app handles sensitive information, make sure to ask the user if they're on a trusted device before enabling persistence.

