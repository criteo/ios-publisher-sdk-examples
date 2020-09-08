//
//  HomeViewController.m
//  Standalone
//
//  Copyright © 2020 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "HomeViewController.h"
#import "BannerViewController.h"
#import "InterstitialViewController.h"
#import "NativeSimpleViewController.h"
#import "CriteoSample.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<CriteoSample *> *samples;
@property (strong, nonatomic) NSString *cellReuseIdentifier;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.samples = [NSMutableArray arrayWithObjects:
        [[CriteoSample alloc] initWithLabel:@"Banner Samples" AndSegueId:@"BannerSampleSegue"],
        [[CriteoSample alloc] initWithLabel:@"Interstitial Samples" AndSegueId:@"InterstitialSampleSegue"],
        [[CriteoSample alloc] initWithLabel:@"Native Sample (Simple)" AndSegueId:@"NativeSimpleSampleSegue"], nil];

    self.cellReuseIdentifier = @"cell";

    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:self.cellReuseIdentifier];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = false;
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.samples count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier];
    cell.textLabel.text = [self.samples objectAtIndex:indexPath.row].label;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *segueId = [self.samples objectAtIndex:indexPath.row].segueId;
    @try {
        [self performSegueWithIdentifier:segueId sender:tableView];
    }
    @catch(NSException *exception) {
        NSLog(@"Couldn't perform segue with segue ID %@", segueId);
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"Couldn't perform segue with segue ID %@", segueId] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

@end
