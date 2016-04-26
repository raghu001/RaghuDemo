//
//  ViewController.m
//  Kottet
//
//  Created by App Development on 15/04/16.
//  Copyright © 2016 App Development. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}


- (AVCaptureVideoOrientation)interfaceOrientationToVideoOrientation:(UIInterfaceOrientation)orientation {
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            return AVCaptureVideoOrientationPortrait;
        case UIInterfaceOrientationPortraitUpsideDown:
            return AVCaptureVideoOrientationPortraitUpsideDown;
        case UIInterfaceOrientationLandscapeLeft:
            return AVCaptureVideoOrientationLandscapeLeft;
        case UIInterfaceOrientationLandscapeRight:
            return AVCaptureVideoOrientationLandscapeRight;
        default:
            break;
    }
    NSLog(@"Warning - Didn't recognise interface orientation (%ld)",(long)orientation);
    return AVCaptureVideoOrientationPortrait;
}
- (IBAction)selectPhotos
{
    
    
    UIImagePickerController *picker=[[UIImagePickerController alloc] init];
    picker.delegate=self;
#if TARGET_IPHONE_SIMULATOR
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    picker.showsCameraControls=YES;
  
    [picker setCameraFlashMode:UIImagePickerControllerCameraFlashModeOff];
#endif
    CGAffineTransform transform=picker.view.transform;
    transform= CGAffineTransformMakeRotation(-90*M_PI/180);
    [picker setCameraViewTransform:transform];
    [self presentModalViewController:picker animated:YES];
    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    picker.delegate = self;
//    
//    [self presentModalViewController:picker animated:YES];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    imageView.image = image;
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //If you don't want to support multiple orientations uncomment the line below
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    //return [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
