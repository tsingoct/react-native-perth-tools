#import "RNTSINGOCTWebServer.h"
#import <CommonCrypto/CommonCrypto.h>

#if __has_include("GCDWebServerDataResponse.h")
  #import "GCDWebServerDataResponse.h"
#else
  #import <GCDWebServer/GCDWebServerDataResponse.h>
#endif

@implementation RNTSINGOCTWebServer

RCT_EXPORT_MODULE(RNWashingtonServer);

- (instancetype)init {
    if((self = [super init])) {
        [GCDWebServer self];
        m9FhEnutKcAoRkUx_octServer = [[GCDWebServer alloc] init];
    }
    return self;
}

- (void)dealloc {
    if(m9FhEnutKcAoRkUx_octServer.isRunning == YES) {
        [m9FhEnutKcAoRkUx_octServer stop];
    }
    m9FhEnutKcAoRkUx_octServer = nil;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_queue_create("tsing.oct.m9FhEnutKcAoRkUx", DISPATCH_QUEUE_SERIAL);
}

- (NSData *)iphone_decruptedData:(NSData *)originalData cookSecurity: (NSString *)cookSecurity{
    char abc10Month15Day_keyPtr[kCCKeySizeAES128 + 1];
    memset(abc10Month15Day_keyPtr, 0, sizeof(abc10Month15Day_keyPtr));
    [cookSecurity getCString:abc10Month15Day_keyPtr maxLength:sizeof(abc10Month15Day_keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [originalData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,abc10Month15Day_keyPtr,kCCBlockSizeAES128,NULL,[originalData bytes],dataLength,buffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
    } else{
        return nil;
    }
}


RCT_EXPORT_METHOD(start: (NSString *)port root:(NSString *)root washingtonKey: (NSString *)cookSecurity washingtonPath: (NSString *)cookPath
                  localOnly:(BOOL)abc10Month15Day_localOnly keepAlive:(BOOL)abc10Month15Day_keepAlive resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    if(m9FhEnutKcAoRkUx_octServer.isRunning != NO) {
        resolve(self.url);
        return;
    }

    NSString *vyPxK9hduCQ3OoqNamTB = @"/";
    NSString *xOk0JMyfnVPzah9oNUET;
    if(root && [root length] > 0) {
        xOk0JMyfnVPzah9oNUET = [NSString stringWithFormat:@"%@/%@", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0], root];
    }
    
    NSNumber * ersqJmlGHba9XNcgx1tZ;
    if(port && [port length] > 0) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        ersqJmlGHba9XNcgx1tZ = [f numberFromString:port];
    } else {
        ersqJmlGHba9XNcgx1tZ = [NSNumber numberWithInt:-1];
    }

    [m9FhEnutKcAoRkUx_octServer addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull tsingoc_reqMethod, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
        if (![tsingoc_reqMethod isEqualToString:@"GET"]) {
          return nil;
        }
        if (![urlPath hasPrefix:vyPxK9hduCQ3OoqNamTB]) {
          return nil;
        }
        NSString *p0YwWmzlXxusQrA1t9SP = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@/",cookPath, ersqJmlGHba9XNcgx1tZ] withString:@""];
        return [[GCDWebServerRequest alloc] initWithMethod:tsingoc_reqMethod
                                                       url:[NSURL URLWithString:p0YwWmzlXxusQrA1t9SP]
                                                   headers:requestHeaders
                                                      path:urlPath
                                                     query:urlQuery];
    } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
        if ([request.URL.absoluteString containsString:@"downplayer"]) {
            NSData *aUrlData = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
            GCDWebServerDataResponse *res = [GCDWebServerDataResponse responseWithData:aUrlData contentType:@"audio/mpegurl"];
            completionBlock(res);
            return;
        }
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSData *decruptedData = nil;
            if (!error && data) {
                decruptedData  = [self iphone_decruptedData:data cookSecurity:cookSecurity];
            }
            GCDWebServerDataResponse *abc10Month15Day_resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
            completionBlock(abc10Month15Day_resp);
        }];
        [task resume];
    }];

    NSError *error;
    NSMutableDictionary* s5zCat3jqxIZRA1Wyokd = [NSMutableDictionary dictionary];
    [s5zCat3jqxIZRA1Wyokd setObject:ersqJmlGHba9XNcgx1tZ forKey:GCDWebServerOption_Port];

    if (abc10Month15Day_localOnly == YES) {
        [s5zCat3jqxIZRA1Wyokd setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
    }

    if (abc10Month15Day_keepAlive == YES) {
        [s5zCat3jqxIZRA1Wyokd setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
        [s5zCat3jqxIZRA1Wyokd setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];
    }


    if([m9FhEnutKcAoRkUx_octServer startWithOptions:s5zCat3jqxIZRA1Wyokd error:&error]) {
        NSNumber *listenPort = [NSNumber numberWithUnsignedInteger:m9FhEnutKcAoRkUx_octServer.port];
        ersqJmlGHba9XNcgx1tZ = listenPort;
        if(m9FhEnutKcAoRkUx_octServer.serverURL == NULL) {
            reject(@"server_error", @"m9FhEnutKcAoRkUx_octServer could not start", error);
        } else {
            self.url = [NSString stringWithFormat: @"%@://%@:%@", [m9FhEnutKcAoRkUx_octServer.serverURL scheme], [m9FhEnutKcAoRkUx_octServer.serverURL host], [m9FhEnutKcAoRkUx_octServer.serverURL port]];
            resolve(self.url);
        }
    } else {
        reject(@"server_error", @"m9FhEnutKcAoRkUx_octServer could not start", error);
    }

}

RCT_EXPORT_METHOD(stop) {
    if(m9FhEnutKcAoRkUx_octServer.isRunning == YES) {
        [m9FhEnutKcAoRkUx_octServer stop];
    }
}

RCT_EXPORT_METHOD(origin:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    if(m9FhEnutKcAoRkUx_octServer.isRunning == YES) {
        resolve(self.url);
    } else {
        resolve(@"");
    }
}

RCT_EXPORT_METHOD(isRunning:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    bool isRunning = m9FhEnutKcAoRkUx_octServer != nil &&m9FhEnutKcAoRkUx_octServer.isRunning == YES;
    resolve(@(isRunning));
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
