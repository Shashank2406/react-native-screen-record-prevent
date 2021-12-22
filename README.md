
# react-native-screen-record-prevent

## Getting started

`$ npm install react-native-screen-record-prevent --save`

## fork: https://github.com/Shashank2406/react-native-screen-record-prevent

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
  - Add `import com.shashankdev.screenrecordprev;` to the imports at the top of the file
  - Add `new RNPreventRecordPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-screen-record-prevent'
  	project(':react-native-screen-record-prevent').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-screen-record-prevent/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-screen-record-prevent')
  	```



## Usage
```javascript
import RNScreenRecordPrevent from 'react-native-screen-record-prevent';

RNScreenRecordPrevent.enabled(true/false);
```
  