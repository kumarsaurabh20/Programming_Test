function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

theta = theta .- alpha * (1/m) * (((X*theta) - y)' * X)';




    % ============================================================

    J_history(iter) = computeCostMulti(X, y, theta);

end

end
