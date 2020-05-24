package com.study.flutterapp
/*  解决android模拟器无法链接网络
    cd /Users/smellzero/Library/Android/sdk/emulator
     ./emulator -avd Pixel_3_API_28 -dns-server 8.8.8.8,114.114.114.114
 */
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
