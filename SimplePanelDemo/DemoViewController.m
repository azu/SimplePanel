//
// Created by azu on 2013/07/08.
//


#import "DemoViewController.h"
#import "CustomPanel.h"


@interface DemoViewController ()
@property(nonatomic, strong) SimplePanel *simplePanel;
@property(nonatomic, strong) CustomPanel *customPanel;
@end

@implementation DemoViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];


    self.simplePanel = [SimplePanel panelWithRootViewController:self];
    self.simplePanel.delegate = self;

    self.customPanel = [CustomPanel panelWithRootViewController:self];
    self.customPanel.delegate = self;
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];
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

#pragma mark - Button
- (IBAction)handleDefaultButton:(id) sender {
    [self.simplePanel show];
}

- (IBAction)handleCustomButton:(id) sender {
    [self.customPanel show];
}
@end