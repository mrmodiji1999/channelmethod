@echo off
"C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\wpenmster\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\audiotags-1.4.1\\android" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=x86" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86" ^
  "-DANDROID_NDK=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\ndk\\26.1.10909125\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\wpenmster\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=C:\\Users\\wpenmster\\Desktop\\channelmethod\\AntiiQ\\build\\audiotags\\intermediates\\cxx\\Debug\\6j4j234d\\obj\\x86" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=C:\\Users\\wpenmster\\Desktop\\channelmethod\\AntiiQ\\build\\audiotags\\intermediates\\cxx\\Debug\\6j4j234d\\obj\\x86" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BC:\\Users\\wpenmster\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\audiotags-1.4.1\\android\\.cxx\\Debug\\6j4j234d\\x86" ^
  -GNinja
