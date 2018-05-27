//
//  ViewController.m
//  Copyyy
//
//  Created by Kyle He on 2018/05/27.
//  Copyright © 2018 Kyle He. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray<NSString *> *clips;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _clips = [NSMutableArray arrayWithCapacity:0];
    
    [self startRepeatingTimer];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    
    [self.view.layer setBackgroundColor:[[NSColor whiteColor] CGColor]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSString *)getClipboard {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
    NSDictionary *options = [NSDictionary dictionary];
    NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
    if (copiedItems != nil) {
        return [copiedItems firstObject];
    }
    return nil;
}

- (void)startRepeatingTimer {
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(updateClips)
                                   userInfo:@{}
                                    repeats:YES];
    
}

- (void)updateClips {
    NSString *clip = [self getClipboard];
    if (clip == nil || ([_clips count] > 0 && [[_clips lastObject] isEqualToString:clip])) {
        return;
    }
    [_clips addObject:clip];
    [self updateTextView];
}

- (void)updateTextView {
    [_textView setString:[_clips componentsJoinedByString:@"\n"]];
}

- (IBAction)handleSelectAll:(NSButton *)sender {
    [_textView selectAll:self];
}

- (IBAction)handleClearAll:(NSButton *)sender {
    [[NSPasteboard generalPasteboard] clearContents];
    _clips = [NSMutableArray arrayWithCapacity:0];
    [self updateTextView];
}


@end
