classdef mysoftmax < nnet.layer.Layer

    properties
        % (Optional) Layer properties.

        % Layer properties go here.
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.

        % Layer learnable parameters go here.
    end
    
    methods
        function layer = mysoftmax(name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.
            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = 'Softmax';
            % Layer constructor function goes here.
        end
        
        function Z = predict(layer,X)
            % Forward input data through the layer at prediction time and
            % output the result
            %
            % Inputs:
            %         layer    -    Layer to forward propagate through
            %         X        -    Input data
            % Output:
            %         Z        -    Output of layer forward function
            
            % Expressing the computation in vectorized form allows it to
            % execute directly on the GPU.
            Z = exp(X-max(X)) ./ sum(exp(X-max(X)));
        end
        
        function [dLdX] = backward(layer, X, Z, dLdZ, ~)
            % Backward propagate the derivative of the loss function through 
            % the layer
            %
            % Inputs:
            %         layer             - Layer to backward propagate through
            %         X                 - Input data
            %         Z                 - Output of layer forward function            
            %         dLdZ              - Gradient propagated from the deeper layer
            %         memory            - Memory value which can be used in
            %                             backward propagation [unused]
            % Output:
            %         dLdX              - Derivative of the loss with
            %                             respect to the input data
            %         dLdAlpha          - Derivatives of the loss with
            %                             respect to alpha
            
            % Original expression:
            % dLdX = (dLdZ .* (X > 0)) + ...
            %     (dLdZ .* (layer + Z) .* (X <= 0));
            %
            % Optimized expression:
            dLdX = dLdZ .* (Z - Z.*Z);
        end
    end
end