
#import "RNScreenRecordPrevent.h"

@implementation RNScreenRecordPrevent {
    BOOL enabled;
}

- (instancetype)init {
    if ((self = [super init])) {
        if (@available(iOS 11.0, *)) {
           [[NSNotificationCenter defaultCenter] addObserver:self
                         selector:@selector(handleScreenCaptureChange)
            name:UIScreenCapturedDidChangeNotification object:nil];
         }
    }
    return self;
}

-(void)handleScreenCaptureChange
{
    if(self->enabled){
        UIScreen *aScreen;
        BOOL isMainScreenMirrored = NO;
        NSArray *screens = [UIScreen screens];
        for (aScreen in screens)
        {
            if ([aScreen respondsToSelector:@selector(mirroredScreen)]
                && [aScreen mirroredScreen] == [UIScreen mainScreen])
            {
                isMainScreenMirrored = YES;
            }
        }

        if (@available(iOS 11.0, *)) {
            BOOL isCaptured = [[UIScreen mainScreen] isCaptured];
            if (isCaptured && !isMainScreenMirrored) {
                [self sendEventToJS:true];
            } else {
              if(!isCaptured)
                [self sendEventToJS:false];
            }
        }
    }
    
}

#pragma mark - Public API

RCT_EXPORT_MODULE();
- (NSArray<NSString *> *)supportedEvents {
  return @[@"ScreenRecordingEvent"];
}

- (void)sendEventToJS:(BOOL) value {
    [self sendEventWithName:@"ScreenRecordingEvent" body: @{@"status": [NSNumber numberWithBool:value]}];
}

RCT_EXPORT_METHOD(enabled:(BOOL) _enable) {
    self->enabled = _enable;
}



@end
