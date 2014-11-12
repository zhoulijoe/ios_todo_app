#import "ZLITaskListViewController.h"
#import "ZLITask.h"

@interface ZLITaskListViewController ()

@property (strong, nonatomic) NSArray *tasks;

@end

@implementation ZLITaskListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.taskService getTasks:^(NSArray *tasks, NSError *error) {
        self.tasks = tasks;
        [self.tableView reloadData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TaskListCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    ZLITask *task = [self.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.description;

    if (task.complete) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

@end
