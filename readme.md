# SimplePanel

Simple modal panel window library.

* similar [UAModalPanel](https://github.com/coneybeare/UAModalPanel "UAModalPanel")
* lightweight
* easy to customize

## Installation

* Drap and Drop `SimplePanle/` to your project.

## Usage


```objc
- (void)viewDidLoad {
    [super viewDidLoad];

    self.simplePanel = [SimplePanel panelWithRootViewController:self];
    self.simplePanel.delegate = self;
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];
    [self.simplePanel show];
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
```

### Interface

``` objc
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
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT