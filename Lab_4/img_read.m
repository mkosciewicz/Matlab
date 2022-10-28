function [img] = img_read(filename)
img = imread(filename);
img=double(img(:,:,1));
end

