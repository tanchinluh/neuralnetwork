function lett = ann_imgfeatures(bw2)
// Image pre-processing function to extract features from binary image 
//
//    Copyright 2011 Trity Technologies.
//    
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 2 of the License, or
//    (at your option) any later version.
//    
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//    
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/
//
// Calling Sequence
//     lett = ann_imgfeatures(bw2)
//
// Parameters
//     bw2 : Input binary image
//     img : Output features
//
// Description
//     This function will take the binary image and change it to 5 x 7 matrix, 
//     before converting it into single vector of 35 values.
//
// Examples
//    I = imread(ann_getToolboxPath()+'demos\handwritting.bmp');
//    imshow(I);
//    img = ann_imgpreprocess(I);
//    I_feature = ann_imgfeatures(img(2).entries);
//    figure();
//    plotchar(I_feature);
//
// See also
//     ann_imgpreprocess
//     ann_imgcrop
//
// Authors
//     Tan C.L. 

bw_7050=imresize(double(bw2),[70,50]);
for cnt=1:7
    for cnt2=1:5
        Atemp=sum(bw_7050((cnt*10-9:cnt*10),(cnt2*10-9:cnt2*10)),'m');
        lett((cnt-1)*5+cnt2)=sum(Atemp,'m');
    end
end

lett=((100-lett)/100);
lett=lett';
endfunction
