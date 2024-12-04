# Interactive widgets in Expo managed react native apps

Detailed steps on how to create an interactive widget in an expo managed react native app can be found [here](https://www.peterarontoth.com/posts/interactive-widgets-in-expo-managed-workflows)

### Setup
```
# install packages
yarn

# run expo go debug build
yarn expo start

# create prebuild
yarn expo prebuild --platform ios

# OR create prebuild and run on device (includes the above command)
yarn expo run:ios --device

# run on a specific device
yarn expo run:ios --device "iPhone 12 Test"
```