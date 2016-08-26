//
//  QRController.h
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero on 2015-03-12.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Maps.h"

@interface QRController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;
- (IBAction)startStopReading:(id)sender;
@property (nonatomic,weak) id<MapviewProtocol> delegate;

@end