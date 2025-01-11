import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  bool _isRecording = false;
  bool _flashOn = false;
  bool _isPhotoMode = true;

  @override
  void initState() {
    super.initState();
    _cameraService.initializeCamera().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _cameraService.controller != null && _cameraService.controller!.value.isInitialized
              ? CameraPreview(_cameraService.controller!)
              : const Center(child: CircularProgressIndicator()),
          _buildCameraControls(),
          _buildModeControl(),
          _buildCameraPreview(),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_cameraService.controller != null && _cameraService.controller!.value.isInitialized) {
      final size = MediaQuery.of(context).size;
      final deviceRatio = size.width / size.height;
      final cameraRatio = _cameraService.controller!.value.aspectRatio;
      final scale = cameraRatio / deviceRatio;

      final transformScale = scale > 1 ? 1 / scale : scale;

      return Transform.scale(
        scale: transformScale,
        child: Center(
          child: AspectRatio(
            aspectRatio: _cameraService.controller!.value.aspectRatio,
            child: CameraPreview(_cameraService.controller!),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildCameraControls() {
    return Positioned(
      bottom: 20,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.photo_library, color: Colors.white),
            onPressed: () {
              // gallery
               },
          ),
          GestureDetector(
            onTap: () async {
              if (_isPhotoMode) {
                await _cameraService.takePicture();
              } else {
                if (!_isRecording) {
                  await _cameraService.startVideoRecording();
                  setState(() {
                    _isRecording = true;
                  });
                } else {
                  await _cameraService.stopVideoRecording();
                  setState(() {
                    _isRecording = false;
                  });
                }
              }
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: _isRecording ? Colors.red : Colors.white,
              child: Icon(
                _isRecording ? Icons.stop : Icons.camera_alt,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.flash_on, color: _flashOn ? Colors.yellow : Colors.white),
            onPressed: () {
              _cameraService.toggleFlash();
              setState(() {
                _flashOn = !_flashOn;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModeControl() {
    return Positioned(
      top: 40,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: _isPhotoMode ? Colors.orange : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isPhotoMode = true;
              });
            },
            child: Text("PHOTO"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: !_isPhotoMode ? Colors.orange : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isPhotoMode = false;
              });
            },
            child: Text("VIDEO"),
          ),
        ],
      ),
    );
  }
}


// هاد الكلاس فيه الشغلات اللي رح تعملها الكاميرا

class CameraService {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isRecording = false;

  // Initialize the camera
  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _controller = CameraController(_cameras.first, ResolutionPreset.high);
      await _controller!.initialize();
    }
  }

  CameraController? get controller => _controller;

  Future<void> switchCamera() async {
    if (_cameras.length > 1) {
      CameraDescription newCamera = _cameras.firstWhere(
            (camera) => camera != _controller!.description,
        orElse: () => _cameras.first,
      );
      _controller = CameraController(newCamera, ResolutionPreset.high);
      await _controller!.initialize();
    }
  }

  Future<XFile?> takePicture() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    if (_isRecording) {
      throw Exception('Error: Cannot take a picture while recording.');
    }
    return await _controller!.takePicture();
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

  Future<XFile?> stopVideoRecording() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    if (!_isRecording) {
      throw Exception('Error: Not currently recording.');
    }
    _isRecording = false;
    return await _controller!.stopVideoRecording();
  }

  void toggleFlash() async {
    if (!_controller!.value.isInitialized) {
      throw Exception('Error: Camera not initialized.');
    }
    var mode = _controller!.value.flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
    await _controller!.setFlashMode(mode);
  }

  void dispose() {
    _controller?.dispose();
  }
}