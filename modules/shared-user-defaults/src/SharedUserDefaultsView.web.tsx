import * as React from 'react';

import { SharedUserDefaultsViewProps } from './SharedUserDefaults.types';

export default function SharedUserDefaultsView(props: SharedUserDefaultsViewProps) {
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
