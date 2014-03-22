//
//  RoleVC.h
//  spritybird
//
//  Created by Hokila on 2014/3/22.
//  Copyright (c) 2014年 Alexis Creuzot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoleVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *rolePicker;
@property (weak, nonatomic) IBOutlet UIImageView *headimage;

- (IBAction)touchGameStart:(id)sender;

@end
