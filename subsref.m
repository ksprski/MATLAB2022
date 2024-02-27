function b = subsref(a,s)
% SUBSREF
% SUBSREF
switch s.type
case '()'
    ind = s.subs{:};
    for k = 1:length(ind)
        str = ["(", num2str(ind(k)), ")"];
        b(k) = eval(strrep(char(a),'x', join(str)));
    end
otherwise
    error('Specify value for x as p(x)')
end
