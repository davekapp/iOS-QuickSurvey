//
//  ViewController.h
//  QuickSurvey
//
//  Created by David Kapp on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *catColor;
@property (weak, nonatomic) IBOutlet UITextView *resultsView;

- (IBAction)storeResults:(id)sender;
- (IBAction)readResults:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
