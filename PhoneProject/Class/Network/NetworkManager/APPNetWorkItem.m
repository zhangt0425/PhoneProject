//
//  APPNetWorkItem.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//


//具体参考： https://github.com/AFNetworking/AFNetworking

#import "APPNetWorkItem.h"
#import "APPNetWorkHandler.h"
#import "APPCacheManager.h"

@implementation APPNetWorkItem

/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param shouldCache  是否启用缓存
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initWithtype:(NetWorkType) networkType
                              url:(NSString *) url
                           params:(NSDictionary *) params
                         delegate:(id) delegate
                        hashValue:(NSUInteger) hashValue
                          showHUD:(BOOL) showHUD
                      shouldCache:(BOOL) shouldCache
                     successBlock:(APPSuccessBlock) successBlock
                     failureBlock:(APPFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
        self.shouldCache = shouldCache;
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
    }
    
    if (shouldCache&&[[APPCacheManager sharedAPPCacheManager] hasCacheWithServiceIdentifier:url])
    {
        //启用缓存
        id responseObject=[[APPCacheManager sharedAPPCacheManager]fetchCachedDataWithServiceIdentifier:url];
        DEF_DEBUG(@"APP网络缓存请求接口:%@的回返数据:\n%@", url, responseObject);
        if (self.successBlock)
        {
            self.successBlock(responseObject);
        }
        return self;
    }
    
    //添加一个网络请求项
    [[APPNetWorkHandler sharedInstance] addItem:self];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求时间
    manager.requestSerializer.timeoutInterval = APPNetworkingTimeoutSeconds;
    //是否使用无效或过期的SSL证书来信任服务器。默认为“不”。
    manager.securityPolicy.allowInvalidCertificates = YES;

    if (networkType == NetWorkGET)
    {
       
        self.httpRequest = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            //移除这个网络请求项
            [[APPNetWorkHandler sharedInstance] removeItem:self];
            DEF_DEBUG(@"APP网络请求接口:%@的回返数据:\n%@", url, responseObject);
            if (self.successBlock)
            {
                self.successBlock(responseObject);
            }
            if (shouldCache)
            {
                [[APPCacheManager sharedAPPCacheManager] saveCacheWithData:responseObject serviceIdentifier:url];
            }
           
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            //移除这个网络请求项
            [[APPNetWorkHandler sharedInstance] removeItem:self];
            DEF_DEBUG(@"APP网络请求GET接口:%@访问错误:\n%@", url, error);
            if (self.failureBlock)
            {
                self.failureBlock(error);
            }
          
        }];

    }
    else
    {
        self.httpRequest = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            //移除这个网络请求项
            [[APPNetWorkHandler sharedInstance] removeItem:self];
            DEF_DEBUG(@"APP网络请求接口:%@的回返数据:\n%@", url, responseObject);
            if (self.successBlock)
            {
                self.successBlock(responseObject);
            }
            if (shouldCache)
            {
                [[APPCacheManager sharedAPPCacheManager] saveCacheWithData:responseObject serviceIdentifier:url];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            //移除这个网络请求项
            [[APPNetWorkHandler sharedInstance] removeItem:self];
            DEF_DEBUG(@"APP网络请求POST接口:%@访问错误:\n%@", url, error);
            if (self.failureBlock)
            {
                self.failureBlock(error);
            }
            
        }];

    }
    
    return self;

}

/**
 *  创建一个网络请求项，开始上传图片
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param images       图片二进制数组
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initWithtype:(NetWorkType) networkType
                              url:(NSString *) url
                           params:(NSDictionary *) params
                           images:(NSDictionary *) images
                         delegate:(id) delegate
                        hashValue:(NSUInteger) hashValue
                          showHUD:(BOOL) showHUD
                     successBlock:(APPSuccessBlock) successBlock
                     failureBlock:(APPFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
    }
    
    [[APPNetWorkHandler sharedInstance] addItem:self];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    self.httpRequest = [manager POST:url
       parameters:params
        constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
     {
         DEF_DEBUG(@"APP网络上传图片接口:%@\n", url);
         NSArray *allKeys = [images allKeys];
         for (int index=0; index<allKeys.count; index++)
         {
             NSString *keyValue = allKeys[index];
             //多图片上传
             NSArray *imageArray = [[NSArray alloc] initWithArray:[images objectForKey:keyValue]];
             for (int i = 0; i<imageArray.count; i++)
             {
                 [formData appendPartWithFileData:UIImageJPEGRepresentation(imageArray[i], 1.0)
                                             name:keyValue
                                         fileName:[NSString stringWithFormat:@"doubi%d.jpg",i]
                                         mimeType:@"image/pjpeg"]; //image/pjpeg
             }
             
         }
         
     }success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         DEF_DEBUG(@"APP图片上传成功: %@", url);
         [[APPNetWorkHandler sharedInstance] removeItem:self];
         NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
         if (self.successBlock)
         {
             self.successBlock(json);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [[APPNetWorkHandler sharedInstance] removeItem:self];
         DEF_DEBUG(@"APP图片上传%@失败: %@", url,error);
         if (self.failureBlock) {
             self.failureBlock(error);
         }
     }];
    
    return self;

}

/**
 *  创建一个下载的网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param startBlock   请求开始后的block
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initDownloadWithtype:(NetWorkType) networkType
                                      url:(NSString *) url
                                 delegate:(id) delegate
                                hashValue:(NSUInteger) hashValue
                            progressBlock:(APPProgressBlock) progressBlock
                               startBlock:(APPStartBlock) startBlock
                             successBlock:(APPSuccessBlock) successBlock
                             failureBlock:(APPFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.downloadProgressBlock = progressBlock;
        self.startBlock = startBlock;
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;

    }
    DEF_DEBUG(@"APP网络下载文件接口:%@\n", url);
    [[APPNetWorkHandler sharedInstance] addItem:self];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress){
        //下载进度
        if (self.downloadProgressBlock) {
            self.downloadProgressBlock(downloadProgress);
        }
        
    }destination:^NSURL *(NSURL *targetPath, NSURLResponse *response)
    {
        if (self.startBlock) {
            self.startBlock();
        }
        //在这里设置文件保存路径
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
    {
        DEF_DEBUG(@"File downloaded to: %@", filePath);
        if (error)
        {
            [[APPNetWorkHandler sharedInstance] removeItem:self];
            DEF_DEBUG(@"APP文件下载%@失败: %@", url,error);
            if (self.failureBlock) {
                self.failureBlock(error);
            }
        }
        else
        {
            if (self.successBlock) {
                self.successBlock(@"下载成功");
            }
        }
        

    }];
    [downloadTask resume];
    
    return self;
}

@end
