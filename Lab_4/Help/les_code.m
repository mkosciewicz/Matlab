img = imread('R.png');
img=double(img(:,:,1));
figure, imshow(uint8(img))
x=1:size(img,2);
y=1:size(img,1)';
[px,py] = gradient(img);
figure
contour(x,y,img)
hold on
quiver(x,y,px,py)
hold off
px2 =rescale(px,1,256);
figure, imshow(uint8(px2)>130)

% x = -2:0.2:2;
% y = x';
% z = x .* exp(-x.^2 - y.^2);
% [px,py] = gradient(z);
% figure
% contour(x,y,z)
% hold on
% quiver(x,y,px,py)
% hold off

f= img(522,:,1);
plot(f)


fg = px(255,:,1);
imshow(fg)
