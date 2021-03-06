#import "FPopBatteryStatusPoller.h"

@implementation FPopBatteryStatusPoller

-(FPopBatteryStatusPoller *) initWithDelegate:(id<TetherStatusPollerDelegate>)theDelegate
                                       status:(TetherStatus *) theStatus
{
    self = [super initWithDelegate:theDelegate status:theStatus];
    if (self) {
        self.statusURL = [NSURL URLWithString:@"http://192.168.1.1/cgi-bin/webmain.cgi?act=act_battery_status&TYPE=BISCUIT"];
    }
    return self;
}
-(void) updateStatus:(NSDictionary *) data {
    status.batteryStatus = [data objectForKey:@"STATUS"];
    NSInteger levelInt =  [(NSString *)[data objectForKey:@"LEVEL"] intValue];
    if (!status.batteryStatus) {
        levelInt = kTetherBatteryStatusLevelType_UNKNOWN;
        status.batteryStatus = @"unknown";
    }
    status.batteryLevel =  [TetherStatus stringFromLevelType:(TetherBatteryStatusLevelType) levelInt];
    // TODO do I need to do something with battery status string?
    //status.statusStr = [NSString stringWithFormat:@"%@-%@", status.level, status.status];

    [self statusUpdated];
}

@end
