function [acu] = accuracy(YPred,YValidation)

    correct_count = 0;    
    size_now = size(YPred);
    for i = [1:( size_now(1) )]
        index = 0;        
        right_index = find( YValidation(i,:) );        
        a = max(YPred(i,:));
        b = second_max(YPred(i,:));
        %if a >=b
            index = find(YPred(i,:) == a);
            fprintf('image index:%d ',i);
            fprintf('right index:%d ',right_index);
            fprintf('predict index:%d\n',index);
            if ((length(index)==1) && (index == right_index))
                correct_count = correct_count + 1;                
            end
        %end
    end
    acu = correct_count / size_now(1);
end

 function [ y ] = second_max( x )
        y = max(x(x<max(x)));
 end