//
//  MyDocument.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "MyDocument.h"
#import "CanvasView.h"

@implementation MyDocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    */
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    /*
    Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    */
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return YES;
}

- (IBAction) toggleShowPoints:(id)sender
{
    _view.showPoints = !_view.showPoints;
    [_view setNeedsDisplay:YES];
}

- (IBAction) toggleSimplifyPath:(id)sender
{
    _view.simplify = !_view.simplify;
    [_view setNeedsDisplay:YES];    
}

- (IBAction) toggleFitCurve:(id)sender
{
    _view.fitCurve = !_view.fitCurve;
    [_view setNeedsDisplay:YES];
}

- (BOOL)validateUserInterfaceItem:(id < NSValidatedUserInterfaceItem >)anItem
{
    NSMenuItem *menuItem = (NSMenuItem *)anItem;
    if ( [anItem action] == @selector(toggleShowPoints:) ) {
        [menuItem setState:_view.showPoints ? NSOnState : NSOffState];
    } else if ( [anItem action] == @selector(toggleSimplifyPath:) ) {
        [menuItem setState:_view.simplify ? NSOnState : NSOffState];        
    } else if ( [anItem action] == @selector(toggleFitCurve:) ) {
        [menuItem setState:_view.fitCurve ? NSOnState : NSOffState];
    }
    
    return YES;
}

@end