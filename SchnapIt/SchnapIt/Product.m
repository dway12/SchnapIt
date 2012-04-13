//
//  Product.m
//  SchnapIt
//
//  Created by DAVID HAYDEN on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize name = _name;
@synthesize summary = _summary;
@synthesize buyURL = _buyURL;
@synthesize rating = _rating;
@synthesize price = _price;
@synthesize image = _image;


-(id) initWithTitle:(NSString *)name 
               buyURL:(NSString *)buyURL 
              summary:(NSString *)summary 
             rating:(int)rating 
              price:(float)price
                image:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.name = name;
        self.buyURL = buyURL;
        self.summary = summary;
        self.rating = rating%6;
        self.price = price;
        self.image = image;
    }
    return self;
}

-(NSString*) getNaturalRating {
    if (_rating == 0)
    {
        return @"Horrible";
    }
    else if (_rating == 1)
    {
        return @"Poor";
    }
    else if (_rating == 2)
    {
        return @"Adequate";
    }
    else if (_rating == 3)
    {
        return @"Good";
    }
    else if (_rating == 4)
    {
        return @"Great";
    }
    return @"Excellent";
    
}

+(id) getMacbookLaptop {
    return [[Product alloc] initWithTitle:@"Macbook Pro" 
                                   buyURL:@"http://www.apple.com" 
                                  summary:@"Ever since Apple's move from PowerPC chips to Intel's offerings, MacBook Pro upgrades have happened with better frequency and pretty good foreshadowing. And last month, Apple upgraded its main portable line right on schedule. Gone are the Core 2 Duos and Nehalem processors, their place taken by Intel's Sandy Bridge Core i5 and Core i7 processors across the entire line. In the 15\" and 17\" MacBook Pros, these chips have four cores, the 13\" has either a dual-core i5 or a dual-core i7. had no plans to upgrade, but then fate did its thing and I ended up walking out of a well known big box retailer with a shiny new 13\" i7 MacBook Pro, which in standard configuration sells for $1499.\n\nI must confess that since the arrival of the iPad, I'd been telling everyone that I couldn't see myself bothering with a new MacBook for another couple of years, now that most of my time was spent with the tablet. That would have been true had it not been for hardware trouble with my Santa Rosa MacBook, and after telling myself that a little over three years is an acceptable upgrade time, I now get what the unibody fuss is all about. But I'm getting ahead of myself. First, the unboxing." 
                                   rating:5 
                                    price:2199.00
                                    image:[UIImage imageNamed:@"macbook_laptop.jpg"]];
}

+(id) getLenovoLaptop {
    return [[Product alloc] initWithTitle:@"Lenovo X200" 
                                   buyURL:@"http://www.lenovo.com" 
                                  summary:@"The ThinkPad tablet is Lenovo’s second recent entry into the tablet space, a professional cousin to the cutesier IdeaPad. Adorned with a stylus and a full complement of ports, the heavy Android 3.1 ThinkPad tablet favors flexibility over portability, but its performance is middling at best when compared to other Android devices.\n\nThe ThinkPad doesn’t escape the thick-and-heavy profile that plagues Android tablets. It's not as hefty as the Toshiba Thrive, while still managing to offer up a decent number of ports. The ThinkPad tablet has a soft rubberized back that curves sharply into the front, and is thinner and lighter than the Thrive at 0.55 inches and 1.57 pounds (but still significantly bulkier than the iPad).\n\nThe ThinkPad's bezel is thinner than the iPad's, and that combined with the weight makes holding the tablet in landscape with one hand gripping the side something akin to a beer stein-holding competition. (Tablet-holding competitions: the office diversion/test of might that may never be.) Those with delicate avian bone wrists would be more comfortable wrapping their forearms behind it for extending holding/reading/writing periods.\n\nThe ThinkPad tablet is a fun house of ports and buttons. Four buttons sit along the bottom of the ThinkPad’s screen: Home, Back, a dedicated browser button, and an orientation lock button. These buttons only click in on their internal edges to prevent unintentional clicks because they wrap around to the side of the device, so they’re a little annoying to use.." 
                                   rating:3 
                                    price:1199.99
                                    image:[UIImage imageNamed:@"lenovo_laptop.jpg"]]; 
}


@end
