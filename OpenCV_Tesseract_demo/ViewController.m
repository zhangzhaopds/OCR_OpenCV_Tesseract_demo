//
//  ViewController.m
//  OpenCV_Tesseract_demo
//
//  Created by 张昭 on 29/11/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "ViewController.h"
#import "DetectorManager.h"
#import "VideoViewController.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@property (assign, nonatomic) float blackValue;
@property (assign, nonatomic) float whiteValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
}
- (IBAction)detectorBtnClicked:(id)sender {
    [[DetectorManager shareInstance] detecteCardWithImage:[UIImage imageNamed:@"2.JPG"] compleate:^(NSString *result) {
        NSLog(@"%@", result);
    }];
//    [[DetectorManager shareInstance] cvCapture:self.view];
    
//    UIImage *img = [[DetectorManager shareInstance] opencvScanCard:[UIImage imageNamed:@"number2.JPG"]];
//    
//    self.myImageView.image = img;
}

- (IBAction)blackSliderClicked:(UISlider *)sender {
    self.blackValue = sender.value;
    UIImage *img = [[DetectorManager shareInstance] opencvScanCard:[UIImage imageNamed:@"number2.JPG"] withBlack:self.blackValue withWhite:self.whiteValue];
    self.myImageView.image = img;
}
- (IBAction)whiteSliderClicked:(UISlider *)sender {
    self.whiteValue = sender.value;
    UIImage *img = [[DetectorManager shareInstance] opencvScanCard:[UIImage imageNamed:@"number2.JPG"] withBlack:self.blackValue withWhite:self.whiteValue];
    self.myImageView.image = img;
}
- (IBAction)clickedCaptureBtn:(id)sender {
    VideoViewController *video = [[VideoViewController alloc] init];
    [self presentViewController:video animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
