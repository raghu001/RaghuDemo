//
//  ViewController.h
//  Kottet
//
//  Created by App Development on 15/04/16.
//  Copyright © 2016 App Development. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import <AVFoundation/AVCaptureOutput.h>


@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,AVCaptureMetadataOutputObjectsDelegate>
{
    IBOutlet UIImageView *imageView;
}
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *previewlayer;



@end

