import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraService {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isRecording = false;

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _controller = CameraController(_cameras.first, ResolutionPreset.max);
      await _controller!.initialize();
    }
  }

  CameraController? get controller => _controller;

  Future<void> switchCamera() async {
    if (_cameras.length > 1 && _controller != null) {
      await _controller!.dispose();

      CameraDescription newCamera = _cameras.firstWhere(
            (camera) => camera != _controller!.description,
        orElse: () => _cameras.first,
      );

      _controller = CameraController(newCamera, ResolutionPreset.max, enableAudio: _isRecording);
      await _controller!.initialize();
    }
  }

  Future<void> takePicture() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    if (_isRecording) {
      throw Exception('Error: Cannot take a picture while recording.');
    }
    final XFile file = await _controller!.takePicture();
    await GallerySaver.saveImage(file.path);
  }

  Future<void> startVideoRecording() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    if (_isRecording) {
      throw Exception('Error: Recording already started.');
    }
    await _controller!.startVideoRecording();
    _isRecording = true;
  }

  Future<void> stopVideoRecording() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    if (!_isRecording) {
      throw Exception('Error: Not currently recording.');
    }
    final XFile video = await _controller!.stopVideoRecording();
    _isRecording = false;
    await GallerySaver.saveVideo(video.path);
  }

  void toggleFlash(bool enable) async {
    if (controller != null && controller!.value.isInitialized) {
      await controller!.setFlashMode(enable ? FlashMode.torch : FlashMode.off);
    }
  }

  void dispose() {
    _controller?.dispose();
  }
}
