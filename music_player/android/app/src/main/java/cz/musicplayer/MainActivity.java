package cz.musicplayer;

import android.os.Bundle;

import cz.musicplayer.methodChannel.PlayerMethodHandler;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    PlayerMethodHandler.register(getFlutterView());
  }
}
