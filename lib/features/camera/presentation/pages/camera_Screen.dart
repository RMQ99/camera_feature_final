// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/camera_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  final ImagePicker _picker = ImagePicker();
  bool _flashOn = false;
  bool _isRecording = false;
  late bool _isPhotoMode = true;
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _cameraService.initializeCamera().then((_) {
      if (mounted) setState(() {});
    });
    _stopwatch = Stopwatch();
  }

  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print("Image Path: ${image.path}");
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: OrientationBuilder(
              builder:(context, orientation) {
              return Stack(
              children: [
              _buildCameraPreview(),
              if (orientation == Orientation.portrait) _buildPortraitControls(),
              _buildTopBar(),
              _buildBottomControls(vertical: true),
              ],
              );
              }
              ),


        ),
      )
    );
  }

  Widget _buildCameraPreview() {
    if (_cameraService.controller != null && _cameraService.controller!.value.isInitialized) {
      return CameraPreview(_cameraService.controller!);

    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildPortraitControls() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_isRecording && !_isPhotoMode) _buildTimer(),
        _buildModeControls(),
      ],
    );
  }

  Widget _buildTimer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "${_stopwatch.elapsed.inMinutes}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }

  Widget _buildModeControls() {
    return SizedBox(
      height: 70,
      child: Container(
        height: 100,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => setState(() {
                _isPhotoMode = false;
                _stopwatch.start();
              }),
              child: Text("VIDEO",style: TextStyle(color: !_isPhotoMode ? Colors.yellow : Colors.white)),
            ),
            TextButton(
              onPressed: () => setState(() {
                _isPhotoMode = true;
                _stopwatch.reset();
              }),
              child: Text("PHOTO",style: TextStyle(color: _isPhotoMode ? Colors.yellow : Colors.white)),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTopBar() {
    return Positioned(
      top: 13,
      right: 13,
      child: IconButton(
        icon: Icon(Icons.flash_on, color: _flashOn ? Colors.yellow : Colors.white , size: 30,),
        onPressed: _toggleFlash,
      ),
    );

  }

  Widget _buildBottomControls({bool vertical = false}) {
    return Positioned(
      bottom: 65,
      left: 40,
      right: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Icon(Icons.photo_library, color: Colors.white, size: 30,),
            onPressed: () {
              _openGallery();
            },
          ),
          IconButton(
            icon: Icon(_isRecording ? Icons.stop : Icons.circle,
              color: _isPhotoMode ? Colors.white : Colors.red,
              size: 100,
            ),
            onPressed: () {
              if (_isPhotoMode) {
                _cameraService.takePicture();
              } else {
                if (!_isRecording) {
                  _cameraService.startVideoRecording();
                  _stopwatch.start();
                  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    setState(() {});
                  });
                  setState(() => _isRecording = true);
                } else {
                  _cameraService.stopVideoRecording();
                  _stopwatch.stop();
                  _timer.cancel();
                  setState(() => _isRecording = false);
                }
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.change_circle, color: Colors.white,size: 30,),
            onPressed: () => _cameraService.switchCamera().then((_) => setState(() {})),
          ),
        ],
      ),
    );
  }

  void _toggleFlash() {
    setState(() {
      _flashOn = !_flashOn;
      _cameraService.toggleFlash(_flashOn);
    });
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _stopwatch.stop();
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }
}