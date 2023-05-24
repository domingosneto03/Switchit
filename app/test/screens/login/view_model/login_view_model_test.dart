import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/screens/login/view_model/login_view_model.dart';
import 'package:switchit/util/status_view.dart';

class MockNetworkAuthController extends Mock implements NetworkAuthController {}

void main() {
  const email = "test@test.com";
  const password = "123456";

  late LoginViewModel viewModel;

  setUpAll(() {
    viewModel = LoginViewModel();
  });

  group("Testing email | password", () {
    test("-> Testing email", () {
      viewModel.email = email;

      String result = viewModel.email;

      expect(result, email);
    });
    test("-> Testing password", () {
      viewModel.password = password;

      String result = viewModel.password;

      expect(result, password);
    });
  });

  group("Testing login - fields", () {
    test("-> Testing invalid email", () {
      viewModel.email = "test";

      viewModel.login();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a valid email address.", viewModel.message);
    });
    test("-> Testing invalid password", () {
      viewModel.email = email;
      viewModel.password = "";

      viewModel.login();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a password.", viewModel.message);
    });
  });

  group("Testing login - network", () {
    test("-> Testing network request", () async {
      viewModel.email = email;
      viewModel.password = password;

      MockNetworkAuthController mock = MockNetworkAuthController();

      when(() => mock.login(email, password))
          .thenAnswer((_) => Future.value("success"));

      mock.login(email, password);

      verify(() => mock.login(email, password)).called(1);
    });
  });
}
