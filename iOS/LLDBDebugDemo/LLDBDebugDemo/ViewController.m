//
//  ViewController.m
//  LLDBDebugDemo
//
//  Created by ls on 2021/11/2.
//

#import "ViewController.h"
#import "StringUtility.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.backgroundColor = [UIColor grayColor];
    [self.btn setTitle:@"Test" forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(100, 300, 100, 40);
    [self.btn addTarget:self action:@selector(onTestButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

- (void)onTestButtonClicked:(id)sender
{
    static int32_t count = 0;
    
    count ++;
    
    [self.btn setTitle:[NSString stringWithFormat:@"Test %d", count] forState:UIControlStateNormal];
    
    NSString *format1 = [StringUtility formatedStringWithCount:12345];
    NSLog(@"format: %@", format1);
    
    format1 = [StringUtility formatedStringForCount:1234567890 dividedIfOverLimit:YES];
    NSLog(@"format: %@", format1);
    
    format1 = [StringUtility formatedAccompanyOrderCount:123456];
    NSLog(@"format: %@", format1);
}

@end
