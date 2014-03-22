//
//  RoleVC.m
//  spritybird
//
//  Created by Hokila on 2014/3/22.
//  Copyright (c) 2014年 Alexis Creuzot. All rights reserved.
//

#import "RoleVC.h"
#import "GameVC.h"
#import "UIImageView+ImageCache.h"
@interface RoleVC (){
    NSArray* roles;
}

@end

@implementation RoleVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    roles = [[NSArray alloc]initWithObjects:@"joe",@"hokila",@"janyac " ,nil];
    
    
}
#pragma -mark picker delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [roles count];;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return roles[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    //save account
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithInteger:row] forKey:@"role"];
    [defaults synchronize];
    
    //load BG
    NSString* user_account = roles[row];
    [self loadUserpicwithUserName:user_account];
}

-(void)loadUserpicwithUserName:(NSString*)user_account{
    NSString* headURL = [NSString stringWithFormat:@"http://s9.pimg.tw/avatar/%@/0/0/zoomcrop/90x90.png?v=",user_account];
    [self.headimage loadImageWithURL:[NSURL URLWithString:headURL]];
}

- (IBAction)touchGameStart:(id)sender {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.headimage.image forKey:@"rolehead"];
    [defaults synchronize];
    
    GameVC* gameVC = [self.storyboard instantiateViewControllerWithIdentifier:@"game"];
    gameVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:gameVC animated:YES completion:NULL];
}
@end
