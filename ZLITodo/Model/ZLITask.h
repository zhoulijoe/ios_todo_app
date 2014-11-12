@interface ZLITask : NSObject

@property (assign, nonatomic) NSInteger ID;
@property (strong, nonatomic) NSString *description;
@property (assign, nonatomic) BOOL complete;

- (instancetype)initWithID:(NSInteger)ID description:(NSString *)description complete:(BOOL)complete;

@end
