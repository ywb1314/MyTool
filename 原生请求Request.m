//请求数据回调此block
void(^blockJson)(NSInteger,NSString *);
blockJson(day,path);
//request
blockJson = ^(NSInteger day,NSString *path){
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.weather.com.cn/atad/%@.html",path]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@",response);
        if (data == nil) {
            NSLog(@"error: %@",error);
        }else{
            NSError *jsonError;
            NSDictionary *jsonDiction = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            if (jsonDiction == nil) {
                NSLog(@"error %@",jsonError);
            }else {
                //回到主线程更改UI
                NSDictionary *dictionary = [jsonDiction objectForKey:@"weatherinfo"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    _city.text = [dictionary objectForKey:@"city"];
                    _wenDu.text = [dictionary objectForKey:[NSString stringWithFormat:@"temp%ld",(day + 1)]];
                });
            }
        }
        
    }];
    [task resume];
};
@end
