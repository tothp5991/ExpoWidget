// Reexport the native module. On web, it will be resolved to WidgetRefreshModule.web.ts
// and on native platforms to WidgetRefreshModule.ts
export { default } from './src/WidgetRefreshModule';
export { default as WidgetRefreshView } from './src/WidgetRefreshView';
export * from  './src/WidgetRefresh.types';
