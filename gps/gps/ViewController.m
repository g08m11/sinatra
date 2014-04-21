//
//  ViewController.m
//  gps
//
//  Created by 具志堅 雅 on 2014/04/12.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapview;
@synthesize locationlable;
@synthesize coordinate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]){
      locationManager.delegate = self;
      [locationManager startUpdatingLocation];
    }else{
    NSLog(@"ロケーションサービスを利用することが出来ません");
    }
  
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
  NSLog(@"緯度:%fと経度%f",[newLocation coordinate].latitude,[newLocation coordinate].longitude);
  coordinate = newLocation.coordinate;
  
//  [self displayLocation];
  MKCoordinateRegion zoom = mapview.region;
  zoom.span.latitudeDelta = 0.001;
  zoom.span.longitudeDelta = 0.001;
  [mapview setRegion:zoom animated:YES];

  [mapview setCenterCoordinate:newLocation.coordinate animated:YES];
  [locationlable setText:[NSString stringWithFormat:@"緯度:.%2f緯度.2f方位:.0f",
                          coordinate.latitude,
                          coordinate.longitude,
                          0]];
  
  
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
