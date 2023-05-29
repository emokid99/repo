#import <BootSound.m>

static NSString *GetNSString(NSString *pkey, NSString *defaultValue){
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.emokidxd.bootsoundprefs.plist"];

	return [Dict objectForKey:pkey] ? [Dict objectForKey:pkey] : defaultValue;
}

static BOOL GetBool(NSString *pkey, BOOL defaultValue){
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.emokidxd.bootsoundprefs.plist"];

	return [Dict objectForKey:pkey] ? [[Dict objectForKey:pkey] boolValue] : defaultValue;
}

%hook SpringBoard
-(id)init{
	id orig = %orig;

	bool enabled = GetBool(@"Enabled", YES);

	if (!enabled)
		return orig;

	NSString *customSoundPath = GetNSString(@"BootSound", @"caf");
	customSoundPath = [NSString stringWithFormat:@"/var/mobile/Documents/BootSounds/%@.caf", customSoundPath];

	NSURL *bootSound = [NSURL fileURLWithPath:customSoundPath];

	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef)bootSound,&soundID);
	AudioServicesPlaySystemSound(soundID);

//	AudioServicesDisposeSystemSoundID(soundID);

	return orig;
}
%end