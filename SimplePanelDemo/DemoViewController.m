//
// Created by azu on 2013/07/08.
//


#import "DemoViewController.h"


@interface DemoViewController ()
@property(nonatomic, strong) SimplePanel *simplePanel;
@end

@implementation DemoViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];


    self.simplePanel = [SimplePanel panelWithRootViewController:self];
    self.simplePanel.delegate = self;
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];

    [self.simplePanel showInViewController:self];
}
#pragma mark - delegate
- (void)willShowSimplePanel:(SimplePanel *) panel {
    NSLog(@"willShowSimplePanel:%@", panel);
}

- (void)didShowSimplePanel:(SimplePanel *) panel {
    NSLog(@"didShowSimplePanel:%@", panel);
}

- (void)willCloseSimplePanel:(SimplePanel *) panel {
    NSLog(@"willCloseSimplePanel:%@", panel);
}

- (void)didCloseSimplePanel:(SimplePanel *) panel {
    NSLog(@"didCloseSimplePanel:%@", panel);
}

@end