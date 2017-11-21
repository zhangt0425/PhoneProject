//
//  APPConfigManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/28.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPConfigManager.h"
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <sys/socket.h>

@implementation APPConfigManager

singleton_for_class(APPConfigManager)

- (void)printsAppConfigInfo
{
    ////手机相关信息
    ////电池电量50%
    //#define DEF_PhoneBatteryLevel ;
    //    //设备唯一标识符 3DCF9688-6946-4C30-8B27-377A7910DCB0
    //#define DEF_PhoneIdentifierForVendor ;
    //    //手机别名： 用户定义的名称iPhone Simulator
    //#define DEF_PhoneName
    //    //设备名称iPhone OS
    //#define DEF_PhoneSystemName
    //    //手机系统版本9.3
    //#define DEF_PhoneSystemVersion
    //    //地方型号（国际化区域名称）iPhone
    //#define DEF_PhoneLocalizedModel
    
    //// 获得APP工程信息
    ////当前应用软件版本  比如：1.0.1
    //#define DEF_APPCurVersion
    //// 当前应用版本号码   int类型
    //#define DEF_APPCurVersionNum
    ////APP名称
    //#define DEF_APPName
    ////工程名称PhoneProject
    //#define DEF_APPProjectName
    
    DEF_DEBUG(@"手机相关信息:\n设备型号:%@\n电池电量:%f\n设备唯一标识符:%@\n手机别名:%@\n设备名称:%@\n手机系统版本:%@\n国际化区域名称:%@",[self iphoneType],DEF_PhoneBatteryLevel,DEF_PhoneIdentifierForVendor,DEF_PhoneName,DEF_PhoneSystemName,DEF_PhoneSystemVersion,DEF_PhoneLocalizedModel);
    
    DEF_DEBUG(@"APP工程信息:\n当前应用软件版本:%@\n当前应用版本号码:%@\nAPP名称:%@\n工程名称:%@",DEF_APPCurVersion,DEF_APPCurVersionNum,DEF_APPName,DEF_APPProjectName);
    
    DEF_DEBUG(@"APP网络信息:\n当前服务器地址:%@\n当前网络状态:%@\n当前运营商:%@\n",[self appServerAddress],[self networkingStates],[self carrierName]);
    
    [self checkNetworkflow];
    

}
//获取当前app服务器APPServiceISOnline
- (BOOL)appServiceISOnline
{
    return APPServiceISOnline;
}
//获取当前app服务器地址
- (NSString *)appServerAddress
{
    return self.appServiceISOnline?APPServerAddress_online:APPServerAddress_offline;
}
- (void)printsFamilyName
{
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    DEF_DEBUG(@"当前字体。。。 %@",font);
    NSMutableArray *familyNameArray = [[NSMutableArray alloc] init];
    NSArray* familyNamesAll = [UIFont familyNames];
    for (id family in familyNamesAll)
    {
        NSArray* fonts = [UIFont fontNamesForFamilyName:family];
        for (id font in fonts)
        {
            [familyNameArray addObject:font];
        }
    }
    DEF_DEBUG(@"所有字体 %@",familyNameArray);
}

- (NSString *)iphoneType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
    
}
//获取运营商
-(NSString *)carrierName
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    NSString *carrier_country_code = carrier.isoCountryCode;
    if (carrier_country_code == nil)
    {
        carrier_country_code = @"";
    }
    //国家编号
    NSString *CountryCode = carrier.mobileCountryCode;
    if (CountryCode == nil)
    {
        CountryCode = @"";
    }
    //网络供应商编码
    NSString *NetworkCode = carrier.mobileNetworkCode;
    if (NetworkCode == nil)
        
    {
        NetworkCode = @"";
    }
    NSString *mobile_country_code = [NSString stringWithFormat:@"%@%@",CountryCode,NetworkCode];
    if (mobile_country_code == nil)
    {
        mobile_country_code = @"";
    }
    
    NSString *carrier_name = nil;    //网络运营商的名字
    NSString *code = [carrier mobileNetworkCode];
    
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"])
    {
        //移动
        carrier_name = @"CMCC";
    }
    if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"])
        
    {
        // ret = @"电信";
        carrier_name =  @"CTCC";
    }
    
    if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"])
    {
        // ret = @"联通";
        carrier_name =  @"CUCC";
    }
    if (code == nil)
    {
        carrier_name = @"";
    }
    carrier_name = [[NSString stringWithFormat:@"%@-%@",carrier_name,carrier.carrierName] stringByRemovingPercentEncoding];
    return carrier_name;
}
//不过需要注意的是，使用这种方法时一定要保证statusbar没有隐藏。如果你的App隐藏了statusbar，那么你也就不能通过这种方法获得网络状态
- (NSString *)networkingStates
{
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    NSString *stateString = @"wifi";
    
    switch (type) {
        case 0:
            stateString = @"notReachable";
            break;
            
        case 1:
            stateString = @"2G";
            break;
            
        case 2:
            stateString = @"3G";
            break;
            
        case 3:
            stateString = @"4G";
            break;
            
        case 4:
            stateString = @"LTE";
            break;
            
        case 5:
            stateString = @"wifi";
            break;
            
        default:
            break;
    }
    
    return stateString;
}

