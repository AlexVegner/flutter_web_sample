regen:
	flutter pub get && \
	flutter pub run build_runner build --delete-conflicting-outputs


build:
	flutter build web --web-renderer canvaskit

build-html:
	flutter build web --web-renderer html

predeploy: build
	yes | cp -rf build/web ./docs/
