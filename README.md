
# react-native-screen-record-prevent

## Getting started

`$ npm install react-native-screen-record-prevent --save`


### Mostly automatic installation

`$ react-native link react-native-screen-record-prevent`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-screen-record-prevent` and add `RNScreenRecordPrevent.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNScreenRecordPrevent.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.videoready.screenrecordprev;` to the imports at the top of the file
  - Add `new RNPreventRecordPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
    ```
    include ':react-native-screen-record-prevent'
    project(':react-native-screen-record-prevent').projectDir = new File(rootProject.projectDir,  '../node_modules/react-native-screen-record-prevent/android')
    ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
    ```
      compile project(':react-native-screen-record-prevent')
    ```



## Usage
#### For Android - Just enable the RNScreenRecordPrevent.
```javascript
import RNScreenRecordPrevent from 'react-native-screen-record-prevent';

RNScreenRecordPrevent.enabled(true/false);
```
#### For iOS - You can get a screen recording event from here and then make your own view controller.
```javascript
  const iosNativeEvent = new NativeEventEmitter(RNScreenRecordPrevent);
  iosNativeEvent.addListener('ScreenRecordingEvent', data => console.log(data));
```

#### For iOS - You can get a check screen recording is active or not
```javascript
  RNScreenRecordPrevent.checkRecordingStatus().then(value => {
    console.log(value);
  });
```

>Note - On iOS, we can't stop screen recording as we can on Android. For this, you'll need to add your own view controller. You can prevent screen recording by adding a view with a black backdrop over your video player when 'ScreenRecodingEvent' returns true.

