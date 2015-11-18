function [rel_err] = relative_error(p, a_p)
rel_err = 0;
if absolute_value(p) ~= 0
    rel_err = absolute_error(p,a_p)/absolute_value(p);
else
    print('error: absolute_value must not be equal to ',absolute_value(p))
end