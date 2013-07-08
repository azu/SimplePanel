//
// Created by azu on 2013/07/08.
//


#import "CustomPanel.h"


@implementation CustomPanel {

}
- (IBAction)handleOKButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"OK" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)handleCloseButton:(id)sender {
    [self close];
}
@end