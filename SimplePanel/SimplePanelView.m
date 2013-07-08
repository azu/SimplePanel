//
// Created by azu on 2013/07/08.
//


#import <QuartzCore/QuartzCore.h>
#import "SimplePanelView.h"


@implementation SimplePanelView {

}
- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowOpacity = 0.3f;
}
@end