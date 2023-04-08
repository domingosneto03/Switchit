import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/screens/signup/view_model/signup_view_model.dart';
import 'package:switchit/util/status_view.dart';

class MockNetworkAuthController extends Mock implements NetworkAuthController {}

void main() {
  const firstname = "Name";
  const lastname = "Surname";
  const email = "test@test.com";
  const password = "123456";

  late SignUpViewModel viewModel;

  setUpAll(() {
    viewModel = SignUpViewModel();
  });

  group("Testing firstname | lastname | email | password", () {
    test("-> Testing firstname", () {
      viewModel.name = firstname;

      String result = viewModel.name;

      expect(result, firstname);
    });
    test("-> Testing lastname", () {
      viewModel.surname = lastname;

      String result = viewModel.surname;

      expect(result, lastname);
    });
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

  group("Testing signUp - fields", () {
    test("-> Testing invalid name", () {
      viewModel.name = "";

      viewModel.signUp();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a valid name.", viewModel.message);
    });
    test("-> Testing invalid surname", () {
      viewModel.name = firstname;
      viewModel.surname = "";

      viewModel.signUp();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a valid surname.", viewModel.message);
    });
    test("-> Testing invalid email", () {
      viewModel.name = firstname;
      viewModel.surname = lastname;
      viewModel.email = "test";

      viewModel.signUp();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a valid email address.", viewModel.message);
    });
    test("-> Testing invalid password", () {
      viewModel.name = firstname;
      viewModel.surname = lastname;
      viewModel.email = email;
      viewModel.password = "1234";

      viewModel.signUp();

      expect(StatusView.messageToShow, viewModel.status);
      expect("Please enter a valid password (more than 5 characters).",
          viewModel.message);
    });
  });

  group("Testing signUp - network", () {
    test("-> Testing network request", () async {
      viewModel.name = firstname;
      viewModel.surname = lastname;
      viewModel.email = email;
      viewModel.password = password;

      MockNetworkAuthController mock = MockNetworkAuthController();

      when(() => mock.signUp(firstname, lastname, email, password))
          .thenAnswer((_) => Future.value("success"));

      mock.signUp(firstname, lastname, email, password);

      verify(() => mock.signUp(firstname, lastname, email, password)).called(1);
    });
  });
}
