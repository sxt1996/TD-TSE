function  tree = get_one_tree_TD_TSE(X_subset,height_limit,height_current,dimension_may_use)
% to get one tree
% Input:
% X_subset£ºthe remaining part of the subset used to construct one tree;
% height_limit: the depth limit in the construction of one tree;
% height_current: the current depth of the constructed tree;
% dimension_may_use: the dimention of X being processed for the current depth;
% Output:
% results: constructed one tree




[band_num,X_remain]=size(X_subset);   

if ((height_current < height_limit) && (X_remain > 3))    
   dimension_now = dimension_may_use(height_current+1);  
   tree.dimension = dimension_now;
   tree.remain_num = X_remain;   
   seg_value_set =  X_subset(dimension_now,:);   
   seg_valud_max = max(seg_value_set(:));
   seg_valud_min = min(seg_value_set(:));
   
if seg_valud_max == seg_valud_min     
    tree = X_remain;
else
    range_random = rand(1);
    seg_value = seg_valud_min + (seg_valud_max - seg_valud_min) * range_random;  
   
    while (seg_value == seg_valud_min || seg_value == seg_valud_max)  
        range_random = rand(1);
        seg_value = seg_valud_min + (seg_valud_max - seg_valud_min) * range_random;  
    end
  
    tree.seg_value = seg_value;  
  
    X_left_index = find(seg_value_set <= seg_value);  
    X_right_index = find(seg_value_set > seg_value);   
    
    X_left = X_subset(:,X_left_index);
    X_right = X_subset(:,X_right_index);
  
    height_current = height_current + 1;    
    
    tree.left_node = get_one_tree_TD_TSE(X_left,height_limit,height_current,dimension_may_use);
    tree.right_node = get_one_tree_TD_TSE(X_right,height_limit,height_current,dimension_may_use);
end

else    
     tree = X_remain;
end    
     
end



