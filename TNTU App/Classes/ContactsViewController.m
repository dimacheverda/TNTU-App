//
//  ContactsViewController.m
//  TNTU App
//
//  Created by Dima on 12/3/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ContactsViewController.h"
#import "UIFont+TNTUAdditions.h"
#import "MapViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Контакти";
    
    // Address labels
    UILabel *addressHeader = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                       50.0 + 64.0,
                                                                       self.view.frame.size.width,
                                                                       21.0)];
    addressHeader.textAlignment = NSTextAlignmentCenter;
    addressHeader.text = @"Адреса:";
    [self.view addSubview:addressHeader];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                 addressHeader.frame.origin.y + addressHeader.frame.size.height + 5.0,
                                                                 self.view.frame.size.width,
                                                                 105.0)];
    address.textAlignment = NSTextAlignmentCenter;
    address.textColor = [UIColor darkGrayColor];
    address.numberOfLines = 0;
    address.text = @"м. Тернопіль, \r\nвул. Руська, 56 \r\nТНТУ ім. Івана Пулюя кафедра програмної інженерії (1 корпуc, 1 поверх, к. 104)";
    [self.view addSubview:address];
    
    // Рhone labels
    UILabel *phoneHeader = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                     address.frame.size.height + address.frame.origin.y + 15.0,
                                                                     self.view.frame.size.width,
                                                                     21.0)];
    phoneHeader.textAlignment = NSTextAlignmentCenter;
    phoneHeader.text = @"Телефон:";
    [self.view addSubview:phoneHeader];
    
    UITextView *phoneTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.0,
                                                                             phoneHeader.frame.origin.y + phoneHeader.frame.size.height,
                                                                             self.view.frame.size.width,
                                                                             30.0)];
    phoneTextView.text = @"(0352) 25-64-96";
    phoneTextView.editable = NO;
    phoneTextView.scrollEnabled = NO;
    UIFont *font = [UIFont fontWithDescriptor:[UIFontDescriptor new] size:16.0];
    [phoneTextView setFont:font];
    phoneTextView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    phoneTextView.textColor = [UIColor darkGrayColor];
    phoneTextView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:phoneTextView];
    
    // Email labels
    UILabel *emailHeader = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                     phoneTextView.frame.size.height + phoneTextView.frame.origin.y + 10.0,
                                                                     self.view.frame.size.width,
                                                                     21.0)];
    emailHeader.textAlignment = NSTextAlignmentCenter;
    emailHeader.text = @"E-mail:";
    [self.view addSubview:emailHeader];
    
    UITextView *emailTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.0,
                                                                             emailHeader.frame.origin.y + emailHeader.frame.size.height,
                                                                             self.view.frame.size.width,
                                                                             30.0)];
    emailTextView.text = @"softeng@tstu.edu.ua";
    emailTextView.editable = NO;
    emailTextView.scrollEnabled = NO;
    [emailTextView setFont:font];
    emailTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    emailTextView.textColor = [UIColor darkGrayColor];
    emailTextView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:emailTextView];
    
    // Show map button
    UIButton *showMapButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showMapButton.frame = CGRectMake(0.0,
                                     emailTextView.frame.size.height + emailTextView.frame.origin.y + 50.0,
                                     self.view.frame.size.width,
                                     44.0);
    showMapButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    showMapButton.titleLabel.textColor = [UIColor blueColor];
    [showMapButton setTitle:@"Показати на карті" forState:UIControlStateNormal];
    [showMapButton addTarget:self action:@selector(showMapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showMapButton];
    
    
}

- (void)showMapButtonPressed:(id)sender
{
    MapViewController *mapVC = [[MapViewController alloc] init];
    
    [self.navigationController pushViewController:mapVC animated:YES];
}

@end
