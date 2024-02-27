function r = mtimes(p,q)
% POLYNOM/MTIMES Implement p * q for polynoms.
p = polynom(p);
q = polynom(q);
if isempty(p.c) || isempty(q.c)
    r = polynom();
else
    r = polynom(conv(p.c,q.c));
end
