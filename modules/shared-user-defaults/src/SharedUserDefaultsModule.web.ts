import { registerWebModule, NativeModule } from 'expo';

import { ChangeEventPayload } from './SharedUserDefaults.types';

type SharedUserDefaultsModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
}

class SharedUserDefaultsModule extends NativeModule<SharedUserDefaultsModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
};

export default registerWebModule(SharedUserDefaultsModule);
