//
//  UpdateProfileCell.m
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "UpdateProfileCell.h"

@implementation UpdateProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)uploadPic:(id)sender{
    [self.delegate uploadPic:sender];
}
- (IBAction)gConuntryCodeBtnClick:(id)sender{
    [self.delegate gConuntryCodeBtnClick:sender];
}
- (IBAction)gActivitiesBtn:(id)sender{
    [self.delegate gActivitiesBtn:sender];
}
- (IBAction)gTVShowsBtn:(id)sender{
    [self.delegate gTVShowsBtn:sender];
}
- (IBAction)gSportsBtn:(id)sender{
    [self.delegate gSportsBtn:sender];
}
- (IBAction)gBooksBtn:(id)sender{
    [self.delegate gBooksBtn:sender];
}
- (IBAction)gMusicBtn:(id)sender{
    [self.delegate gMusicBtn:sender];
}
- (IBAction)gMoviesBtn:(id)sender{
    [self.delegate gMoviesBtn:sender];
}
- (IBAction)gSaveBtn:(id)sender{
    [self.delegate gSaveBtn:sender];
}

@end
