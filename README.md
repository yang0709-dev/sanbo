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

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

