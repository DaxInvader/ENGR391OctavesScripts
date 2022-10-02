function find_multi_of_root()
    format long;
    pkg load symbolic;
    syms x;
    f = input('Enter the equation: ');
    r = input('Enter the root: ');
    if f(r) != 0
      fprintf('the root r = %d is not a root fo the function f.\n', r);
      return
    endif
    flag_root = false;
    result = 1;
    h = diff(f, x);
    while !flag_root
      x = r;
      if eval(h) != 0;
        flag_root = true;
      else
        result = result + 1;
        syms x;
        h = diff(h, x);
      endif
    endwhile
  fprintf('the root r = %d has a multiplicity of: %i\n', r, result);
end
