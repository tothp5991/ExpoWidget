import * as React from 'react';

import { WidgetRefreshViewProps } from './WidgetRefresh.types';

export default function WidgetRefreshView(props: WidgetRefreshViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        src={props.url}
        onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
