clear all;  
clc; 
close all

%% read the HSI data being processed
a = dir;
filename_path = a.folder;     
filename_path = strcat(filename_path,'\');
name_HSI = 'cut_1';     
filename = strcat(filename_path,name_HSI,'.mat');

load(filename);
X_cube = data;
clear('data');
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

mask = squeeze(gt(:));   

%% read the given target spectrum
name_target = 'target.mat';        
filename_target = strcat(filename_path, name_HSI, '_', name_target);    
load(filename_target);

%% set parameters for the construction of multiple trees 

tree_size_ratio = 0.005;   % subsampling size ratio
tree_size = ceil(pixel_num * tree_size_ratio);   % subsampling size 
tree_num = 40; % subsampling times

%% perform target detecion with TD-TSE
r_TD_TSE = TD_TSE(X_cube, target, tree_size, tree_num); 
%% illustrate detecion results
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_TD_TSE); axis image;   title('Detection map of TD-TSE')    

%% evaluate detection results with ROC
r_255 = squeeze(r_TD_TSE(:));
figure;
AUC = ROC(mask,r_255,'r')       

