import 'dart:io';

import 'package:river_player/river_player.dart';
import 'package:flutter/material.dart';

import 'package:better_player_example/constants.dart';
import 'package:better_player_example/utils.dart';

class ClearKeyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClearKeyState();
}

class _ClearKeyState extends State<ClearKeyPage> {
  late BetterPlayerController _clearKeyControllerFile;
  late BetterPlayerController _clearKeyControllerBroken;
  late BetterPlayerController _clearKeyControllerNetwork;
  late BetterPlayerController _clearKeyControllerMemory;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    _clearKeyControllerFile = BetterPlayerController(betterPlayerConfiguration);
    _clearKeyControllerBroken =
        BetterPlayerController(betterPlayerConfiguration);
    _clearKeyControllerNetwork =
        BetterPlayerController(betterPlayerConfiguration);
    _clearKeyControllerMemory =
        BetterPlayerController(betterPlayerConfiguration);

    _setupDataSources();

    super.initState();
  }

  void _setupDataSources() async {
    var _clearKeyDataSourceFile = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://europe-fastly-av-mediashield-live-prod.cdn.h264.io/s/eu-central-1/x-discovery-token=Expires=1747826716&KeyName=primary&Signature=xBvtvUtMMEWKHeeMumo5Pxmbydg/v1/playlist/dash/e914bece-26b1-480d-9f45-e5a7c0c9db48/ad62f135-e06a-476c-9bfd-e97f1081eb8a.mpd?ctx=KLUv_WMa3e0KiQANBgBjjCNt-OBXlYPg1LkqXUuVYRbBDWiBGEhOYIRiBCIYIR-RIIQm-gCi48ILhEe3U0WlRYOZN7iuG9fDfLF9OrU6mVKY6TGHA48ZcmMV_72Mjzw17qa3hDKiR-zMHcojhr0JOWXl1J1Qecrk7ij6xuYLKfY4eTpS5pD2swS2RhHeIuCNNnoUwQ0fuHGENYrwdBQgDvxRqhXA6YxITDEOlYCg902iNQD2itjfrbYfxWlOJM3qryS01jI1i3GqsQ73oxEs&hdnts=exp=1747826716~acl=/s/eu-central-1/v1/playlist/dash/e914bece-26b1-480d-9f45-e5a7c0c9db48/ad62f135-e06a-476c-9bfd-e97f1081eb8a.mpd%3Fctx%3DKLUv_WMa3e0KiQANBgBjjCNt-OBXlYPg1LkqXUuVYRbBDWiBGEhOYIRiBCIYIR-RIIQm-gCi48ILhEe3U0WlRYOZN7iuG9fDfLF9OrU6mVKY6TGHA48ZcmMV_72Mjzw17qa3hDKiR-zMHcojhr0JOWXl1J1Qecrk7ij6xuYLKfY4eTpS5pD2swS2RhHeIuCNNnoUwQ0fuHGENYrwdBQgDvxRqhXA6YxITDEOlYCg902iNQD2itjfrbYfxWlOJM3qryS01jI1i3GqsQ73oxEs%26ps%3D*~hmac=0aba0e32942ad143403a163da31bc02a6c1b40497af8e97088cf6ea7e1a0fd64&ps=",
      drmConfiguration: BetterPlayerDrmConfiguration(
          drmType: BetterPlayerDrmType.clearKey,
          clearKey: BetterPlayerClearKeyUtils.generateKey({
            "01003a6fc8f21584b17193a0f982fd87":"fd46027865eaa552c8459f9d26606984",
            "01015c94a1b81a9d7afa0929be05804c":"a90ba4901de6cc59f27b327528f0bc9f",
            "0102d2a10b4c306bf67cd9c7fded0387":"3efda9b64db0a59a7a35c35b00e4b260",
            "010352400a3c6f826f235536edadf65b":"00000000000000000000000000000000",
            "01040d5472ce2c7ba4a3177a14a76675":"00000000000000000000000000000000",
            "0105cc022393c540f7c5288864af9393":"00000000000000000000000000000000"
          })),
    );

    _clearKeyControllerFile.setupDataSource(_clearKeyDataSourceFile);

    BetterPlayerDataSource _clearKeyDataSourceBroken = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      await Utils.getFileUrl(Constants.fileTestVideoEncryptUrl),
      drmConfiguration: BetterPlayerDrmConfiguration(
          drmType: BetterPlayerDrmType.clearKey,
          clearKey: BetterPlayerClearKeyUtils.generateKey({
            "f3c5e0361e6654b28f8049c778b23946":
                "a4631a153a443df9eed0593043d11111",
            "abba271e8bcf552bbd2e86a434a9a5d9":
                "69eaa802a6763af979e8d1940fb11111"
          })),
    );

    _clearKeyControllerBroken.setupDataSource(_clearKeyDataSourceBroken);

    var _clearKeyDataSourceNetwork = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      Constants.networkTestVideoEncryptUrl,
      drmConfiguration: BetterPlayerDrmConfiguration(
          drmType: BetterPlayerDrmType.clearKey,
          clearKey: BetterPlayerClearKeyUtils.generateKey({
            "f3c5e0361e6654b28f8049c778b23946":
                "a4631a153a443df9eed0593043db7519",
            "abba271e8bcf552bbd2e86a434a9a5d9":
                "69eaa802a6763af979e8d1940fb88392"
          })),
    );

    _clearKeyControllerNetwork.setupDataSource(_clearKeyDataSourceNetwork);

    var _clearKeyDataSourceMemory = BetterPlayerDataSource(
      BetterPlayerDataSourceType.memory,
      "",
      bytes: File(await Utils.getFileUrl(Constants.fileTestVideoEncryptUrl))
          .readAsBytesSync(),
      drmConfiguration: BetterPlayerDrmConfiguration(
          drmType: BetterPlayerDrmType.clearKey,
          clearKey: BetterPlayerClearKeyUtils.generateKey({
            "f3c5e0361e6654b28f8049c778b23946":
                "a4631a153a443df9eed0593043db7519",
            "abba271e8bcf552bbd2e86a434a9a5d9":
                "69eaa802a6763af979e8d1940fb88392"
          })),
    );

    _clearKeyControllerMemory.setupDataSource(_clearKeyDataSourceMemory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClearKey DRM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ClearKey Protection  with valid key.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _clearKeyControllerFile),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ClearKey Protection with invalid key.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _clearKeyControllerBroken),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ClearKey Protection Network with valid key.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _clearKeyControllerNetwork),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ClearKey Protection Asset with valid key.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _clearKeyControllerMemory),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
