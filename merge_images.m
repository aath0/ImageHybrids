% Merges two images and creates a hybrid image with or without additional
% gaussian noise. All images need to be in the same directory ('filep')
% First version: 07.05.2018, Athina Tzovara

clear
filep = '/Users/atzovara/Documents/Projects/DualEEG/Images/'; % folder containing all images

im1f = 'platypus'; % image 1
im2f = 'cookingpot'; % image 2
ftype = '.png'; % file type

noise = 1; % add noise? 0: no noise, 1: add noise
noise_m = 0.1; % mean of gaussian noise
noise_v = 0.1; % variance of gaussian noise
lab = '';

im1 = imread([filep, im1f, ftype]);
im2 = imread([filep, im2f, ftype]);

% grayscale:
s1 = 1;
s2 = 1;

finIm = hybridIm(im1,im2,s1,s2);
finIm = finIm-min(finIm(:));
finIm = finIm./max(finIm(:));

% add noise:
if noise
    
    finIm = imnoise(finIm,'gaussian', noise_m, noise_v);
    lab = ['_noise_mean', num2str(noise_m), '_var', num2str(noise_v)];
end

% save output:
imwrite(finIm,[filep, im1f, '_', im2f, lab,ftype]);
