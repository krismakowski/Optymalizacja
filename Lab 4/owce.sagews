import numpy as np

# B=np.zeros(6)
# C=np.zeros(4)
B = [ (1, 1), (1, 2), (2, 2), (2, 1) ]
C = [ (0.2, 0.4), (1, 0.5), (3, 0.7), (2, 0.1) ]



lp = MixedIntegerLinearProgram()
var = lp.new_variable(nonnegative=True)

a, b, d = var['a'], var['b'], var['d']
lp.set_objective(d)
for p in B:
    lp.add_constraint(p[1]-a*p[0]-b-d, min=0)
for p in C:
    lp.add_constraint(p[1]-a*p[0]-b+d, max=0)

d=lp.solve()
a=lp.get_values(a)
b=lp.get_values(b)


list_plot(B, color='green') + list_plot(C, color='red')+plot(a*x+b,-1,3)
