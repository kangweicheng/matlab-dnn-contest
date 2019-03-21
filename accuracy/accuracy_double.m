function [acu] = accuracy_double(YPred,YValidation)

    function [ y ] = second_max( x )
        y = max(x(x<max(x)));
    end

    function [ y ] = third_max( x )
        y = max( x( x < second_max(x) ) );
    end
    
    correct_count = 0;    
    size_now = size(YPred);
    for i = [1:( size_now(1) )]        
        right_index = find( YValidation(i,:) );
        a = max(YPred(i,:));
        b = second_max(YPred(i,:));
        c = third_max(YPred(i,:));
        
        index = find(YPred(i,:) == a);
        index_2 = find(YPred(i,:) == b);
        fprintf('image index:%d ',i);
        fprintf('right index:%d ',right_index(1));
        fprintf('right index:%d ',right_index(2));
        fprintf('predict index:%d\n',index);
        fprintf('predict index:%d\n',index_2);    
        
        if (length(index) ==2) && (isequal(sort(index),right_index)) 
            correct_count = correct_count + 1;
            fprintf('correct');
        elseif (length(index) ==1) && (length(index_2) ==1) && (isequal(sort([index,index_2]),right_index))
               if (b > a)&& ( ( isempty(c) == 1 ) || (b >= c) )
                    correct_count = correct_count + 1;
                    fprintf('correct')
               end
        end
    end
    acu = correct_count / size_now(1);
end