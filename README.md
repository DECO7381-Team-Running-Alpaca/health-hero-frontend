# Health-Hero Frontend

A mobile application runs on both ios and Android. \
DECO7381 project developed by Team Running Alpaca.

## Technical Stack

### 1. Requirement

The project is develope using [Flutter](https://flutter.dev/) framework with [Dart](https://dart.dev/). If you want to run the application locally, please set up your environment step by steps in the next section.

- [Flutter](https://flutter.dev/)
- [Xcode (for ios only)](https://developer.apple.com/xcode/)
- [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwzt6LBhBeEiwAbPGOgY86gDxGBI3UyjmEAlHCSzgHocGQbuyC3y7yptHTCW0u77Lflp71mRoCNkgQAvD_BwE&gclsrc=aw.ds)
- [Visual Studio Code (most recommended)](https://code.visualstudio.com/)

Recommend mobile devices to run the application (any other mobile devices or emulator will also be fine to run):

- Most recommended: **iPhone 12 Plus Max/ iPhone 13 Plus Max** (emulator or personal device)
- 7.4 rollable Android (emulator)

## GitHub Repository

https://github.com/DECO7381-Team-Running-Alpaca/health-hero-frontend \
Our team has a GitHun organization [DECO7381-Team-Running-Alpaca](https://github.com/DECO7381-Team-Running-Alpaca) \
Currently all the repos are private to ensure the academic integrity, please contact [Zhenyuan Li](mailto:zhenyuan.li@uqconnect.edu.au) for authorization.

## Running on Project on emulator or real deice

### Steps

1. Following the [official guide](https://flutter.dev/docs/get-started/install) install flutter package locally based on your system. Your could use following command to check whether your have install all the

```sh
flutter doctor
```

2. Start an emulator or connect your mobile device with laptop

3. Navigate to the project and run the following command in the terminal

```sh
flutter run
```

### Recommend Setup Video on Youtube

Setting up the mobile develop environment for starter is really complex and not friendly for new users. Here are some great tutorial video on Youtube to help you do that

- Windows with Android Studio
  by [Bitfumes](https://www.youtube.com/channel/UC_hG9fglfmShkwex1KVydHA)
  https://www.youtube.com/watch?v=fDnqXmLSqtg
- MacOS with Android Studio by [London App Brewery](https://www.youtube.com/channel/UCVD5Vh9LhLBxp3o1vRNyf_w)
  https://www.youtube.com/watch?v=hL7pkX1Pfko
- **Recommend:** MacOS with Visual Studio Code by [Tadas Petra](https://www.youtube.com/channel/UCNaJHBXsvbfkItVMNmzmTPQ)
  https://www.youtube.com/watch?v=U4TJ5ITGe5Y
- **Recommend:** Windows with Visual Studio Code by [Codes Easy](https://www.youtube.com/watch?v=5izFFbdHnWY)
  https://www.youtube.com/watch?v=5izFFbdHnWY

### Troubleshooting on MacOS

If your have encountered several common errors:

- 'IOS Xcode Build error : 'metal_delegate.h' file not found'
- 'tensorflow/lite/kernels/register.h' file not found
- ‘vector’ file not found
- or other not found errors

It is because our application use Tensorflow Lite to deploy th pre-trained deep learning model, and it requires compile the source code in Object C++, which is not a default setting in Xcode. Please follow the following steps to fix the error.

1. Go to /ios folder and found the podfile.lock file. Change the TensorflowLiteC to 2.2.0
   ![step1](/assets/readMeDoc/step1.png?raw=true 'troubleshooting1')
2. In your terminal, navigate to ios folder and run the command:

```sh
cd ios
pod install
```

3. Start the Xcode and open the Runner.xcworkspace file in the project. Then, Click as the following on the project \
    pageRunner > Targets > Runner > Build Settings, search Compile Sources As, change the value to Objective-C++ \
   ![step2](/assets/readMeDoc/step2.png?raw=true 'troubleshooting2')
   ![step3](/assets/readMeDoc/step3.png?raw=true 'troubleshooting3')
4. It should be fine now, you could run the project as usual.

## Contact

If you encounter any difficulties during running the server or have question about the application, please contact Zhenyuan Li \
Email:
zhenyuan.li@uqconnect.edu.au \
Discord:
Vincent0Li#6646 \
GitHub:
[Zhenyuan-Li](https://github.com/Zhenyuan-Li)