/*
 *网络流量信息
 *通过读取系统网络接口信息，获取当前iphone设备的流量相关信息，统计的是上次开机至今的流量信息.
 */
-(void)checkNetworkflow
{
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1)
    {
        return;
    }
    uint32_t iBytes     = 0;
    
    uint32_t oBytes     = 0;
    
    uint32_t allFlow    = 0;
    
    uint32_t wifiIBytes = 0;
    
    uint32_t wifiOBytes = 0;
    
    uint32_t wifiFlow   = 0;
    
    uint32_t wwanIBytes = 0;
    
    uint32_t wwanOBytes = 0;
    
    uint32_t wwanFlow   = 0;
    
    struct IF_DATA_TIMEVAL time ;
    
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)
        
    {
        
        if (AF_LINK != ifa->ifa_addr->sa_family)
            
            continue;
        
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            
            continue;
        
        if (ifa->ifa_data == 0)
            
            continue;
        
        if (strncmp(ifa->ifa_name, "lo", 2))
            
        {
            
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            
            iBytes += if_data->ifi_ibytes;
            
            oBytes += if_data->ifi_obytes;
            
            allFlow = iBytes + oBytes;
            
            time = if_data->ifi_lastchange;
            
        }
        
        
        if (!strcmp(ifa->ifa_name, "en0"))
            
        {
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            
            wifiIBytes += if_data->ifi_ibytes;
            
            wifiOBytes += if_data->ifi_obytes;
            
            wifiFlow    = wifiIBytes + wifiOBytes;
            
        }
        
        if (!strcmp(ifa->ifa_name, "pdp_ip0"))
            
        {
            
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            
            wwanIBytes += if_data->ifi_ibytes;
            
            wwanOBytes += if_data->ifi_obytes;
            
            wwanFlow    = wwanIBytes + wwanOBytes;
            
        }
        
    }
    
    freeifaddrs(ifa_list);
    
    
    
    NSString *changeTime=[NSString stringWithFormat:@"%s",ctime(&time)];
    
    DEF_DEBUG(@"changeTime==%@",changeTime);
    NSString *receivedBytes= [self bytesToAvaiUnit:iBytes];
    
    DEF_DEBUG(@"receivedBytes==%@",receivedBytes);
    NSString *sentBytes       = [self bytesToAvaiUnit:oBytes];
    
    DEF_DEBUG(@"sentBytes==%@",sentBytes);
    NSString *networkFlow      = [self bytesToAvaiUnit:allFlow];
    
    DEF_DEBUG(@"networkFlow==%@",networkFlow);
    
    NSString *wifiReceived   = [self bytesToAvaiUnit:wifiIBytes];
    
    DEF_DEBUG(@"wifiReceived==%@",wifiReceived);
    NSString *wifiSent       = [self bytesToAvaiUnit: wifiOBytes];
    
    DEF_DEBUG(@"wifiSent==%@",wifiSent);
    
    NSString *wifiBytes      = [self bytesToAvaiUnit:wifiFlow];
    
    DEF_DEBUG(@"wifiBytes==%@",wifiBytes);
    NSString *wwanReceived   = [self bytesToAvaiUnit:wwanIBytes];
    
    DEF_DEBUG(@"wwanReceived==%@",wwanReceived);
    NSString *wwanSent       = [self bytesToAvaiUnit:wwanOBytes];
    
    DEF_DEBUG(@"wwanSent==%@",wwanSent);
    NSString *wwanBytes      = [self bytesToAvaiUnit:wwanFlow];
    
    DEF_DEBUG(@"wwanBytes==%@",wwanBytes);
}

-(NSString *)bytesToAvaiUnit:(int)bytes
{
    if(bytes < 1024)     // B
    {
        return [NSString stringWithFormat:@"%dB", bytes];
    }
    else if(bytes >= 1024 && bytes < 1024 * 1024) // KB
    {
        return [NSString stringWithFormat:@"%.1fKB", (double)bytes / 1024];
    }
    else if(bytes >= 1024 * 1024 && bytes < 1024 * 1024 * 1024)   // MB
    {
        return [NSString stringWithFormat:@"%.2fMB", (double)bytes / (1024 * 1024)];
    }
    else    // GB
    {
        return [NSString stringWithFormat:@"%.3fGB", (double)bytes / (1024 * 1024 * 1024)];
    }
}


@end
