%==============================================================
%==============================================================
clear ; close all; clc

fprintf('Loading data ...\n');

data = load('multi2_array.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;


fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];

fprintf('Running gradient descent ...\n');

alpha = 0.01;
num_iters = 400;

theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');


fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

cell_value = 0; % You should change this

% ============================================================
% ============================================================

fprintf(['Predicted cell numbers for double normalized signal intensity' ...
         '(using gradient descent):\n $%f\n'], cell_value);

