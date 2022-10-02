function find_n_iterations()
  format long;
  a_0 = input('What is a_0: ');
  b_0 = input('What is b_0: ');
  eps = input('What is eps: ');
  no_iterations = ceil((log(b_0 - a_0) - log(eps))/(log(2)));
  fprintf("\nIterations needed: %i\n\n", no_iterations);
 end
