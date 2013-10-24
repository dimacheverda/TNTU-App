//
//  NewsMainTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "InfoMainTableViewController.h"
#import "InfoSecondaryTableViewController.h"

@interface InfoMainTableViewController ()
{
    NSArray *content;
    NSArray *secondaryContent;
    NSString *selectedTitle;
}

@end

@implementation InfoMainTableViewController

- (void)viewDidLoad
{
    content = [NSArray arrayWithObjects:@"Персонал", @"Навчання", @"Працевлаштування", @"Програма подвійних дипломів", @"Наукова робота", @"Абітурієнту", @"Контакти", nil];
}

- (NSMutableDictionary *)loadDictionaryFromPlistFromDropboxLink:(NSString *)urlString
{
    __block NSMutableDictionary *database = nil;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        database = (NSMutableDictionary *)[NSPropertyListSerialization
                                           propertyListFromData:urlData
                                           mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                           format:&format
                                           errorDescription:&errorDesc];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *url = [database objectForKey:@"Appstore Link"];
        [defaults setObject:url forKey:@"Appstore Link"];
        [defaults synchronize];
        NSLog(@"\n\n\\nmain%@\n\n\n\n", url);
        if (!database) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
    });
    return database;
}


#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [content objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    switch (indexPath.row) {
        case 1: {
            secondaryContent = [NSArray arrayWithObjects:@"Документація", @"Основні навчальні лабораторії", nil];
            break;
        }
            
        case 2: {
            secondaryContent = [NSArray arrayWithObjects:@"Стажування в EzTexting (США)", @"Стажування в SJ Innovation", @"Стажування в Мрія Агрохолдинг", nil];
            break;
        }
            
        case 4: {
            secondaryContent = [NSArray arrayWithObjects:@"Держбютжетні теми та гранти", @"Публікації", nil];
            break;
        }
            
        default:
            break;
    }
    selectedTitle = [content objectAtIndex:indexPath.row];
    if ((indexPath.row == 1) || (indexPath.row == 2) || (indexPath.row == 4)) {
        [self performSegueWithIdentifier:@"Secondary" sender:self];
    } else
        [self performSegueWithIdentifier:@"Show Article" sender:self];
}

#pragma mark

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Secondary"]) {
        if ([segue.destinationViewController isMemberOfClass:[InfoSecondaryTableViewController class]]) {
            [segue.destinationViewController setContentArray:secondaryContent];
        }
    } else if ([segue.identifier isEqualToString:@"Show Article"]) {
        // code here
    }
    [[segue.destinationViewController navigationItem] setTitle:selectedTitle];
}

@end