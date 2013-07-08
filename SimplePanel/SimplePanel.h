//
// Created by azu on 2013/07/08.
//


#import <Foundation/Foundation.h>

@class SimplePanel;

@protocol SimplePanelDelegate
@optional
- (void)willShowSimplePanel:(SimplePanel *) panel;

- (void)didShowSimplePanel:(SimplePanel *) panel;

- (void)willCloseSimplePanel:(SimplePanel *) panel;

- (void)didCloseSimplePanel:(SimplePanel *) panel;
@end

@interface SimplePanel : UIViewController
@property(nonatomic, weak) UIViewController *rootViewController;
@property(nonatomic) NSObject <SimplePanelDelegate> *delegate;
// Defaults : 0.5f
@property(nonatomic) CGFloat showAnimateDuration;
// Defaults : 0.3f
@property(nonatomic) CGFloat closeAnimateDuration;

- (instancetype)initWithRootViewController:(UIViewController *) rootViewController;

+ (instancetype)panelWithRootViewController:(UIViewController *) rootViewController;

#pragma mark - show
// You must initialize rootViewController, before call this
- (void)show;

- (void)showInViewController:(UIViewController *) viewController;

- (void)close;
@end