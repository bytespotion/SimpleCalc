//
//  ViewController.m
//  SimpleCalc
//
//  Created by Guillem Fernandez on 18/10/2012.
//  Copyright (c) 2012 Guillem Fernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSUInteger firstOperator;
@property (nonatomic, assign) NSUInteger secondOperator;

@end

@implementation ViewController

BOOL operationInProgress = NO;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    for (UIView *subview in self.view.subviews)
    {
        if ([subview isKindOfClass:[UIButton class]]) {
            
            UIButton *buttonView = (UIButton *)subview;
            NSLog(@"Adding action to button %@", buttonView.titleLabel.text);
            
            [buttonView addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
        }
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonPushed:(UIButton *)sender
{
    NSLog(@"Pressed button: %@", sender.titleLabel.text);
    
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        operationInProgress = YES;
    } else if ([sender.titleLabel.text isEqualToString:@"="]) {
        self.calculatorScreen.text = [NSString stringWithFormat:@"%d", self.firstOperator + self.secondOperator];
    } else {
        if (operationInProgress)
            self.secondOperator = [sender.titleLabel.text integerValue];
        else
            self.firstOperator = [sender.titleLabel.text integerValue];
    }
}

@end
