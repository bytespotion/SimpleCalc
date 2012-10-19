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
@property (nonatomic, strong) NSMutableString* operationInProgress;

@end

@implementation ViewController

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
    
    self.operationInProgress = [NSMutableString stringWithString:@""];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)performOperation
{
    NSString* result;
    
    result = @"Error";
    
    if ([self.operationInProgress isEqualToString:@"+"]) {
        result =[NSString stringWithFormat:@"%d", self.firstOperator + self.secondOperator];
    }

    if ([self.operationInProgress isEqualToString:@"-"]) {
        
        if (self.secondOperator > self.firstOperator)
            result = @"0";
        else
            result =[NSString stringWithFormat:@"%d", self.firstOperator - self.secondOperator];
    }

    self.operationInProgress = [NSMutableString stringWithString:@""];
    return result;
}

- (void)setOperation:(NSString *)operation
{
    self.operationInProgress = [NSString stringWithString:operation];
    self.calculatorScreen.text = [NSString stringWithFormat:@"%d%@", self.firstOperator, operation];    
}

- (void)buttonPushed:(UIButton *)sender
{
    NSLog(@"Pressed button: %@", sender.titleLabel.text);

    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    

    if ([sender.titleLabel.text isEqualToString:@"="]) {
        
        self.calculatorScreen.text = [self performOperation];
        
    } else if (![f numberFromString: sender.titleLabel.text]) { // Used NSNumberFormatter to determine if the button is an operation

        [self setOperation:sender.titleLabel.text];

    } else {
        if (![self.operationInProgress isEqualToString:@""]) {
            self.secondOperator = [sender.titleLabel.text integerValue];
            self.calculatorScreen.text = [NSString stringWithFormat:@"%d%@%d", self.firstOperator, self.operationInProgress, self.secondOperator];
        }
        else {
            self.firstOperator = [sender.titleLabel.text integerValue];
            self.calculatorScreen.text = sender.titleLabel.text;
        }        
    }
}

@end
