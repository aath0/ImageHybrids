clear
filep = '/Users/atzovara/Documents/Projects/DualEEG/Images/';

ftype = '.png';
im1f = 'platypus'; % image 1
im2f = 'cookingpot' % image 2
lab = '';

noise = 1; % add noise? 0: no noise, 1: add noise
noise_m = 0.1; % mean of gaussian noise
noise_v = 0.2; % variance of gaussian noise

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
imwrite(finIm,[filep, im1f, '_', im2f, lab,ftype]);
