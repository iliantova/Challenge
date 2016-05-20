//
//  IACategoryTableViewController.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IACategoryTableViewController.h"
#import "IACategory.h"
#import "IACategoryData.h"
#import "IASubTableViewController.h"
#import "IASubCategoryData.h"

@interface IACategoryTableViewController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) NSArray *fetchedObjects;

@end

@implementation IACategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Category";
    IACategoryData *category = [[IACategoryData alloc]init];
    self.fetchedObjects =[[NSArray alloc] init];
    self.fetchedObjects =[category TakeAllCategoryFromDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    
    IACategory *curentCategory = [self.fetchedObjects objectAtIndex: indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Zapfino" size:30.0f];
    cell.textLabel.text = curentCategory.name;
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    IACategory *curentCategory = [self.fetchedObjects objectAtIndex: indexPath.row];
    NSString *storyBoardId = @"SubCategory";
    
    IASubTableViewController *subView = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    
    IASubCategoryData *subHelper= [[IASubCategoryData alloc] init];
    subView.subCategory = [subHelper TakeSubCategoryByCategoryFromDatabase:curentCategory];
    
    [self.navigationController pushViewController:subView animated:YES];
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
