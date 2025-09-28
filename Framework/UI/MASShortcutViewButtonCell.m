#import "MASShortcutViewButtonCell.h"

@implementation MASShortcutViewButtonCell

-(void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    CGRect paddedFrame = cellFrame;
    
    //fix display on Tahoe
    if (@available(macOS 26, *)) {
        paddedFrame.size.width += 5.0;
        paddedFrame.origin.y -= 1.0;
    }
    
    //fix display on Big Sur
    else if (@available(macOS 11, *)) {
        
        //fix vertical alignment
        paddedFrame.origin.y -= 1.0;
        
        //fix cancel button alignment
        if (self.alignment == NSTextAlignmentRight &&
            (self.bezelStyle == NSBezelStyleTexturedRounded ||
             self.bezelStyle == NSBezelStyleRounded)) {
            paddedFrame.size.width -= 14.0;
            
            if (self.bezelStyle == NSBezelStyleTexturedRounded)
                paddedFrame.origin.x += 7.0;
        }
    }
    
    [super drawInteriorWithFrame:paddedFrame inView:controlView];
}

@end
