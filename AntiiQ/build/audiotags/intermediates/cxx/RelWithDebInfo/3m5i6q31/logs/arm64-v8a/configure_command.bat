@echo off
"C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\wpenmster\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\audiotags-1.4.1\\android" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=arm64-v8a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a" ^
  "-DANDROID_NDK=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=C:\\Users\\wpenmster\\Desktop\\channelmethod\\AntiiQ\\build\\audiotags\\intermediates\\cxx\\RelWithDebInfo\\3m5i6q31\\obj\\arm64-v8a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=C:\\Users\\wpenmster\\Desktop\\channelmethod\\AntiiQ\\build\\audiotags\\intermediates\\cxx\\RelWithDebInfo\\3m5i6q31\\obj\\arm64-v8a" ^
  "-DCMAKE_BUILD_TYPE=RelWithDebInfo" ^
  "-BC:\\Users\\wpenmster\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\audiotags-1.4.1\\android\\.cxx\\RelWithDebInfo\\3m5i6q31\\arm64-v8a" ^
  -GNinja
