//
//  ViewController.h
//  Copyyy
//
//  Created by Kyle He on 2018/05/27.
//  Copyright © 2018 Kyle He. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSButton *SelectAllButton;
@property (weak) IBOutlet NSButton *ClearAllButton;


@end

