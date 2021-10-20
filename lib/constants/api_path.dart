const baseURL = 'https://health-hero-team-ra.herokuapp.com';
const login = '$baseURL/users/login';
const signup = '$baseURL/users';
const getUser = '$baseURL/users/me';
const updateUser = '$baseURL/users/me';
const addPrefs = '$baseURL/preferences';
const addAllg = '$baseURL/allergies';
const getPrefs = '$baseURL/preferences';
const getAllg = '$baseURL/allergies';
const getDetailPlan = '$baseURL/meal/all';
const getTwoDays = '$baseURL/meal/twodays';
const getRandomMeal = '$baseURL/meal/random';
const createMeals = '$baseURL/meal';

String getYoutubeLink(String keywords) {
  return 'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$keywords&';
}
