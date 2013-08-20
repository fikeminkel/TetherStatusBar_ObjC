
#import "TetherStatus.h"

@implementation TetherStatus

@synthesize signal;
@synthesize uptime;
@synthesize signalStr;
@synthesize status;
@synthesize ipAddress;
@synthesize batteryStatus;
@synthesize batteryLevel;

static NSArray *TetherConnectionStatusSignalTypeArray = [[NSArray alloc] initWithObjects:kTetherConnectionStatusSignalTypeNamesArray];
static NSArray *TetherBatteryStatusLevelTypeArray = [[NSArray alloc] initWithObjects:kTetherBatteryStatusLevelTypeNamesArray];

+(NSString *) stringFromSignalType:(TetherConnectionStatusSignalType) type
{
    return [TetherConnectionStatusSignalTypeArray objectAtIndex:type];
}

+(TetherConnectionStatusSignalType) signalTypeFromString:(NSString *) s
{
    NSUInteger n = [TetherConnectionStatusSignalTypeArray indexOfObject:s];
    check (n != NSNotFound);
    if (n == NSNotFound) {
        n = kTetherConnectionStatusSignalType_DEFAULT;
    }
    return (TetherConnectionStatusSignalType) n;
}

+(NSString *) stringFromLevelType:(TetherBatteryStatusLevelType) type
{
    return [TetherBatteryStatusLevelTypeArray objectAtIndex:type];
}

+(TetherBatteryStatusLevelType) levelTypeFromString:(NSString *) s
{
    NSUInteger n = [TetherBatteryStatusLevelTypeArray indexOfObject:s];
    check (n != NSNotFound);
    if (n == NSNotFound) {
        n = kTetherBatteryStatusLevelType_DEFAULT;
    }
    return (TetherBatteryStatusLevelType) n;
}

+(TetherStatus *) disconnectedStatus
{
    TetherStatus *status = [[[TetherStatus alloc] init] autorelease];
    status.status = @"Unknown";
    status.signal = @"disconnected";
    status.uptime = @"0";
    status.ipAddress = @"0.0.0.0";
    return status;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"TetherStatus: { status: %@, signalStr: %@, uptime: %@, signal: %@, ipAddress: %@}", status, signalStr, uptime, signal, ipAddress];
}


/* TODO finish this
-(BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }
    if (!other || ![other isKindOfClass:[self class]]) {
        return NO;
    }
    TetherStatus *oStatus = (TetherStatus *)other;
    if (![(id) [self status] isEqual:[oStatus status]]) {
        return NO;
    }
    return YES;
}
*/
@end
