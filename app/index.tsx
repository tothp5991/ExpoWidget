import { useState } from "react";
import { Pressable, Text, View } from "react-native";

export default function Index() {
  const [counter, setCounter] = useState(0);
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
        onPress={() => {
          setCounter(counter + 1);
        }}
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
        onPress={() => {
          setCounter(counter - 1);
        }}
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
