import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

final userIdTokenResult = IdTokenResult({
  'authTimestamp': DateTime.now().millisecondsSinceEpoch,
  'claims': {'role': 'admin'},
  'token': 'some_long_token',
  'expirationTime':
      DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
  'issuedAtTimestamp':
      DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch,
  'signInProvider': 'phone',
});

void main() {
  setUp(() {});

  test('Returns no user if not signed in', () async {
    final auth = MockFirebaseAuth();
    final user = auth.currentUser;
    expect(user, isNull);
  });

  group('Emits an initial User? on startup.', () {
    test('null if signed out', () async {
      final auth = MockFirebaseAuth();
      expect(auth.authStateChanges(), emits(null));
      // expect(auth.userChanges(), emitsInOrder([isA<User>()]));
    });
    test('a user if signed in', () async {
      final auth = MockFirebaseAuth(signedIn: true);
      expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([isA<User>()]));
    });
  });

  group('Returns a mocked user user after sign up', () {
    test('with email and password', () async {
      final email = 'some@email.com';
      final password = 'some!password';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      expect(user.email, email);
      final providerData = user.providerData;
      expect(providerData.length, 1);
      expect(providerData.first.providerId, 'password');
      expect(providerData.first.email, 'some@email.com');
      expect(providerData.first.uid, user.uid);

      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
      expect(user.isAnonymous, isFalse);
      expect(user.emailVerified, isTrue);
    });
  });
  group('testing Firebase Login', () {
    final mockUser = MockUser(
        email: 'test@gmail.com',
        displayName: 'Tester',
        uid: 'testUid',
        isAnonymous: false,
        idTokenResult: userIdTokenResult);

    test('with email and password', () async {
      final auth = MockFirebaseAuth(mockUser: mockUser);
      final result = await auth.signInWithEmailAndPassword(
          email: 'test@gmail.com', password: '123456');
      final user = result.user;
      expect(user, mockUser);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    });
  });
}
