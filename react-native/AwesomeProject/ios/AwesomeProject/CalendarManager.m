//
//  CalendarManager.m
//  AwesomeProject
//
//  Created by Lix on 2018/3/12.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "CalendarManager.h"

@implementation CalendarManager

RCT_EXPORT_MODULE();

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
//{
//  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
//}

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSString *)date)
//{
////  NSDate *date = [RCTConvert NSDate:ISO8601DateString];
//  RCTLogInfo(@"%@", date);
//}

RCT_EXPORT_METHOD(addEvent:(NSString *)name details:(NSDictionary *)details)
{
  NSString *location = [RCTConvert NSString:details[@"location"]];
  NSDate *date = [RCTConvert NSDate:details[@"time"]];
  RCTLogInfo(@"location: %@, time: %@", location, date);
  [self sendEventWithName:@"EventReminder" body:@{@"name": @"wssxxxxxxxx"}];
}
//
//RCT_EXPORT_METHOD(findEvent:(RCTResponseSenderBlock)callback)
//{
//  NSArray *events = @[@2150, @21, @1201];
//  callback(@[[NSNull null], events]);
//}

// 给Javascript发送事件

- (NSArray<NSString *> *)supportedEvents {
    return @[@"EventReminder"];
}

- (void)calendarEventReminderReceived:(NSNotification *)notification {
    NSString *eventName = notification.userInfo[@"name"];
    [self sendEventWithName:@"EventReminder" body:@{@"name" : eventName}];
}

@end
