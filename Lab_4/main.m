clc;clear;close;

brgh = img_read("CT-scan-bod.jpg");

%figure, imshow(uint8(brightness))
x=1:size(brgh,2); y=1:size(brgh,1);

[px,py] = gradient_code(brgh);
figure
contour(x,y,brgh)
hold on
quiver(x,y,px,py)
hold off
px2 =rescale(px,1,164);

%
figure, imshow(uint8(px2)>85)
%
f= brgh(164, :);

fg = px(164,:,1);

imshow(fg);
% plot(f, fg);
%
% plot(px,py);