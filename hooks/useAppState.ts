import { useEffect, useState } from "react";
import { AppState } from "react-native";

export function useAppState() {
  const [appState, setAppState] = useState(AppState.currentState)
  useEffect(() => {
    const subscription = AppState.addEventListener('change', setAppState);
    return () => {
      subscription.remove()
    }
  }, [])
  return appState;
}