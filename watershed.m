
I = imread('L06 sunflower.png');
if size(I,3) > 1 % image has three channels
    I = im2gray(I);
end

imshow(I)
title("Original Gray Scale Image")

gmag = imgradient(I);
imshow(gmag,[])
title("Gradient Magnitude")

se = strel("disk",12);
Io = imopen(I,se);
imshow(Io)
title("Opening")

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);
imshow(Iobr)
title("Opening-by-Reconstruction")

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
imshow(Iobrcbr)
title("Opening-Closing by Reconstruction")

fgm = imregionalmax(Iobrcbr);
imshow(fgm)
title("Regional Maxima of Opening-Closing by Reconstruction")

I2 = labeloverlay(I,fgm);
imshow(I2)
title("Regional Maxima Superimposed on Original Image")

se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);

fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(I,fgm4);
imshow(I3)
title("Modified Regional Maxima Superimposed on Original Image")

bw = imbinarize(Iobrcbr);
imshow(bw)
title("Thresholded Opening-Closing by Reconstruction")

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
imshow(bgm)
title("Watershed Ridge Lines")

gmag2 = imimposemin(gmag, bgm | fgm4);
L = watershed(gmag2);
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4;
I4 = labeloverlay(I,labels);
imshow(I4)
title("Markers and Object Boundaries Superimposed on Original Image")

Lrgb = label2rgb(L,"jet","w","shuffle");
imshow(Lrgb)
title("Colored Watershed Label Matrix")


figure1 = figure;
subplot(3,4,1), imshow(I), title('Original Gray Scale Image','FontSize',9)
subplot(3,4,2), imshow(gmag,[]), title("Gradient Magnitude",'FontSize',9)
subplot(3,4,3), imshow(Io), title("Opening",'FontSize',9)
subplot(3,4,4), imshow(Iobr), title("Opening-by-Reconstruction",'FontSize',9)
subplot(3,4,5), imshow(Iobrcbr),title("Opening-Closing by Reconstruction",'FontSize',9)
subplot(3,4,6), imshow(fgm), title("Regional Maxima of Opening-Closing by Reconstruction",'FontSize',9)
subplot(3,4,7), imshow(I2), title("Regional Maxima Superimposed on Orig. Image",'FontSize',9)
subplot(3,4,8), imshow(I3), title("Modified Regional Maxima Superimposed on Orig. Image",'FontSize',9)
subplot(3,4,9), imshow(bw), title("Thresholded Opening-Closing by Reconstruction",'FontSize',9)
subplot(3,4,10), imshow(bgm), title("Watershed Ridge Lines",'FontSize',9)
subplot(3,4,11), imshow(I4), title("Markers and Object Boundaries Superimposed on Orig. Image",'FontSize',9)
subplot(3,4,12),imshow(Lrgb),title("Colored Watershed Label Matrix",'FontSize',9)
saveas(figure1,'steps');

figure2 = figure;
imshow(I)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title("Colored Labels Superimposed Transparently on Original Image")
saveas(figure2,'watershed');


