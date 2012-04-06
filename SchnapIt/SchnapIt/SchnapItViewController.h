//
//  SchnapItViewController.h
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "CaptureSessionManager.h"
#import "TagViewController.h"

@interface SchnapItViewController : UIViewController
{
    
    @private
    TagViewController *                             _tagViewController;
    UIBarButtonItem *                               _takePictureButton;
    CaptureSessionManager *                         _captureManager;
    AVCaptureStillImageOutput  *                    _stillImageOutput;
    
    IBOutlet UIToolbar *                            _toolbar;
    UIImage *                                       _picture;
    
    
}


@property(nonatomic, retain) UIImage * picture;
@property(nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property(nonatomic, retain) TagViewController *tagViewController;
@property (retain) CaptureSessionManager *captureManager;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *takePictureButton;



-(IBAction)takePicture:(id)sender;


@end
