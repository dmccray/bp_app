//
//  BPLogViewController.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/3/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "BPLogViewController.h"
#import "BPReading.h"

@interface BPLogViewController ()
    @property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
    //@property (strong, nonatomic) NSFetchRequest *request;

@end

@implementation BPLogViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"BP Log";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error;
    if(![self.fetchedResultsController performFetch:&error])
    {
        NSLog(@"Error: %@\n%@",[error localizedDescription], [error userInfo]);
    }
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //need to understand
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    BPReading *reading = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    
    NSString *readingInstantString = [NSDateFormatter localizedStringFromDate:reading.readingInstant
                                                                    dateStyle:NSDateFormatterShortStyle
                                                                    timeStyle:NSDateFormatterFullStyle];
    NSLog(@"Reading: %@", reading);
    NSLog(@"Reading Instant: %@", readingInstantString);
    
    cell.textLabel.font = [UIFont systemFontOfSize:10.0];
    cell.textLabel.text = readingInstantString;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - fetchResults setup
- (NSFetchedResultsController *)fetchedResultsController
{
    if(_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"BPReading" inManagedObjectContext:self.managedObjectContext]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"readingInstant" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor ]];
    
    //need to learn more about this method call, especially the last two arguments
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
   
    _fetchedResultsController.delegate = self; //set this class as the fetchResultController's delegate
    
    return _fetchedResultsController;
    
}

//not working, need to figure how to update the TableView when the CoreData store has been updated. 
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    NSError *error;
    if(![controller performFetch:&error])
    {
        NSLog(@"Error: %@\n%@",[error localizedDescription], [error userInfo]);
    }
}

@end
