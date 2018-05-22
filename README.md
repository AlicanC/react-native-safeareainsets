# react-native-safeareainsets

A component that provides you with the underlying UIView's [safeAreaInsets](https://developer.apple.com/documentation/uikit/uiview/2891103-safeareainsets) so you can position your components however you like.

## Installation

```bash
npm i react-native-safeareainsets
react-native link react-native-safeareainsets
```

## Usage

```javascript
import SafeAreaInsets from 'react-native-safeareainsets';

const MyComponent = () => (
  <SafeAreaInsets>
    {({ top, right, bottom, left}) => (
      <View style={{
        paddingTop: top,
        paddingRight: right,
        paddingBottom: bottom,
        paddingLeft: left,
      }}>
        <Text>Hello</Text>
      </View>
    )}
  </SafeAreaInsets>
)
```

## Motivation

React Native has a SafeAreaView, but it gives you no control. With SafeAreaInsets, you can have the top padding, but no bottom padding which is a very common case when designing UIs for iPhone X.
