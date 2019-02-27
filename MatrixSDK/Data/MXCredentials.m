/*
 Copyright 2019 New Vector Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXCredentials.h"

#import "MXJSONModels.h"

@implementation MXCredentials

- (instancetype)initWithHomeServer:(NSString *)homeServer userId:(NSString *)userId accessToken:(NSString *)accessToken
{
    self = [super init];
    if (self)
    {
        _homeServer = [homeServer copy];
        _userId = [userId copy];
        _accessToken = [accessToken copy];
    }
    return self;
}

- (instancetype)initWithLoginResponse:(MXLoginResponse *)loginResponse
                withDefaultHomeServer:(NSString *)homeServer
{
    self = [super init];
    if (self)
    {
        _userId = loginResponse.userId;
        _accessToken = loginResponse.accessToken;
        _deviceId = loginResponse.deviceId;

        // Workaround: HS does not return the right URL. Use the passed one
        _homeServer = homeServer;
    }
    return self;
}

- (NSString *)homeServerName
{
    return [NSURL URLWithString:_homeServer].host;
}

@end
