//
//  NewsViewController.m
//  TNTU App
//
//  Created by Dima on 11/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTextView.h"

@interface NewsViewController ()

@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) NewsTextView *textView;

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation NewsViewController
{
    NSString *content;
    NSString *title;
    NSArray *imageNames;
    NSMutableArray *imageViewsArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    title = @"Семінар професора Жака Фресара у Тернопільську національному технічному унверситеті імені Івана Пулюя";

    content = @"    14 листопада у читальному залі Тернопільського національного технічного університету імені Івана Пулюя відбувся науковий семінар професора Жака Фресара (університет П’єра та Марії Кюрі, Париж, Франція) на тему 'Технології ядерно-магнітного резонансу: нові результати, перспективи застосування в промисловості, хімії, медицині'.\r\n\r\n     В ході візиту Жак Фресар зустрівся із ректором університету проф. Петром Яснієм, а також відвідав муніципалітет міста та здійснив ескурсію до старовинного Вишнівця. \r\n\r\n    Професор Жак Фресар уже вдруге завітав до ТНТУ на запрошення директора Центру франко-української наукової кооперації і підготовки персоналу, професора кафедри програмної інженерії Петрика Михайла Романовича.\r\n\r\n     Варто відзначити, що наш університет веде тривалу ефективну співпрацю з низкою французьких лабораторій, зокрема Лабораторія математичного моделювання масопереносу в неоднорідних і нанопористих середовищах та кафедра програмної інженерії розвивають спільні проекти в галузі ідентифікації параметрів компетитивної дифузії газів в нанопористих середовищах з Вищою Школою Інженерної фізики і хімії Парижу ESPCI Paris Tech, Університетом П'єра та Марії Кюрі Paris 6.";
    
    self.footerView = [[UIView alloc] init];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.footerView addSubview:self.titleLabel];
    
    
    self.textView = [[NewsTextView alloc] initWithFrame:CGRectZero content:content];
    [self.footerView addSubview:self.textView];
    [self.tableView addSubview:self.footerView];
    
    // Initialasing imageViewsArray
    imageNames = [NSArray arrayWithObjects:@"placeholder", @"placeholder", @"placeholder", @"placeholder", nil];
    imageViewsArray = [NSMutableArray new];
    for (NSString *imageName in imageNames) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [imageViewsArray addObject:imageView];
    }
    [self.textView addImageViews:imageViewsArray];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10.0,
                                       0.0,
                                       300.0,
                                       88.0);
    
    self.textView.frame = CGRectMake(0.0,
                                     self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 5.0,
                                     320.0,
                                     self.textView.contentSize.height);
    self.footerView.frame = CGRectMake(0.0,
                                       0.0,
                                       320.0,
                                       self.textView.contentSize.height);
    self.tableView.contentSize = CGSizeMake(320.0,
                                            self.textView.frame.size.height + self.textView.frame.origin.y);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
