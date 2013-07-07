//
//  MGAppDelegate.m
//  MangoApp
//
//  Created by Ke Yang on 7/5/13.
//  Copyright (c) 2013 Pyrus. All rights reserved.
//

#import "MGAppDelegate.h"
#import "NSData+Base64.h"

@implementation MGAppDelegate
@synthesize filePath;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    filePath = @"/Volumes/Mac/Kirk/Code/panda.jpg";
    [self.ImageWell setImage:[[NSImage alloc] initWithContentsOfFile:self.filePath]];
}

- (IBAction)onBase64Btn:(id)sender {
    /* + (NSData *)dataFromBase64String:(NSString *)aString;
    - (NSString *)base64EncodedString;
    - (NSString *)base64EncodedStringWithSeparateLines:(BOOL)separateLines;*/
    //NSData* data = [NSData dataFromBase64String:];
    // convert to base64
    NSData* data = [[NSData alloc] initWithContentsOfFile:self.filePath];
    [self.base64field setStringValue:data.base64EncodedString];
}

- (IBAction)onImageBtn:(id)sender {
    // convert to image
    //self.base64field.stringValue = [sender title];
    if([self.base64field.stringValue isEqualToString:@""]) {
        NSRunAlertPanel(@"Ouch!", @"The field is empty", nil, nil, nil);
    }
    NSData* data = [NSData dataFromBase64String:self.base64field.stringValue];
    [self.ImageWell setImage:[[NSImage alloc] initWithData:data]];
}

- (IBAction)onOpenImgBtn:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
        [openDlg setCanChooseFiles:YES];
        [openDlg setAllowsMultipleSelection:NO];
        [openDlg setCanChooseDirectories:NO];
        [openDlg setAllowedFileTypes:@[@"png", @"jpg", @"jpeg", @"bmp"]];
    if ( [openDlg runModal] == NSOKButton ) {
        self.filePath = [[openDlg URLs][0] path];
        [self.ImageWell setImage:[[NSImage alloc] initWithContentsOfFile:self.filePath]];
    }
}

- (IBAction)doMenuOpen:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setAllowedFileTypes:@[@"png", @"jpg", @"jpeg", @"bmp"]];
    if ( [openDlg runModal] == NSOKButton ) {
        self.filePath = [[openDlg URLs][0] path];
        [self.ImageWell setImage:[[NSImage alloc] initWithContentsOfFile:self.filePath]];
    }
}

- (IBAction)doMenuSave:(id)sender {

}

@end
