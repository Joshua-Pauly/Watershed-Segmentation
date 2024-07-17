
The purpose of watershed segmentation is to delineate and identify boundaries between distinct objects or regions within an image, enhancing the accuracy and efficiency of image analysis. This method simulates the process of a watershed filling with water, where contours are detected at points where different regions converge.Watershed segmentation is commonly used in medical imaging to separate and identify different anatomical structures, such as organs or tissues, within complex images like MRI or CT scans.

The purpose of this project was to demonstarte the capabilities of watershed segmentation on a sun flower field. 
Listed are the steps taken:
1)	Grayscale the image. 
2)	Gradient magnitude as a segmentation function. This will show boundries of objects
3)	Mark foreground of objects: I used “disk Strel function with a radius of 12 as described in the assignment.
4)	Opening by recostruction using imerode and imreconstruct
5)	Opening-closing by reconstruct using imdilate, imreconstruct, and imcompliment. This removes small blemisheswithout affecting shape.
6)	Regional Maxima of opening-closing by reconstruction. Obtains foreground marker
7)	Superimpose step 6 on grayscale image
8)	By using imclose and imrode, and bwareopen it cleans the edges of the marker blobs. This step is labled Modified Regional Maxima Superimposed on Origional Image in the picture below.
9)	Compute background marker using imbianrize. Labled threshold opening closing by reaconstruction
10)	Computer watershed ridge lines using bwdist and watershed.
11)	Compute watershed transform of segmentation function using imimposemin to modify the gradientmagnitude image so that regional minima occur at foreground and background marker pixels. 
12)	For visualization overlay the markers and object boundries and superimpose on origional image. 
13)	Display the label matrix as a color image uing label2rgb
14)	Uing that last image we can overlait on the original image with low transperancy to get the Colored Labels Superimposed Transparency on Origional Image, Image.


![image](https://github.com/user-attachments/assets/2720d181-e574-403d-a571-985a7881ee75)

![image](https://github.com/user-attachments/assets/800d9eec-b4ae-4a39-a704-67749da48bd2)

