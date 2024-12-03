import { NativeModule, requireNativeModule } from 'expo';

import { SharedUserDefaultsModuleEvents } from './SharedUserDefaults.types';

declare class SharedUserDefaultsModule extends NativeModule<SharedUserDefaultsModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<SharedUserDefaultsModule>('SharedUserDefaults');
