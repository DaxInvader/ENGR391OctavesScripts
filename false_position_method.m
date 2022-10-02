function false_position_method()
    format long;
    f = input('Enter the equation to solve: ');
    eps = input('Enter the TOL epsilon value: ');
    a = input('a_0: ');   b = input('b_0: ');
    fa = f(a);
    fb = f(b);
    x_0 = (a*fb - b*fa)/(fb - fa);
    fx0 = f(x_0);
    error = abs((b - a)/2.0);
    fprintf(' i = 0 ; a_0 = %i ; f(a_0) = %-10.16ld ; b_0 = %i ; f(b_0) = %-10.16ld ; x_0 = %d ; f(x_0) = %d; %d >=? %d\n', a, fa, b, fb, x_0, fx0, error, eps);
    [solution, no_iterations] = falseposition(f, a, b, eps);
    if solution <= b   % Solution found
        fprintf('Number of function calls: %d\n', no_iterations - 1);
        fprintf('A solution is: %-10.16ld\n', solution);
    else
        fprintf('Abort execution.\n');
    end
end

function [result1, result2] = falseposition(f, x_L, x_R, eps)
    format long;
    if f(x_L)*f(x_R) > 0
        fprintf('Error! Function does not have opposite signs at interval endpoints!\n');
        return
    end
    fxr = f(x_R);
    fxl = f(x_L);
    x_M = (x_L*fxr - x_R*fxl)/(fxr - fxl);
    f_M = f(x_M);
    iteration_counter = 1;
    while abs(f_M) > eps
        left_f = f(x_L);
        right_f = f(x_R);
        if left_f*f_M > 0   % i.e., same sign
            x_L = x_M;
        else
            x_R = x_M;
        end
        fxr = f(x_R);
        fxl = f(x_L);
        x_M = (x_L*fxr - x_R*fxl)/(fxr - fxl);
        f_M = f(x_M);
        error = abs((x_R - x_L)/2.0);
        fprintf(' i = %i ; a_%i = %-10.16ld ; b_%i = %-10.16ld ; x_%i = %-10.16ld ; f(x_%i) = %-10.16ld ; %d >=? %d\n', iteration_counter, iteration_counter, x_L, iteration_counter, x_R, iteration_counter, x_M, iteration_counter, f_M, error, eps);
        iteration_counter = iteration_counter + 1;
    end
    result1 = x_M;
    result2 = iteration_counter;
end
