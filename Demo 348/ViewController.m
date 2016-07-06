//
//  ViewController.m
//  Demo 348
//
//  Created by sunbohong on 16/7/6.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "ViewController.h"

#import <IASKAppSettingsViewController.h>
#import <IASKTextField.h>

@interface ViewController ()

@property (nonatomic, strong) IASKAppSettingsViewController *vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *_Nonnull note) {
        {
            IASKTextField *text = note.object;
            NSLog(@"the currentFirstResponder is %@", text.key);
        }
        {
            IASKTextField *text = [self->_vc valueForKey:@"currentFirstResponder"];
            NSLog(@"%@", text.key);
        }
     }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self test];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    self.vc = [[IASKAppSettingsViewController alloc] init];
    [self.navigationController pushViewController:self.vc animated:YES];
}

@end
