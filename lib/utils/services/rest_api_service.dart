import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/meal.dart';
import '../../constants/api_path.dart' as URL;
import '../helpers/process_plan_data.dart';
import './local_storage_servcie.dart';

Future<Map<String, String>> authLogin(Map<String, String> loginData) async {
  var body = json.encode({
    "user_name": loginData['username'],
    "password": loginData['password'],
  });

  try {
    final response = await http.post(
      Uri.parse(URL.login),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> userData = {
      'userId': rawResponse['data']['id'],
      'token': rawResponse['data']['token'],
      'message': rawResponse['message'],
    };

    return userData;
  } catch (error) {
    throw error;
  }
}

Future<Map<String, String>> authSignup(Map<String, String> signupData) async {
  var body = json.encode({
    "user_name": signupData['username'],
    "password": signupData['password'],
    "email": "testf@test.com",
    "weight": signupData['weight'],
    "height": signupData['height'],
  });

  try {
    final response = await http.post(
      Uri.parse(URL.signup),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> authData = {
      'userId': rawResponse['data']['id'],
      'token': rawResponse['data']['token'],
      'message': rawResponse['message'],
    };
    return authData;
  } catch (error) {
    throw error;
  }
}

Future<Map<String, String>> fetchCurrentUser() async {
  try {
    final token = await getLocalUser();
    final response = await http.get(
      Uri.parse(URL.getUser),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> userData = {
      'userName': rawResponse['data']['user_name'],
      'email': rawResponse['data']['email'],
      'height': rawResponse['data']['height'].toString(),
      'weight': rawResponse['data']['weight'].toString(),
    };
    return userData;
  } catch (error) {
    print(error);
    throw error;
  }
}

Future<Map<String, String>> updateCurrentUser(String info, String value) async {
  try {
    final token = await getLocalUser();
    var body = json.encode({info: value});

    final response = await http.patch(
      Uri.parse(URL.updateUser),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
      body: body,
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> updateInfo = {
      info: '${rawResponse['data']['user'][info]}',
    };
    return updateInfo;
  } catch (error) {
    print(error);
    throw error;
  }
}

// add preferences or allergies
Future<dynamic> addUserAttribute(List<String> attributes, String type) async {
  try {
    final token = await getLocalUser();
    var body, reqUrl;
    if (type == 'preferences') {
      body = json.encode({type: attributes});
      reqUrl = URL.addPrefs;
    } else if (type == 'allergies') {
      body = json.encode({type: attributes});
      reqUrl = URL.addAllg;
    }

    final response = await http.patch(
      Uri.parse(reqUrl),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
      body: body,
    );
    final rawResponse = json.decode(response.body);

    return rawResponse['data'][type];
  } catch (error) {
    print(error);
    throw error;
  }
}

// fetch preferences or allergies
Future<dynamic> fetchUserAttribute(String type) async {
  try {
    final token = await getLocalUser();
    var reqUrl;
    if (type == 'preferences') {
      reqUrl = URL.getPrefs;
    } else if (type == 'allergies') {
      reqUrl = URL.getAllg;
    }

    final response = await http.get(
      Uri.parse(reqUrl),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
    );
    final rawResponse = json.decode(response.body);

    return rawResponse['data'][type];
  } catch (error) {
    print(error);
    throw error;
  }
}

// Fetch details of weekly plan
Future<dynamic> fetchDetailedPlan() async {
  try {
    final token = await getLocalUser();

    final response = await http.get(
      Uri.parse(URL.getDetailPlan),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
    );
    final rawResponse = json.decode(response.body);

    return rawResponse['data']['plan'];
  } catch (error) {
    print(error);
    throw error;
  }
}

// Fetch two day's meals for home page
Future<dynamic> fetchTwoDayImage(String dateNum) async {
  try {
    final token = await getLocalUser();
    var body = json.encode({"date": dateNum});

    final response = await http.post(
      Uri.parse(URL.getTwoDays),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
      body: body,
    );
    final rawResponse = json.decode(response.body);

    return rawResponse['data']['plan'];
  } catch (error) {
    print(error);
    throw error;
  }
}

Future<Meal> fetchRandomMeal() async {
  try {
    final response = await http.get(
      Uri.parse(URL.getRandomMeal),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final rawResponse = json.decode(response.body);

    return createRandomMeal(rawResponse['data']);
  } catch (error) {
    print(error);
    throw error;
  }
}

// fetch Youtube Id
Future<dynamic> fetchYoutubeVideo(String keywords) async {
  try {
    final response = await http.get(
      Uri.parse(URL.getYoutubeLink(keywords)),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final rawResponse = json.decode(response.body);

    var videoID = '';
    if (rawResponse["items"] == null) {
      videoID = 'bGgbA3B8eO0';
    } else {
      videoID = rawResponse["items"][0]["id"]['videoId'];
    }

    return videoID;
  } catch (error) {
    print(error);
    throw error;
  }
}

// initialise a new meal
Future<dynamic> createWeeklyPlan() async {
  try {
    final token = await getLocalUser();

    final response = await http.post(
      Uri.parse(URL.createMeals),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
    );
    final rawResponse = json.decode(response.body);

    return rawResponse['data']['userPlan'];
  } catch (error) {
    print(error);
    throw error;
  }
}
