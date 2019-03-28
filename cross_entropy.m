classdef cross_entropy < nnet.layer.RegressionLayer
    % Example custom regression layer with mean-absolute-error loss.
    properties
      testnet = feedforwardnet(10);
    end
    methods
        function layer = cross_entropy(name)
            % layer = maeRegressionLayer(name) creates a
            % mean-absolute-error regression layer and specifies the layer
            % name.
			
            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = 'Cross entropy error';
        end
        
        function loss = forwardLoss(layer, Y, T)
            % loss = forwardLoss(layer, Y(index,batch), T(index,batch)) returns the MAE loss between
            % the predictions Y and the training targets T.

            % Calculate MAE.
            %size(Y)
            %size(T)
            %Y = 2 ./ (exp(-poslin(Y))+1) -1;
            %Y= poslin(Y);
            %Y= Y ./ (sum(Y,1)+ 1e-6);
%             Y = exp(Y-max(Y))./ sum(exp(Y-max(Y)));
             loss = -sum(sum(T.*log(Y+1e-9))); 
            
            %Y = exp(Y) ./ sum(exp(Y));            
            %loss = crossentropy(layer.testnet,T,(Y+1e-9),{1}) / 0.0095;
            
        end
        
        function dLdY = backwardLoss(layer, Y, T)
            % Returns the derivatives of the MAE loss with respect to the predictions Y
            %Y = 2 ./ (exp(-poslin(Y))+1) -1;
%             softmax = exp(Y-max(Y)) ./ (sum(exp(Y-max(Y))));
             dLdY = -(T)./(Y+1e-9);
%             eta = 1e-9;
%             Yold = Y;            
%             %Y = exp(Y) ./ sum(exp(Y));
%              
%             ss = size(Y);
%             num = ss(3);
%             batch = ss(4);
%             grad = zeros([1 1 num batch]);
%             for i = num
%                  vec = zeros([1 1 num batch]);
%                  vec(1,1,i,:) = 1;
%                  Y_2 = (Yold + eta*vec);
%                  %Y_2 = exp(Y_2) ./ sum(exp(Y_2));
%                  grad(1,1,i,:) = ( crossentropy(layer.testnet,(Y),T,{1}) - crossentropy(layer.testnet,(Y_2),T,{1}))/eta;
%             end
%             dLdY = single(-grad) / 0.0095;
        end
    end
end