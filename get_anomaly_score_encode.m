function  anomaly_score = get_anomaly_score_encode(x_code_list, target_code_list)
% to get the anomaly score for the testing pixel
% Input:
% x_code_list£ºencoding results of the testing pixel on multiple trees
% target_code_list:encoding results of the the given target on multiple trees
% Output:
% anomaly_score: anomaly score of the testing pixel
 
tree_num  = length(x_code_list);  
diff_sum = 0;

for i =1:tree_num    
    x_code = x_code_list{i};           
    target_code = target_code_list{i};  
    x_code_length = length(x_code);
    target_code_length = length(target_code);
    length_diff = abs(x_code_length - target_code_length); 
    if x_code_length >= target_code_length    
        x_code_use = x_code(1:target_code_length);
        cal_use = xor(x_code_use,target_code);
        zero_position = find(cal_use == 1);
        if length(zero_position)~=0     
            first_nonzero_position = zero_position(1);
            repeat_path = 2*(target_code_length - (first_nonzero_position -1));
        else       
            repeat_path = 0;
        end
        
        
    else  
        target_code_use = target_code(1:x_code_length);
        cal_use = xor(x_code,target_code_use);
        zero_position = find(cal_use~=0);
        first_nonzero_position = zero_position(1);
        repeat_path = 2*(x_code_length - (first_nonzero_position -1));

    end
    diff_score = repeat_path + length_diff;
    diff_sum = diff_sum + diff_score;
    

end

diff_average = diff_sum/tree_num;   
anomaly_score = exp(-diff_average);   

end



