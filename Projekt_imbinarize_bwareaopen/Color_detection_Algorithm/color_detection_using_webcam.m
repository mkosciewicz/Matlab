%Color Detection and Separation using arduino and Matlab interfaced with a
%Webcam. Please read the README.txt FILE before further procedure.
% To clear the Workspace
clc;clear;close;

%To get the data from the User in the form of image.
%m='yellow2.jpg';         % Storing the image to a variable. Make sure the
                          % image is present in current directory
%im= imread(m);           % imread() is a function to read the image
%subplot(2,2,1);          % 2x2 matrix to display the image @ POS(1,1)
%imshow(m);               %imshow() is a function to display the image
%title('Raw fed Image');

%In this project, We are able to detect RGB colors using basic MATLAB codes
%without much complications.

%Initially we are initialzing the Live video stream
  imaqreset          %delete and resets image aquisition toolbox functions
  info= imaqhwinfo;  %Information regarding the Adaptors 
  vid= videoinput('winvideo','admin', 'QVGA_320X240');  %videoinput('apaptername','device_ID','format')
  set(vid, 'FramesPerTrigger', Inf);   %Specify number of frames to acquire per trigger using selected video source
  set(vid, 'ReturnedColorspace', 'rgb') %Set the video input as RGB or grayscale.
  vid.FrameGrabInterval = 5;      %An interval between frames, Here 5 frame interval between two frames
  start(vid);                     % start
  preview(vid);                   %Visualize the video
  
% Set loop from the value of slider
  while(vid.FramesAcquired<=300)    % Its a loop which runs for 300 frames, It can be varied as required.
% current snapshot
  im = getsnapshot(vid);            %To convert the live stream video into a screenshot 

% Red color detection
  r=im(:,:,1); g=im(:,:,2); b=im(:,:,3); % r= red object g= green and b= blue objects
  diff_red=imsubtract(r,rgb2gray(im));   % To separate RED objects from a gray image
  diff_r=medfilt2(diff_red,[3 3]);       % Applting median filter
  bw_r=imbinarize(diff_r,0.2);           % To convert grayscale image to Black and white with a threshold value of 0.2
  area_r=bwareaopen(bw_r,300);           % To remove objects less than 300 pixels
  R=sum(area_r(:));                      % Used as a function for segregation
  rm=immultiply(area_r,r);  gm=g.*0;  bm=b.*0; %Multiplies the red detected object with red to visualize.
  image_r=cat(3,rm,gm,bm);                     %combines all RGB image
  subplot(2,2,2);
  imshow(image_r);                             % Displays the image
  title('RED');                               
    
% Green color detection 
  r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
  diff_green=imsubtract(g,rgb2gray(im));
  diff_g=medfilt2(diff_green,[3 3]);
  bw_g=imbinarize(diff_g,0.071);
  area_g=bwareaopen(bw_g,300);
  G=sum(area_g(:));
  gm=immultiply(area_g,g);  rm=r.*0;  bm=b.*0;
  image_g=cat(3,rm,gm,bm);
  subplot(2,2,3);
  imshow(image_g);
  title('GREEN');
     
% Blue color detection
  r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
  diff_blue=imsubtract(b,rgb2gray(im));
  diff_b=medfilt2(diff_blue,[3 3]);
  bw_b=imbinarize(diff_b,0.2);
  area_b=bwareaopen(bw_b,300);
  B=sum(area_b(:));
  bm=immultiply(area_b,b);  gm=g.*0;  rm=r.*0;
  image_b=cat(3,rm,gm,bm);
  subplot(2,2,4);
  imshow(image_b);
  title('BLUE');
   
  
  end
  
  %Once the program has run, the data's are cleared.
  stop(vid);                              
  delete(vid);
  clear;
    
 
  