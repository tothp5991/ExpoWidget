import { requireNativeView } from 'expo';
import * as React from 'react';

import { WidgetRefreshViewProps } from './WidgetRefresh.types';

const NativeView: React.ComponentType<WidgetRefreshViewProps> =
  requireNativeView('WidgetRefresh');

export default function WidgetRefreshView(props: WidgetRefreshViewProps) {
  return <NativeView {...props} />;
}
