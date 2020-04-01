//
//  InjectCode.m
//  AlanHook
//
//  Created by Alan on 2019/10/15.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "InjectCode.h"
#import "objc/runtime.h"
@implementation InjectCode
+(void)load
{
    NSLog(@"\n\n\n\n💐💐💐💐💐💐💐💐💐💐\n\n\n\n\n");
    
//    Method login =  class_getInstanceMethod(objc_getClass("XMALoginViewController"), @selector(p_loginAction));
//
//    Method hook_login = class_getInstanceMethod(self, @selector(hook_login));
//    method_exchangeImplementations(login, hook_login);
    
    old_login = method_getImplementation(class_getInstanceMethod(objc_getClass("XMALoginViewController"), @selector(p_loginAction)));
    method_setImplementation(class_getInstanceMethod(objc_getClass("XMALoginViewController"), @selector(p_loginAction)), hook_login);
}
IMP(*old_login)(id self ,SEL _cmd);
void hook_login(id self,SEL _cmd){
    NSLog(@"恶意代码注入，禁止登陆");
    NSLog(@"输入的密码是：%@",[[self valueForKey:@"passwordInputView"] valueForKey:@"password"]);
    old_login(self,_cmd);
}

- (void)hook_login
{
    NSLog(@"恶意代码注入，禁止登陆");
    NSLog(@"输入的密码是：%@",[[self valueForKey:@"passwordInputView"] valueForKey:@"password"]);
    [self performSelector:@selector(hook_login)];
}
@end
