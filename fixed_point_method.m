function fixed_point_method()
    format long;
    f = input('Enter the equation to solve: ');
    x_0 = input('Enter the initial guess: ');
    fx0 = f(x_0);
    fprintf(' i = 0 ; x_0 = %d ; f(x_0) = %-10.16ld ; Estimated e: N/A\n', x_0, fx0);
    [solution, no_iterations] = fixedpointnaive(f, x_0);
  % Solution found
    fprintf('Number of function calls: %d\n', no_iterations - 1);
    fprintf('A solution is: %-10.16ld\n', solution);

end

function [result1, result2] = fixedpointnaive(f, x_0)
    iteration_counter = 1;
    old_x = x_0;
    new_x = f(old_x);
    err = new_x - old_x;
    while iteration_counter <= 100
        fprintf(' i = %i ; x_%i = %-10.16ld ; f(x_%i) = %-10.16ld ; Estimated error: %-10.16ld\n', iteration_counter, iteration_counter, old_x, iteration_counter, new_x, err);
        iteration_counter = iteration_counter + 1;
        old_x = new_x;
        new_x = f(old_x);
        err = new_x - old_x;
        if new_x == f(new_x)
              fprintf(' i = %i ; x_%i = %-10.16ld ; f(x_%i) = %-10.16ld ; Estimated error: %-10.16ld\n', iteration_counter, iteration_counter, old_x, iteration_counter, new_x, err);
              result1 = new_x;
              result2 = iteration_counter;
          return
        endif
        if isnan(new_x)
          fprintf(' i = %i ; x_%i = %-10.16ld ; f(x_%i) = %-10.16ld ; Estimated error: %-10.16ld\n', iteration_counter, iteration_counter, old_x, iteration_counter, new_x, err);
          fprintf("The equation converges with the current guess!\n");
          result1 = 0;
          result2 = iteration_counter;
          return
        endif
    end
    result1 = new_x;
    result2 = iteration_counter;
end
