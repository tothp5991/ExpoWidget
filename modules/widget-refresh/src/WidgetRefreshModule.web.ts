import { registerWebModule, NativeModule } from 'expo';

import { ChangeEventPayload } from './WidgetRefresh.types';

type WidgetRefreshModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
}

class WidgetRefreshModule extends NativeModule<WidgetRefreshModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
};

export default registerWebModule(WidgetRefreshModule);
