//
//  MapViewController.m
//  TNTU App
//
//  Created by Dima on 12/3/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "MapViewController.h"
#import "UIColor+TNTUAdditions.h"

@interface MapViewController () <MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocation *tntuLocation;
@property (strong, nonatomic) UIView *infoView;
@property (strong, nonatomic) UILabel *distanceLabel;

@end

@implementation MapViewController
{
    BOOL isCentered;
}

#define TNTU_LATITUDE 49.551143
#define TNTU_LONGITUDE 25.600138

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isCentered = NO;
    
    [self.tabBarController.tabBar setHidden:YES];
    
    // init MapView
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeHybrid;
    [self.mapView setShowsUserLocation:YES];
    [self.view addSubview:self.mapView];
    
    // set TNTU Location
    self.tntuLocation = [[CLLocation alloc] initWithLatitude:TNTU_LATITUDE longitude:TNTU_LONGITUDE];
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(TNTU_LATITUDE,
                                                                   TNTU_LONGITUDE);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 500, 500)];
    adjustedRegion.span.longitudeDelta  = 0.04;
    adjustedRegion.span.latitudeDelta  = 0.04;
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:startCoord];
    [annotation setTitle:@"ТНТУ ім. Івана Пулюя"];
    [annotation setSubtitle:@"вул. Руська, 56"];
    [self.mapView addAnnotation:annotation];
    
    // init InfoView
    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                             self.view.frame.size.height - 49.0,
                                                             self.view.frame.size.width,
                                                             49.0)];
    [self.infoView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:0.7]];
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0,
                                                                   0.0,
                                                                   self.infoView.frame.size.width - 20.0,
                                                                   self.infoView.frame.size.height)];
    self.distanceLabel.textColor = [UIColor whiteColor];
    self.distanceLabel.text = @"Відстань до ТНТУ: - м ";
    [self.infoView addSubview:self.distanceLabel];
    [self.view addSubview:self.infoView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationDistance distance = [userLocation.location distanceFromLocation:self.tntuLocation];
    [self.distanceLabel setText:[NSString stringWithFormat:@"Відстань до ТНТУ: %d м", (NSInteger)distance]];
    
    if (!isCentered) {
        CLLocationCoordinate2D midCoord = CLLocationCoordinate2DMake((TNTU_LATITUDE + userLocation.coordinate.latitude) / 2.0,
                                                                     (TNTU_LONGITUDE + userLocation.coordinate.longitude) / 2.0);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(midCoord,
                                                                                                            distance + (distance * 0.1),
                                                                                                            distance + (distance * 0.1))];
        [self.mapView setRegion:adjustedRegion animated:YES];
        isCentered = YES;
    }
}

@end
