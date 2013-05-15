//
//  AppDelegate.h
//  Jarvis
//
//  Created by John Shelley on 5/15/13.
//  Copyright (c) 2013 John Shelley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NSSpeechRecognizer *listen;
}

- (void)speechRecognizer;
- (void)Hello;
- (void)Music;
- (void)Witty;
- (void)repeat;
@property (assign) IBOutlet NSWindow *window;

@end
