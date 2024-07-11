package com.example.dars75_yandexmap_restaurant

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("4a88d18c-0a0b-40e9-9f79-0d4d9372ab9e")
        super.configureFlutterEngine(flutterEngine)
    }
}