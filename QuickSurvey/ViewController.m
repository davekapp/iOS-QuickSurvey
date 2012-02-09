//
//  ViewController.m
//  QuickSurvey
//
//  Created by David Kapp on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize name;
@synthesize email;
@synthesize catColor;
@synthesize resultsView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setEmail:nil];
    [self setCatColor:nil];
    [self setResultsView:nil];
  
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)storeResults:(id)sender {
  NSString *csvLine = [NSString stringWithFormat:@"%@,%@,%@\n", self.name.text, self.email.text, self.catColor.text];
  NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
  
  NSFileManager *defaultManager = [NSFileManager defaultManager];
  
  if (![defaultManager fileExistsAtPath:surveyFile]) {
    [defaultManager createFileAtPath:surveyFile contents:nil attributes:nil];
  }
  
  NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:surveyFile];
  [handle seekToEndOfFile];
  [handle writeData:[csvLine dataUsingEncoding:NSUTF8StringEncoding]];
  [handle closeFile];
  
  self.name.text = @"";
  self.email.text = @"";
  self.catColor.text = @"";
}

- (IBAction)readResults:(id)sender {
  NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
  
  NSFileManager *defaultManager = [NSFileManager defaultManager];

  if (![defaultManager fileExistsAtPath:surveyFile]) {
    return;
  } else {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:surveyFile];
    NSString *surveyResults = [[NSString alloc] initWithData:[handle availableData] encoding:NSUTF8StringEncoding];
    [handle closeFile];
    self.resultsView.text = surveyResults;
  }
}

- (IBAction)hideKeyboard:(id)sender {
  [self.view endEditing:YES];
}
@end



















