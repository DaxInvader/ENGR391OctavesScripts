function bisection_method()
    format long;
    f = input('Enter the equation to solve: ');
    eps = input('Enter the TOL epsilon value: ');
    a = input('a_0: ');   b = input('b_0: ');
    x_0 = (a + b)/2.0;
    fx0 = f(x_0);
    no_iterations_expected = ceil((log(b - a) - log(eps))/(log(2)));
    fprintf('\nExpected number of iterations: %i\n\n', no_iterations_expected);
    fprintf(' i = 0 ; a_0 = %i ; b_0 = %i ; x_0 = %d ; f(x_0) = %d;\n', a, b, x_0, fx0);
    [solution, no_iterations] = bisection(f, a, b, eps);
    if solution <= b   % Solution found
        fprintf('Number of function calls: %d\n', no_iterations - 1);
        fprintf('A solution is: %-10.16ld\n', solution);
    else
        fprintf('Abort execution.\n');
    end
end

function [result1, result2] = bisection(f, x_L, x_R, eps)
    format long;
    if f(x_L)*f(x_R) > 0
        fprintf('Error! Function does not have opposite signs at interval endpoints!\n');
        return
    end
    x_M = (x_L + x_R)/2.0;
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
        x_M = (x_L + x_R)/2.0;
        f_M = f(x_M);
        fprintf(' i = %i ; a_%i = %-10.16ld ; b_%i = %-10.16ld ; x_%i = %-10.16ld ; f(x_%i) = %-10.16ld;\n', iteration_counter, iteration_counter, x_L, iteration_counter, x_R, iteration_counter, x_M, iteration_counter, f_M);
        iteration_counter = iteration_counter + 1;
    end
    result1 = x_M;
    result2 = iteration_counter;
end
