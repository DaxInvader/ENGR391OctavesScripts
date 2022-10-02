function newton_method()
    format long;
    f = input('Enter the equation to solve: ');
    x_0 = input('Enter the initial guess: ');
    fx0 = f(x_0);
    it = input('how many iterations? : ');
    fprintf(' i = 0 ; x_0 = %d ; f(x_0) = %-10.16ld ;\n', x_0, fx0);
    [solution, no_iterations] = newtonmethod(f, x_0, it);
  % Solution found
    fprintf('Number of function calls: %d\n', no_iterations - 1);
    fprintf('A solution is: %-10.16ld\n', solution);

end

function [result1, result2] = newtonmethod(f, x_0, it)
    pkg load symbolic;
    syms x;
    iteration_counter = 1;
    old_x = f(x_0);
    fx = f(old_x);
    g = diff(f, x);
    x = (old_x);
    dfx = eval(g);
    new_x = old_x - (fx/dfx);
    err = new_x - old_x;
    while iteration_counter <= it
        fprintf(' i = %i ; x_%i = %-10.16ld ; x_%i + 1 = %-10.16ld ; error (relative) = %-10.16ld\n', iteration_counter, iteration_counter, old_x, iteration_counter, new_x, err);
        iteration_counter = iteration_counter + 1;
        old_x = new_x;
        fx = f(old_x);
        x = (old_x);
        dfx = eval(g);
        new_x = old_x - (fx/dfx);
        err =  err = new_x - old_x;
    end
    result1 = new_x;
    result2 = iteration_counter;
end
