//
//  AppDelegate.m
//  Jarvis
//
//  Created by John Shelley on 5/15/13.
//  Copyright (c) 2013 John Shelley. All rights reserved.
//

#import "AppDelegate.h"

NSSpeechSynthesizer *synth;

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    synth = [[NSSpeechSynthesizer alloc] init];
    NSArray *cmds = [NSArray arrayWithObjects:@"Jarvis", @"how are you", @"Play some music", nil];
    
    listen = [[NSSpeechRecognizer alloc] init];
    [listen setCommands:cmds];
    [listen setDelegate:self];
    [listen startListening];
    [listen setListensInForegroundOnly:NO];
    [listen setBlocksOtherRecognizers:YES];
}

- (void)speechRecognizer:(NSSpeechRecognizer *)sender didRecognizeCommand:(id)command {
    NSBeep();
    NSLog((NSString *)command);
    if ([(NSString *)command isEqualToString:@"Jarvis"]) {
        [self Hello];
    } else if([(NSString *)command hasSuffix:@"how are you"]){
        [self Witty];
    }else if ([(NSString *)command isEqualToString:@"Play some music"]){
        [self Music];
    }else if([(NSString *)command isEqualToString:@"???"]){
        [self repeat];
    }
}

-(void)Hello
{
    
    NSArray *sayings = [NSArray arrayWithObjects:@"Hello sir, How are you today?", @"How can I be of service?", @"Do you need me to check your email?", nil];
    int randomHello = arc4random() % [sayings count];
    [synth startSpeakingString:([sayings objectAtIndex:randomHello])];
}


-(void)Music
{
    [[NSWorkspace sharedWorkspace] launchAppWithBundleIdentifier:@"com.apple.iTunes" options: NSWorkspaceLaunchDefault | NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifier:nil];
    NSString *text = @"What would you like to hear sir?";
    [synth startSpeakingString:(text)];
    
    
}

-(void)Witty
{
    NSArray *sayings = [NSArray arrayWithObjects:@"As great as ever!", @"Great sir, systems are at 100 percent", @"I could use some upgrades in the near future", nil];
    int randomSaying = arc4random() % [sayings count];
    [synth startSpeakingString:([sayings objectAtIndex:randomSaying])];
}
-(void)repeat
{
    NSString *text = @"Can you please say that again?";
    [synth startSpeakingString:(text)];
}
@end
