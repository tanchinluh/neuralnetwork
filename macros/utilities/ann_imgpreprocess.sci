function img = ann_imgpreprocess(I)
// Image pre-processing function
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
//     img = ann_imgpreprocess(I)
//
// Parameters
//     I : Input image
//     img : Output sub-images in cell format
//
// Description
//     This function would find the objects on the input image, crop them and 
//     save the object in output cell individually.
//
// Examples
//    I = imread(ann_getToolboxPath()+'demos\handwritting.bmp');
//    imshow(I);
//    img = ann_imgpreprocess(I);
//    size(img)
//    figure();
//    imshow(img(1).entries);
//
// See also
//     ann_imgfeatures
//     ann_imgcrop
//
// Authors
//     Tan C.L. 

Igray = rgb2gray(I);
Ibw = im2bw(Igray,0.7);
Iedge = 1 - Ibw;

se = imcreatese('rect', 5,5);
Iedge2 = imdilate(Iedge, se);

// [Ilabel2 A2 rect2] = bwlabel(Iedge2); // old code using bwlabel function from octave
Ilabel = imlabel(Iedge2);
//IFilter = FilterBySize(Ilabel,5);
//Feature_to_find = CreateFeatureStruct(%t);
//rect_s = AnalyzeBlobs(IFilter, Feature_to_find);
[Area, rect_s, ctr] = imblobprop(Ilabel);

rect = [];
Ic = [];
//pause
for cnt = 1:size(rect_s,2)
    rect = [rect rect_s(:,cnt)];
    Ic = [Ic;ctr(:,cnt)'];
end
//pause
Ic(:,3) = (mean(Ic.^2,2)).^(1/2);
Ic(:,4) = [1:50]';

Ic2 = Ic;
[temp,order]=gsort(Ic2(:,[2]),'lr','i');
Ic2 = Ic2(order,:);

for cnt = 1:5
    Ic2((cnt-1)*10+1:cnt*10,:) = gsort(Ic2((cnt-1)*10+1:cnt*10,:),'lr','i');
end

Ic3 = Ic2(:,1:2);
ind = Ic2(:,4);


img = cell(50,1);
for cnt = 1:50
    img{cnt} = imcrop(Ibw,rect(:,ind(cnt)));
end

// Showing Result      
//for cnt = 1:50
//  sleep(300);
//  imshow(imresize(img(cnt).entries.*1,5));
//end

endfunction

