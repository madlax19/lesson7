//
//  ViewController.m
//  Task2
//
//  Created by Elena on 28.11.15.
//  Copyright © 2015 Elena. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray* products;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.products = [[NSMutableArray alloc] init];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Product* product = [self.products objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    if (product.isBuyed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Product* product = [self.products objectAtIndex:indexPath.row];
    product.isBuyed = !product.isBuyed;
    [self.tableView reloadData];
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.products removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

- (IBAction)addButtonTouch:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"task2" message:@"Add new product" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1){
        UITextField *textField = [alertView textFieldAtIndex: 0];
        Product* product = [[Product alloc] init];
        product.name = textField.text;
        product.isBuyed = NO;
        [self.products addObject:product];
        [self.tableView reloadData];
    }
    
}
@end
