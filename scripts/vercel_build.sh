#!/usr/bin/env bash
set -e

if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git "$HOME/flutter" --depth 1 -b stable
fi

export PATH="$HOME/flutter/bin:$PATH"
flutter config --enable-web
flutter pub get
flutter build web --release
