function q = int(p,c)
% POLYNOM/INT INT(p,c) calculates the indefinite integral of the polynom p with the coefficient c.
% INT(p) calculates the indefinite integral of the polynom p with the coefficient c == 0.
if nargin == 1
    c = 0;
end
cf = p.c;
d = length(cf);  % degree
q = polynom([p.c./(d:-1:1), c]);