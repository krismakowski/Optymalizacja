import numpy as np
def queens(n):
    lp = MixedIntegerLinearProgram(maximization=True)
    x = lp.new_variable(integer=True, nonnegative=True)
    obj=0
    constraint1=0
    constraint2=0
    constraint3=0

    for k in range(0,n):
        for l in range(0,n):
            obj+=x[k*n+l]

    for k in range(0,n):
        for l in range(0,n):
            constraint1+=x[k*n+l]
            constraint2+=x[n*l+k]
        lp.add_constraint(constraint1, max=1)
        lp.add_constraint(constraint2, max=1)
        constraint1=0
        constraint2=0



    for k in range(0,n-1):
        for l in range(0,n-k):
            constraint1+=x[l*(n+1)+k]
            constraint3+=x[(k+l+1)*n-l-1]
            if k>0:
                constraint2+=x[(l+k)*(n+1)-k]
        lp.add_constraint(constraint1, max=1)
        if k>0:
            lp.add_constraint(constraint2, max=1)
        lp.add_constraint(constraint3, max=1)
        constraint1=0
        constraint2=0
        constraint3=0


    for k in range(n-2,0,-1):
        for l in range(0,k+1):
            constraint1+=x[k+(n-1)*l]
        lp.add_constraint(constraint1, max=1)
        constraint1=0
    lp.set_objective(obj)
    res=int(lp.solve())
    val = lp.get_values(x)
    values=val.values()
    mat=np.array(values).reshape(n,n).astype(int)
    return res,mat

x,y=queens(8)
np.set_printoptions(threshold=np.nan)
print "Total number of queens=%d\n"%x
print y
