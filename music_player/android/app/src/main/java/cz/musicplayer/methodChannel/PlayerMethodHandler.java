package cz.musicplayer.methodChannel;

import android.media.AudioManager;
import android.media.MediaPlayer;

import java.io.IOException;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @author haozhou
 */

public class PlayerMethodHandler implements MethodChannel.MethodCallHandler {
    private static final String CHANNEL_NAME = "cz.musicplayer/player";

    private static final String METHOD_PLAY = "play";
    private static final String METHOD_PAUSE = "pause";
    private static final String METHOD_RESUME = "resume";
    private static final String METHOD_STOP = "stop";
    private static final String METHOD_SEEK = "seek";
    private static final String METHOD_GET_CURRENT_POSITION = "getCurrentPosition";
    private static final String METHOD_GET_DURATION = "getDuration";
    private static final String METHOD_IS_PLAYING = "isPlaying";

    private static final String PARAM_PATH = "path";

    public static void register(BinaryMessenger messenger) {
        MethodChannel methodChannel = new MethodChannel(messenger, CHANNEL_NAME);
        methodChannel.setMethodCallHandler(new PlayerMethodHandler(methodChannel));
    }

    private MethodChannel methodChannel;
    private MediaPlayer mediaPlayer;

    private PlayerMethodHandler(MethodChannel channel) {
        methodChannel = channel;
        mediaPlayer = new MediaPlayer();
        mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);

        initPlayerListener();
    }

    private void initPlayerListener() {
        mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mediaPlayer) {
                mediaPlayer.start();
            }
        });
        mediaPlayer.setOnInfoListener(new MediaPlayer.OnInfoListener() {
            @Override
            public boolean onInfo(MediaPlayer mediaPlayer, int i, int i1) {
                return false;
            }
        });
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {

            }
        });
        mediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener() {
            @Override
            public boolean onError(MediaPlayer mediaPlayer, int i, int i1) {
                return false;
            }
        });
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        String method = methodCall.method;
        switch (method) {
            case METHOD_PLAY:
                onPlayCall(methodCall, result);
                break;
            case METHOD_PAUSE:
                onPauseCall(methodCall, result);
                break;
            case METHOD_RESUME:
                onResumeCall(methodCall, result);
                break;
            case METHOD_STOP:
                onStopCall(methodCall, result);
                break;
            case METHOD_SEEK:
                onSeekCall(methodCall, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void onPlayCall(MethodCall methodCall, MethodChannel.Result result) {
        String path = methodCall.argument(PARAM_PATH);
        if (path != null) {
            try {
                play(path);
            } catch (IOException e) {
                result.error("error", e.getMessage(), null);
            }
        } else {
            result.error("error", "path can't be null", null);
        }
    }

    private void onPauseCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    private void onResumeCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    private void onStopCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    private void onSeekCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    private void play(String path) throws IOException {
        mediaPlayer.setDataSource(path);
        mediaPlayer.prepareAsync();
    }
}
