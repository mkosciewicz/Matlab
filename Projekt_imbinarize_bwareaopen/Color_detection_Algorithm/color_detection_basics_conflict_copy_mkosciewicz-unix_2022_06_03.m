%To get the data from the User in the form of image.
 m='red3.jpg';         % Storing the image to a variable. Make sure the
                          % image is present in current directory
 im= imread(m);           % imread() is a function to read the image
 subplot(3,3,1);          % 2x2 matrix to display the image @ POS(1,1)
 imshow(m);               %imshow() is a function to display the image
 title('Raw fed Image');



% Red color detection
  r=im(:,:,1); g=im(:,:,2); b=im(:,:,3); % r= red object g= green and b= blue objects
  diff_red=imsubtract(r,rgb2gray(im));   % To separate RED objects from a gray image
  subplot(3,3,2);          
  imshow(diff_red);               
  title('Subtracted Image');
  diff_r=medfilt2(diff_red,[3 3]);       % Applting median filter
  subplot(3,3,3);          
  imshow(diff_r);               
  title('Median filtered Image');  
  bw_r=imbinarize_proper(diff_r,0.2);           % To convert grayscale image to Black and white with a threshold value of 0.2
  subplot(3,3,4);          
  imshow(bw_r);               
  title('Binary Image');
  area_r=bwareaopen(bw_r,300);           % To remove objects less than 300 pixels
  subplot(3,3,5);          
  imshow(area_r);               
  title('300 Pixel removed Image');
  R=sum(area_r(:));                            % Used as a function for segregation
  rm=immultiply(area_r,r);  gm=g.*0;  bm=b.*0; %Multiplies the red detected object with red to visualize.
  subplot(3,3,6);          
  imshow(rm);               
  title('Red Multiplied Image');
  image_r=cat(3,rm,gm,bm);                     %combines all RGB image
  subplot(3,3,7);          
  imshow(image_r);               
  title('Combined Image');
  subplot(3,3,9);
  imshow(image_r);                             % Displays the image
  title('Final Image');                               
 