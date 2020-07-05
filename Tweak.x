#import <MBProgressHUD/MBProgressHUD.h>

%hook UIPasteboard

+ (UIPasteboard *)generalPasteboard {
	UIPasteboard *origResult = %orig;

	if([UIApplication sharedApplication].applicationState != UIApplicationStateInactive)
	{
		dispatch_async(dispatch_get_main_queue(), ^{
			NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
			NSString *warning = [[infoDictionary objectForKey:@"CFBundleDisplayName"] stringByAppendingString:@" Access Clipboard!"];
			MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
			// Set the text mode to show only text.
			hud.mode = MBProgressHUDModeText;
			hud.userInteractionEnabled = NO;
			hud.label.text = NSLocalizedString(warning, @"HUD message title");
			// Move to bottm center.
			hud.offset = CGPointMake(0.f, -MBProgressMaxOffset);
			[hud hideAnimated:YES afterDelay:1.f];
	});


	}
	return origResult;
}

+ (UIPasteboard *)pasteboardWithName:(NSString *)pasteboardName create:(BOOL)create {
	UIPasteboard *origResult = %orig;
	return origResult;
}

+ (UIPasteboard *)pasteboardWithUniqueName {
	UIPasteboard *origResult = %orig;
	return origResult;
}

- (NSData *)dataForPasteboardType:(NSString *)pasteboardType {
	NSData *origResult = %orig(pasteboardType);
	return origResult;
}

- (NSArray *)dataForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet {
	NSArray *origResult = %orig(pasteboardType, itemSet);
	return origResult;
}

- (void)setData:(NSData *)data forPasteboardType:(NSString *)pasteboardType {
	%orig(data, pasteboardType);
	return;
}

- (void)setValue:(id)value forPasteboardType:(NSString *)pasteboardType {
	%orig(value, pasteboardType);
	return;
}

- (void)addItems:(NSArray *)items {
	%orig(items);
	return;
}

- (id)valueForPasteboardType:(NSString *)pasteboardType {
	id origResult = %orig(pasteboardType);
	return origResult;
}

- (NSArray *)valuesForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet {
	NSArray *origResult = %orig(pasteboardType, itemSet);
	return origResult;
}

%end