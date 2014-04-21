//
//  ViewController.h
//  gps
//
//  Created by 具志堅 雅 on 2014/04/12.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>{
  MKMapView *mapview;
  UILabel   *locationlable;
  
  CLLocationCoordinate2D coordinate;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapview;
@property (nonatomic,retain) IBOutlet UILabel *locationlable;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end
