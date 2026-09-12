# Sanbo

An application to easily sandbox non-flatpak programs, inspired by [Flatseal](https://github.com/tchx84/Flatseal).

## Compiling

1. [Download and setup flutter](https://docs.flutter.dev/install)
2. Disable flutter analytics

```bash
flutter config --no-analytics
flutter --disable-analytics
```

3. Clone this repository and cd into the directory

```bash
git clone https://github.com/yang0709-dev/sanbo.git
cd sanbo
```

4. Compile the app

```bash
flutter build linux
```

The binary file will be at `./build/linux/x64/release/bundle/sanbo`

## Licensing

See [LICENSING](./LICENSING.md)
