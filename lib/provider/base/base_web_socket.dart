import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/model/challenge_room/challenge_room_user_state.dart';
import 'package:rebook/provider/challenge/challenge_provider.dart';
import 'package:rebook/provider/challenge/challenge_provider_impl.dart';
import 'package:rebook/provider/token/token_provider.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';
import 'package:rebook/view_model/matching/matching_view_model.dart';
import 'package:rebook/widget/dialog/challenge_dialog.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketController extends GetxController {
  StompClient? stompClient;
  String? token;
  late final ChallengeRepository _challengeRepository;
  @override
  void onInit() {
    super.onInit();
    final TokenProvider tokenProvider = SecureStorageFactory.tokenProvider;
    _challengeRepository = Get.find<ChallengeRepository>();
    token = tokenProvider.accessToken;
    connectToWebSocket();
  }

  /// 스톰프 연결
  void connectToWebSocket() {
    final baseUrl = dotenv.env['SOCKET_HOST'] ?? '';
    print('baseUrl: $baseUrl');
    stompClient = StompClient(
      config: StompConfig(
        url: '$baseUrl/ws-stomp',
        onConnect: (StompFrame frame) {
          print('STOMP 연결 성공');
        },
        beforeConnect: () async {
          print('STOMP 클라이언트가 연결을 시도중...');
        },
        onDisconnect: (frame) {
          print('STOMP 연결 해제');
        },
        onStompError: (StompFrame frame) {
          print('STOMP 오류: ${frame.body}');
        },
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
      ),
    );

    stompClient?.activate();
  }

  /// 챌린지 구독
  void subscribeToChannel(int challengeId) {
    // Challenge subscription
    stompClient?.subscribe(
      destination:
          '/exchange/matching.exchange/challenge.$challengeId.wait.room',
      headers: {'Authorization': 'Bearer $token'},
      callback: (frame) {
        // Ensure there's a body to decode
        if (frame.body == null) {
          print('Received a message without a body.');
          return;
        }

        Map<String, dynamic> message;
        try {
          message = json.decode(frame.body!);
        } catch (e) {
          print('Error decoding message: $e');
          return;
        }

        switch (message['messageType']) {
          case 'COMPLETE_MATCHING':
            print('Matching complete: ${frame.body}');
            Get.find<ChallengeController>().completeMatching();
            if (message['challengeRoomId'] != null) {
              int challengeRoomId = message['challengeRoomId'];
              _challengeRepository.readChallengeRoomUsers(challengeRoomId);
            }
            /// 매칭완료 전달
            break;
          case 'START_MATCHING':
            print('Matching started: ${frame.body}');
            break;
          case 'FAIL_MATCHING':
            print('Matching failed: ${frame.body}');
            break;
          default:
            print('Received an unknown messageType: ${frame.body}');
        }
      },
    );

    // Challenge entry (ENTER)
    stompClient?.send(
      destination: '/pub/matching.message/challenge.$challengeId.wait.room',
      headers: {'Authorization': 'Bearer $token'},
      body: '{"messageType": "ENTER"}',
    );
  }

  /// STOMP 해제
  @override
  void onClose() {
    stompClient?.deactivate();
    print('STOMP 연결 취소');
    super.onClose();
  }
}
