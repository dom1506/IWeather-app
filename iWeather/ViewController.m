//
//  ViewController.m
//  iWeather
//
//  Created by Mr.Bi on 8/14/15.
//  Copyright (c) 2015 Mr.Bi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *nhietdo;
@end

@implementation ViewController{
    NSArray * quotes;
    NSArray *locations;
    NSArray *photoFiles;
    NSArray *dv;
}
int doC = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Hãy cứ khát khao, Hãy cứ dại khờ", @"Hãy quay về hướng mặt trời, và bạn sẽ không thấy bóng tối.", @"ừng khóc vì những gì đã qua, hãy cười vì nó đã xảy", @"Nay tuy châu chấu đá voi. Nhưng mai voi sẽ bị lòi ruột ra"];
    locations = @[@"Hai Ba Trung, Hanoi", @"Ho Chi Minh", @"Hai Phong", @"Thanh Hoa", @"Nghe An"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
     dv = @[@"C",@"F"];
}

- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString *str = [NSString stringWithFormat:@"%2.1f" ,[self getTemperature]];
    [self.temperature setTitle:str forState:UIControlStateNormal];
    
}
-(float) getTemperature{
    return 11.0 +arc4random_uniform(18) +(float)arc4random() / (float) INT32_MAX;
}
- (IBAction)convert:(id)sender {
    
      self.nhietdo.text = dv[doC];
    NSLog(@"%i",doC);
    NSLog(@"%@", self.temperature.titleLabel.text);
    
    if (doC == 1) {
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f",[self.temperature.titleLabel.text floatValue]*1.8+32] forState:UIControlStateNormal];
        doC=0;
    }else{
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f", ([self.temperature.titleLabel.text floatValue]-32)/1.8] forState:UIControlStateNormal];
        doC=1;
    }
    NSLog(@"%@" ,self.temperature.titleLabel.text);
    
}

@end
