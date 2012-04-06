//
//  SchnapItViewController.m
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SchnapItViewController.h"



@implementation SchnapItViewController

@synthesize captureManager=             _captureManager;
@synthesize toolbar =                   _toolbar;
@synthesize tagViewController=          _tagViewController;
@synthesize takePictureButton =         _takePictureButton;
@synthesize stillImageOutput =          _stillImageOutput;
@synthesize picture =                   _picture;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.tagViewController = [[[TagViewController alloc] init] autorelease];
    
    [self setCaptureManager:[[[CaptureSessionManager alloc] init] autorelease]];
    
	[[self captureManager] addVideoInput];
    
	[[self captureManager] addVideoPreviewLayer];
	CGRect layerRect = CGRectMake(0, 0, 320, 375);
	[[[self captureManager] previewLayer] setBounds:layerRect];
	[[[self captureManager] previewLayer] setPosition:CGPointMake(CGRectGetMidX(layerRect),
                                                                  CGRectGetMidY(layerRect))];
	[[[self view] layer] addSublayer:[[self captureManager] previewLayer]];
    [[self view] addSubview:self.toolbar];
    
    [self.captureManager captureSession].sessionPreset = AVCaptureSessionPresetPhoto;
    
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    [[self.captureManager captureSession] addOutput:self.stillImageOutput];
    [[self.captureManager captureSession] startRunning];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.takePictureButton = nil;
    
    [super viewDidUnload];    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//called when parent app recieved memory warning
-(void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
    
}

-(void)dealloc
{
    [self.takePictureButton release];
    
    
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Camera Actions



-(IBAction)takePicture:(id)sender
{
    AVCaptureConnection *videoConnection = nil;
	for (AVCaptureConnection *connection in self.stillImageOutput.connections)
	{
		for (AVCaptureInputPort *port in [connection inputPorts])
		{
			if ([[port mediaType] isEqual:AVMediaTypeVideo] )
			{
				videoConnection = connection;
				break;
			}
		}
		if (videoConnection) { break; }
	}
	NSLog(@"about to request a capture from: %@", self.stillImageOutput);
    
    
	[self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error)
     {
         
         
         
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         self.picture = [[UIImage alloc] initWithData:imageData];
         
         [self.tagViewController setImage:self.picture];
         
         [self.navigationController pushViewController:self.tagViewController animated:YES];
         
         NSLog(@"%@",self.picture);
         
         //set picture, push controller...
         // self.vImage.image = image;
	 }];
    
    
    
}

@end
