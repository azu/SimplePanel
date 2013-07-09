//
// Created by azu on 2013/07/08.
//


#import "SimplePanel.h"


@interface SimplePanel ()
@property(nonatomic, strong) UIView *maskLayerView;

- (IBAction)handleCloseButton:(id) sender;
@end

@implementation SimplePanel {

}
- (instancetype)initWithRootViewController:(UIViewController *) rootViewController {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _rootViewController = rootViewController;

    return self;
}

+ (instancetype)panelWithRootViewController:(UIViewController *) rootViewController {
    return [[self alloc] initWithRootViewController:rootViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (CGFloat)showAnimateDuration {
    if (_showAnimateDuration == 0) {
        _showAnimateDuration = 0.5f;
    }
    return _showAnimateDuration;
}

- (CGFloat)closeAnimateDuration {
    if (_closeAnimateDuration == 0) {
        _closeAnimateDuration = 0.3f;
    }
    return _closeAnimateDuration;
}

- (void)show {
    NSAssert(self.rootViewController != nil, @"You have to set rootViewController,"
        " or use `showInViewController:`");
    [self showInViewController:self.rootViewController];
}

- (void)showInViewController:(UIViewController *) viewController {
    [self callWillShowSimplePanel];

    [self addToRootViewController:viewController];
    __weak typeof (self) that = self;
    self.view.center = viewController.view.center;
    self.view.transform = CGAffineTransformMakeScale(0.000001, 0.000001);
    [UIView animateWithDuration:self.showAnimateDuration
            delay:0
            options:UIViewAnimationOptionCurveEaseOut
            animations:^{
                that.view.alpha = 1.0;
                that.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }
            completion:^(BOOL finished) {
                that.view.transform = CGAffineTransformIdentity;
                [self callDidShowSimplePanel];
            }];
}

- (IBAction)handleCloseButton:(id) sender {
    [self close];
}

- (void)close {
    [self callWillCloseSimplePanel];
    __weak typeof (self) that = self;
    [UIView animateWithDuration:0.3
            animations:^{
                that.view.alpha = 0;
                that.view.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
            }
            completion:^(BOOL finished) {
                [that removeFromRootViewController];
                [that callDidCloseSimplePanel];
            }];
}


- (void)addToRootViewController:(UIViewController *) viewController {
    if ([viewController.childViewControllers containsObject:self]) {
        return;
    }
    self.rootViewController = viewController;
    // block touch layer
    self.maskLayerView = [[UIView alloc] initWithFrame:viewController.view.bounds];
    self.maskLayerView.backgroundColor = [UIColor blackColor];
    self.maskLayerView.alpha = 0.3;
    [viewController.view addSubview:self.maskLayerView];
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
    [self didMoveToParentViewController:viewController];
}

- (void)removeFromRootViewController {
    if ([self.rootViewController.childViewControllers containsObject:self] == NO) {
        return;
    }
    [self.maskLayerView removeFromSuperview];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) toInterfaceOrientation duration:(NSTimeInterval) duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    self.maskLayerView.frame = self.rootViewController.view.bounds;
}

#pragma mark - delegate

- (void)callWillShowSimplePanel {
    if ([self.delegate respondsToSelector:@selector(willShowSimplePanel:)]) {
        [self.delegate willShowSimplePanel:self];
    }
}

- (void)callDidShowSimplePanel {
    if ([self.delegate respondsToSelector:@selector(didShowSimplePanel:)]) {
        [self.delegate didShowSimplePanel:self];
    }
}

- (void)callWillCloseSimplePanel {
    if ([self.delegate respondsToSelector:@selector(willCloseSimplePanel:)]) {
        [self.delegate willCloseSimplePanel:self];
    }
}

- (void)callDidCloseSimplePanel {
    if ([self.delegate respondsToSelector:@selector(didCloseSimplePanel:)]) {
        [self.delegate didCloseSimplePanel:self];
    }
}

@end