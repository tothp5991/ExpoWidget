import { requireNativeView } from 'expo';
import * as React from 'react';

import { SharedUserDefaultsViewProps } from './SharedUserDefaults.types';

const NativeView: React.ComponentType<SharedUserDefaultsViewProps> =
  requireNativeView('SharedUserDefaults');

export default function SharedUserDefaultsView(props: SharedUserDefaultsViewProps) {
  return <NativeView {...props} />;
}
