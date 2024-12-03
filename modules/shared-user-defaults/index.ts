// Reexport the native module. On web, it will be resolved to SharedUserDefaultsModule.web.ts
// and on native platforms to SharedUserDefaultsModule.ts
export { default } from './src/SharedUserDefaultsModule';
export { default as SharedUserDefaultsView } from './src/SharedUserDefaultsView';
export * from  './src/SharedUserDefaults.types';
