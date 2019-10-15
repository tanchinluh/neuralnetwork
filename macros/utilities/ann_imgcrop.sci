function bw2 = ann_imgcrop(bw)
// Image pre-processing function to remove white spaces on all sides of images
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
//     bw2 = ann_imgcrop(bw)
//
// Parameters
//     bw : Sub-image with white spaces
//     bw2 : Output sub-images without white spaces
//
// Description
//     This function would remove the white spaces on all sides of an image, to 
//     product better features extraction for neural network
//
// Examples
//    I = imread(ann_getToolboxPath()+'demos\handwritting.bmp');
//    imshow(I);
//    img = ann_imgpreprocess(I);
//    figure();
//    imshow(img(2).entries);
//    img2 = ann_imgcrop(img(2).entries);
//    figure();
//    imshow(img2);
//
// See also
//     ann_imgfeatures
//     ann_imgpreprocess
//
// Authors
//     Tan C.L. 

// Find the boundary of the image
[y2temp x2temp] = size(bw);
x1=1;
y1=1;
x2=x2temp;
y2=y2temp;

// Finding left side blank spaces
cntB=1;
while (sum(bw(:,cntB))==y2temp)
    x1=x1+1;
    cntB=cntB+1;
end

// Finding right side blank spaces
cntB=1;
while (sum(bw(cntB,:))==x2temp)
    y1=y1+1;
    cntB=cntB+1;
end

// Finding upper side blank spaces
cntB=x2temp;
while (sum(bw(:,cntB))==y2temp)
    x2=x2-1;
    cntB=cntB-1;
end

// Finding lower side blank spaces
cntB=y2temp;
while (sum(bw(cntB,:))==x2temp)
    y2=y2-1;
    cntB=cntB-1;
end

// Crop the image to the edge
bw2=imcrop(bw,[x1,y1,(x2-x1)+1,(y2-y1)+1]); 
endfunction
