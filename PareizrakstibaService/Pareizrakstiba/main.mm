/*
 main.mm
 
 Pareizrakstība - Latviešu valodas pareizrakstības pārbaude
 Pareizrakstiba - Latvian spellcheck
 Copyright (C) 2008-2013 kroko / Reinis Adovics
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import <Foundation/Foundation.h>
#import <Foundation/NSSpellServer.h>
#import "PareizrakstibaSpellServer.h"
#import "PareizrakstibaDelegate.h"

int main()
{
    NSAutoreleasePool *autoreleasepool= [[NSAutoreleasePool alloc] init];
	NSLog(@"Pareizrakstiba 3.1 (c) 2008-2013 kroko\n");
	PareizrakstibaSpellServer *pareizrakstibaSpellServer = [[PareizrakstibaSpellServer alloc] init];
	if ([pareizrakstibaSpellServer registerLanguage:@"lv" byVendor:@"Apple"])
	{
		[pareizrakstibaSpellServer setDelegate:[[[PareizrakstibaDelegate alloc] init] autorelease]];
		[pareizrakstibaSpellServer run];
		fprintf(stderr, "Unexpected death of Pareizrakstiba!\n");
	} else {
		fprintf(stderr, "NSSpellServer unable to register Latvian language.\n");
	}
	[autoreleasepool release];
	return 0;
}