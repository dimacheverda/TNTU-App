//
//  NewsSecondaryTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "InfoSecondaryTableViewController.h"
#import "ArticleTextView.h"
#import "PhotoViewController.h"
#import "ShowPhotoTransition.h"
#import "DismissPhotoTransition.h"

@interface InfoSecondaryTableViewController ()
{
    NSString *selectedTitle;
    CGFloat basicContentHeight;
    NSString *content;
    NSArray *imageNames;
    NSMutableArray *imageViewsArray;
}

@property (strong, nonatomic) ArticleTextView *textView;
@property (strong, nonatomic) UIView *footerView;

@end

@implementation InfoSecondaryTableViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    content = @"      Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. \r\n\r\n      Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.\r\n\r\n      Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. \r\n      Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. \r\n      Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.";
    
    self.footerView = [[UIView alloc] init];
    self.textView = [[ArticleTextView alloc] initWithFrame:CGRectZero content:content];
    [self.footerView addSubview:self.textView];
    [self.tableView addSubview:self.footerView];
    basicContentHeight = self.tableView.contentSize.height;
    
    // Initialasing imageViewsArray and adding TapGestureRecognizer
    imageNames = [NSArray arrayWithObjects:@"placeholder", @"placeholder", @"placeholder", @"placeholder", nil];
    imageViewsArray = [NSMutableArray new];
    for (NSString *imageName in imageNames) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [imageView setUserInteractionEnabled:YES];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(imageViewTapped:)];
        [singleTap setNumberOfTapsRequired:1];
        [imageView addGestureRecognizer:singleTap];
        [imageViewsArray addObject:imageView];
    }
    
    [self.textView addImageViews:imageViewsArray];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    basicContentHeight = [self.tableView numberOfRowsInSection:0] * 44.0 + 44.0;
    
    self.textView.frame = CGRectMake(0.0,
                                     0.0,
                                     320.0,
                                     self.textView.contentSize.height);
    self.footerView.frame = CGRectMake(0.0,
                                       basicContentHeight,
                                       320.0,
                                       self.textView.contentSize.height);
    self.tableView.contentSize = CGSizeMake(320.0,
                                            self.textView.contentSize.height + basicContentHeight);
}

#pragma mark

- (void)imageViewTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"actionHandleTapOnImageView:  %f", sender.view.frame.origin.y);
    PhotoViewController *photoVC = [PhotoViewController new];
    if ([sender.view isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = [UIImageView new];
        UIImageView *imageView1 = (UIImageView *)sender.view;
        imageView.image = imageView1.image;
        [photoVC setImageview:imageView];
    }
    photoVC.modalPresentationStyle = UIModalPresentationCustom;
    photoVC.transitioningDelegate = self;
    [self presentViewController:photoVC animated:YES completion:nil];
}

#pragma mark - View Controller Transitioning Delegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    ShowPhotoTransition *showPhotoTransition = [ShowPhotoTransition new];
    return showPhotoTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    DismissPhotoTransition *transition = [DismissPhotoTransition new];
    return transition;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    selectedTitle = [self.contentArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Show Article" sender:self];
}

#pragma mark

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show Article"]) {
        [[segue.destinationViewController navigationItem] setTitle:selectedTitle];
    }
}

@end