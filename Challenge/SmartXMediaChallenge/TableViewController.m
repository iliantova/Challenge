//
//  TableViewController.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/19/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "TableViewController.h"
#import "IAAppDelegate.h"
#import "IACategory.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *fetchedObjects;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IAAppDelegate *cdHelper = [[IAAppDelegate alloc] init];
    
    NSManagedObjectContext *context = [cdHelper managedObjectContext];
    
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Category" inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
    [fetchRequest setReturnsObjectsAsFaults:NO];

    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    
    self.fetchedObjects =[[NSMutableArray alloc] init];
    
    for (NSManagedObject *info in result) {
        NSString *n = [info valueForKey:@"name"];
        NSString *m = [info valueForKey:@"id"];
        //NSLog(@"NAMEEEEEEEEEEE: %@", n);
        IACategory *category = [IACategory categoryWithName:n andIdCategory:m];
        [self.fetchedObjects addObject: category];
        NSLog(@"CATEGORYYYY: %@", category);
    }
         NSLog(@"ARRRAY: %@", self.fetchedObjects);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.fetchedObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellM= @"TheCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellM];
    
    
    if(cell == nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellM];
    }
    
    IACategory *category1 = [self.fetchedObjects objectAtIndex: indexPath.row];
    
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.text = category1.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
