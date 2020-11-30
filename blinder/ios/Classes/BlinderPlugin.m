#import "BlinderPlugin.h"
#if __has_include(<blinder/blinder-Swift.h>)
#import <blinder/blinder-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "blinder-Swift.h"
#endif

@implementation BlinderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBlinderPlugin registerWithRegistrar:registrar];
}
@end
