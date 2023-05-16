# Alfie client

Client in Flutter for the Alfie project.

## Cloud services

The cloud services is a separate repo. It can be found [here](https://github.com/george-radu-cs/alfie-cloud-services).

## Environment variables

```bash
cp .env.example .env
```

## Run in development mode

```bash
flutter run
```

## Generate the logo for the app

```bash
flutter pub run flutter_launcher_icons -f pubspec.yaml
```

## Generate the splash screen for the app

```bash
flutter pub run flutter_native_splash:create
```

## Rename the app

```bash
flutter pub global run rename --appname "Alfie" --target ios
flutter pub global run rename --appname "Alfie" --target android
```

## Production

Place the certificate for ssl comunication in the `assets/ca` directory and name it `alfie-cloud-services.crt`.

## For adding a new language

Multiple language definitions can be found in the `lib/l10n` directory.
