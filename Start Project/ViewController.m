//
//  ViewController.m
//  Start Project
//
//  Created by Anthonin Cocagne on 23/05/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor flatRedColor];
    ShowAlert(@"Yes", @"Success !");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
