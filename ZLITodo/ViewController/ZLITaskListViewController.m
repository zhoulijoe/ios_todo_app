#import "ZLITaskListViewController.h"
#import "ZLITask.h"

@interface ZLITaskListViewController ()

@property (strong, nonatomic) NSMutableArray *mockTasks;

@end

@implementation ZLITaskListViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSInteger count = 0;
        _mockTasks = [NSMutableArray new];
        [_mockTasks addObject:[[ZLITask alloc] initWithID:++count description:@"Buy food" complete:NO]];
        [_mockTasks addObject:[[ZLITask alloc] initWithID:++count description:@"Pay bill" complete:NO]];
        [_mockTasks addObject:[[ZLITask alloc] initWithID:++count description:@"Set alarm" complete:YES]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mockTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TaskListCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    ZLITask *task = [self.mockTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.description;

    if (task.complete) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

@end
