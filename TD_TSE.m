function result_2D = TD_TSE(X_cube, target, tree_size, tree_num)
% paper:¡¶Target Detection Through Tree-Structured Encoding for Hyperspectral Images¡·
% Input:
% X£ºan HSI being processed; target:a priori target spectrum;
% tree_size: subsampling size ratio; tree_num: subsampling times;
% Output:
% results: detection results



[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 
clear('X_cube','X_use');

multiple_trees = get_multiple_trees_TD_TSE(X, tree_size, tree_num);  

target_code_list = get_code_list(target,multiple_trees); 
result = zeros(1, pixel_num);

for i = 1:pixel_num
    x = X(:,i);   
    x_code_list = get_code_list(x,multiple_trees); 
    result(i) = get_anomaly_score_encode(x_code_list,target_code_list); 
end

r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines);   


end
