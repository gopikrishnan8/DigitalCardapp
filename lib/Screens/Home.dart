import "package:flutter/material.dart";
import "package:flutter_webrtc/flutter_webrtc.dart";
import "package:frontend/Screens/Login_screen.dart";
import "package:frontend/Screens/Signaling.dart";
import "package:iconsax/iconsax.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');
  bool _isMicEnabled = true; // Add this line
  bool _isLocalVideoEnabled = true; // Add this line
  bool _isRemoteVideoEnabled = true; // Add this line
  IconData _videoIcon = Icons.videocam; // Add this line
  IconData _micIcon = Icons.mic;

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
    super.initState();
  }

  void _toggleVideo() {
    setState(() {
      _isLocalVideoEnabled = !_isLocalVideoEnabled;
      // _isRemoteVideoEnabled = !_isRemoteVideoEnabled;

      // Enable or disable local video track
      final localVideoTrack = _localRenderer.srcObject!.getVideoTracks().first;
      localVideoTrack.enabled = _isLocalVideoEnabled;

      // Enable or disable remote video track
      // final remoteVideoTrack =
      //     _remoteRenderer.srcObject!.getVideoTracks().first;
      // remoteVideoTrack.enabled = _isRemoteVideoEnabled;

      // Update video icon based on local video state
      _videoIcon = _isLocalVideoEnabled ? Icons.videocam : Icons.videocam_off;
    });
  }

  void _toggleMic() {
    setState(() {
      _isMicEnabled = !_isMicEnabled;

      // Enable or disable local audio track
      final localAudioTrack = _localRenderer.srcObject!.getAudioTracks().first;
      localAudioTrack.enabled = _isMicEnabled;

      // Update mic icon based on mic state
      _micIcon = _isMicEnabled ? Icons.mic : Icons.mic_off;
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg1.png'),
                  fit: BoxFit.cover) // Add rounded corners
              // Set container background color
              ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 600.0) {
                return _buildWideLayout(context);
              } else {
                return _buildMobileLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting App"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await signaling.openUserMedia(
                        _localRenderer, _remoteRenderer);
                  },
                  child: Text("Open Camera"),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    roomId = await signaling.createRoom(_remoteRenderer);
                    textEditingController.text = roomId!;
                    setState(() {});
                  },
                  child: Text("Create Room"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    signaling.joinRoom(
                      textEditingController.text.trim(),
                      _remoteRenderer,
                    );
                  },
                  child: Text("Join room"),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    signaling.hangUp(_localRenderer);
                  },
                  child: Text("Hagnup"),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Join the following meeting: "),
                  Flexible(
                    child: TextFormField(
                      controller: textEditingController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              //color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //if (_isLocalVideoVisible)
                    Container(
                      height: 400,
                      width: 400,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RTCVideoView(
                              _localRenderer,
                              mirror: true,
                            ),
                          ),
                          Container(
                            width: 400,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // IconButton(
                                  //   onPressed: () {
                                  //     //_toggleVideo();
                                  //   },
                                  //   icon: Icon(_isVideoEnabled
                                  //       ? Icons.videocam
                                  //       : Icons.videocam_off),
                                  //   tooltip: _isVideoEnabled
                                  //       ? 'Disable Video'
                                  //       : 'Enable Video',
                                  // ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Iconsax.microphone,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.call_end,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    //if (_isRemoteVideoVisible)
                    Container(
                      height: 400,
                      width: 400,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RTCVideoView(
                              _remoteRenderer,
                              mirror: true,
                            ),
                          ),
                          Container(
                            width: 400,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.videocam,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Iconsax.microphone,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.call_end,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Flutter Explained - WebRTC"),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await signaling.openUserMedia(
                      _localRenderer, _remoteRenderer);
                },
                child: Text("Open camera & microphone"),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  roomId = await signaling.createRoom(_remoteRenderer);
                  textEditingController.text = roomId!;
                  setState(() {});
                },
                child: Text("Create room"),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add roomId
                  signaling.joinRoom(
                    textEditingController.text.trim(),
                    _remoteRenderer,
                  );
                },
                child: Text("Join room"),
              ),
              // SizedBox(
              //   width: 8,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     signaling.hangUp(_localRenderer);
              //   },
              //   child: Text("Hangup"),
              // )
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      //if (_isLocalVideoVisible)
                      Container(
                          color: Colors.black,
                          width: 150,
                          height: 150,
                          child: _isLocalVideoEnabled
                              ? RTCVideoView(_localRenderer, mirror: true)
                              : Placeholder()),
                      Container(
                        width: 150,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _toggleVideo();
                                },
                                icon: Icon(
                                  _videoIcon,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                tooltip: _isLocalVideoEnabled
                                    ? 'Disable Video'
                                    : 'Enable Video',
                              ),

                              IconButton(
                                onPressed: () {
                                  _toggleMic();
                                },
                                icon: Icon(
                                  _micIcon,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                tooltip:
                                    _isMicEnabled ? 'Mute Mic' : 'Unmute Mic',
                              ),
                              //SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  signaling.hangUp(_localRenderer);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                icon: Icon(
                                  Icons.call_end,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      //if (_isRemoteVideoVisible)
                      Container(
                        color: Colors.black,
                        width: 150,
                        height: 150,
                        child: _isRemoteVideoEnabled
                            ? RTCVideoView(_remoteRenderer)
                            : Placeholder(),
                      ),
                      // Container(
                      //   width: 150,
                      //   color: const Color.fromRGBO(255, 255, 255, 1),
                      //   child: Center(
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         IconButton(
                      //           onPressed: () {
                      //             _toggleVideo();
                      //           },
                      //           icon: Icon(
                      //             _videoIcon,
                      //             size: 20,
                      //             color: Colors.black,
                      //           ),
                      //           tooltip: _isVideoEnabled
                      //               ? 'Disable Video'
                      //               : 'Enable Video',
                      //         ),

                      //         IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Iconsax.microphone,
                      //             size: 20,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         //SizedBox(width: 10),
                      //         IconButton(
                      //           onPressed: () {
                      //             signaling.hangUp(_remoteRenderer);
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) => LoginPage()));
                      //           },
                      //           icon: Icon(
                      //             Icons.call_end,
                      //             size: 20,
                      //             color: Colors.red,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
