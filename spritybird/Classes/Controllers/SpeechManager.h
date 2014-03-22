//
//  SpeechManager.h
//  spritybird
//
//  Created by Hokila on 2014/3/22.
//  Copyright (c) 2014年 Alexis Creuzot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVSpeechSynthesis.h>
#import "roledefine.h"

@interface SpeechManager : NSObject


+(instancetype)shareInstance;
-(void)setRole:(Role)aRole;
-(void)TouchSpeak;
-(void)DeadSpeak;
@end
