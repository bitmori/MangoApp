//
//  MGAppDelegate.h
//  MangoApp
//
//  Created by Ke Yang on 7/5/13.
//  Copyright (c) 2013 Pyrus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MGAppDelegate : NSObject <NSApplicationDelegate>

@property (copy) NSString *filePath;

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageCell *ImageWell;
@property (weak) IBOutlet NSTextField *base64field;

- (IBAction)onBase64Btn:(id)sender;
- (IBAction)onImageBtn:(id)sender;
- (IBAction)onOpenImgBtn:(id)sender;
- (IBAction)doMenuOpen:(id)sender;
- (IBAction)doMenuSave:(id)sender;

@end
