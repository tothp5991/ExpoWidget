import { useAppState } from "@/hooks/useAppState";
import SharedUserDefaultsModule from "@/modules/shared-user-defaults/src/SharedUserDefaultsModule";
import WidgetRefreshModule from "@/modules/widget-refresh/src/WidgetRefreshModule";
import { useCallback, useEffect, useState } from "react";
import { Pressable, Text, View } from "react-native";

export default function Index() {
  const [counter, setCounter] = useState(0)
  const appState = useAppState()

  useEffect(() => {
    if (appState === "active") {
      (async () => {
        try {
          const count = await SharedUserDefaultsModule.getDataFromSharedUserDefaults("counter")
          setCounter(count)
        } catch (error) {
          return error
        }
      })()
    }
  }, [appState])

  const handleOnIncrement = useCallback(async () => {
    let newCount = counter + 1;
    setCounter(newCount)
    await SharedUserDefaultsModule.setDataInSharedUserDefaults(newCount, "counter")
    await WidgetRefreshModule.reloadAllTimelines()
  }, [counter])

  const handleOnDecrement = useCallback(async () => {
    let newCount = counter - 1;
    setCounter(newCount)
    await SharedUserDefaultsModule.setDataInSharedUserDefaults(newCount, "counter")
    await WidgetRefreshModule.reloadAllTimelines()
  }, [counter])

  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#FFF"
      }}
    >
      <Pressable
        onPress={handleOnIncrement}
        style={({pressed}) => [
          {
            backgroundColor: pressed ? "#EEE" : "#FAFAFA",
            padding: 16,
            borderRadius: 5,
            borderColor: "#1D1B1D",
            borderWidth: 0.5
          },
        ]}
      >
        <Text style={{ color: "#1D1B1D", fontSize: 16 }}>Increment</Text>
      </Pressable>
      <Pressable
        onPress={handleOnDecrement}
        style={({pressed}) => [
          {
            backgroundColor: pressed ? "#EEE" : "#FAFAFA",
            padding: 16,
            borderRadius: 5,
            marginTop: 10,
            borderColor: "#1D1B1D",
            borderWidth: 0.5
          },
        ]}
      >
        <Text style={{ color: "#1D1B1D", fontSize: 16 }}>Decrement</Text>
      </Pressable>
      <Text style={{ fontSize: 16, marginTop: 20 }}>Counter: {counter}</Text>
    </View>
  );
}
