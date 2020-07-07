package br.net.cartago.flutter_mobile;

import androidx.annotation.NonNull;
import android.os.Build;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "flutter.native/helper";
  private static final boolean IS_ICS_OR_LATER = Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

     new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if(methodCall.method.equals("getProxy")){
                  String proxy = getProxy();
                  result.success(proxy);
                }
              }
            }
    );
  }


  private String getProxy() {
    String proxyAddress = "";
    try {
      if (!IS_ICS_OR_LATER) {
        proxyAddress = android.net.Proxy.getHost(this);
        if (proxyAddress == null || proxyAddress.equals("")) {
          return proxyAddress;
        }
        proxyAddress += ":" + android.net.Proxy.getPort(this);
      } else {
        proxyAddress = System.getProperty("http.proxyHost");
        if (proxyAddress == null || proxyAddress.equals("")) {
          return proxyAddress;
        }
        proxyAddress += ":" + System.getProperty("http.proxyPort");
      }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return proxyAddress;
  }
}