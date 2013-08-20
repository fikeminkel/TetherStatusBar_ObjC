#import "TetherStatusPoller.h"
#import "TetherStatusUtils.h"

@implementation TetherStatusPoller

@synthesize delegate;
@synthesize status;

-(TetherStatusPoller *) initWithDelegate:(id<TetherStatusPollerDelegate>)theDelegate
{
    self = [self init];
    if (self) {
        self.delegate = theDelegate;
    }
    return self;
}

-(void) statusUpdated
{
    [self.delegate statusUpdated: self.status];
}

#pragma mark -
#pragma mark "abstract" methods
-(void) startPolling:(NSTimeInterval)interval
{
    mustOverride();
}

-(void) stopPolling
{
    mustOverride();
}

@end
