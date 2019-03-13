function counter(index)
    original = index;
    if(index > 1)
        index = index - 1;
        fprintf('\b');
        while index/10>=1
            fprintf('\b');
            index = index / 10;
        end
    end
    
    fprintf('%d',original);
end