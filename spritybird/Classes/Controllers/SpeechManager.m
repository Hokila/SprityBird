//
//  SpeechManager.m
//  spritybird
//
//  Created by Hokila on 2014/3/22.
//  Copyright (c) 2014年 Alexis Creuzot. All rights reserved.
//

#import "SpeechManager.h"

@interface SpeechManager()
@property (nonatomic,strong) AVSpeechSynthesizer *speechSynthesizer;
@property (nonatomic, strong) NSArray* touchSoundCandidate;
@property (nonatomic, strong) NSArray* deadSoundCandidate;

@end

@implementation SpeechManager

+(instancetype)shareInstance{
    static SpeechManager *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        sharedManager.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    });
    return sharedManager;
}

-(void)setRole:(Role)aRole{
    switch (aRole) {
        case joe:
            break;
            
        default:
            break;
    }
}

-(void)TouchSpeak{
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    
    NSArray* candidates = @[@"爽",@"太爽",@"過太爽"];
    candidates = @[@"痞",@"痞客",@"痞客邦"];
    
    NSString* text = [candidates objectAtIndex:arc4random()%3];
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:[AVSpeechSynthesisVoice currentLanguageCode]];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    utterance.rate = 1.3;
    utterance.voice = voice;
    [self.speechSynthesizer speakUtterance:utterance];
}

-(void)DeadSpeak{
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    
    NSArray* candidates = @[@"你已經死了",@"好像有點弱"];
    NSString* text = [candidates objectAtIndex:arc4random()%2];
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:[AVSpeechSynthesisVoice currentLanguageCode]];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    utterance.rate = 0.3;
    utterance.voice = voice;
    utterance.volume = 1.0;
    [self.speechSynthesizer speakUtterance:utterance];}
@end
