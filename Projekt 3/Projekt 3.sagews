import numpy as np

with open("7.txt") as f:
    content = f.readlines()
content = [x.strip() for x in content]

emp_no=int(content[0])
emp_no



M=np.zeros((emp_no,5))

for n in range(1,emp_no+1):
    t=(content[n].split())
    M[n-1,0]=n-1
    for m in range (1,5):
        M[n-1,m]=int(t[m-1])

M=M.astype(int)



D1=dict()
D2=dict()
for n in range(0,emp_no):
    D1[n]=[]
    D2[n]=[]

for n in range(0,emp_no):
    D1[M[n,1]].append(M[n,0])
    D2[M[n,2]].append(M[n,0])



tab1=[]
tab2=[]
def dzieci1(n):
    tab1.append(n)
    for i in D1[n]:
        if i!=n:
            dzieci1(i)
    return tab1

def dzieci2(n):

    tab2.append(n)
    for i in D2[n]:
        if i!=n:
            dzieci2(i)
    return tab2



lp = MixedIntegerLinearProgram(maximization=False,solver="GLPK")
x = lp.new_variable(binary=True, nonnegative=True)
for n in range (0,emp_no):
    if M[n,3]>0:
        tab1=[]
        lp.add_constraint(lp.sum(x[i] for i in dzieci1(M[n,0])), min=M[n,3])

    if M[n,4]>0:
        tab2=[]
        lp.add_constraint(lp.sum(x[i] for i in dzieci2(M[n,0])), min=M[n,4])

lp.set_objective(lp.sum(x[i] for i in range (0,emp_no)))



no_fired=emp_no-lp.solve()
no_fired



sage_server.MAX_STDOUT_SIZE="150000"
val = lp.get_values(x)
to_be_fired=[]

for i in val:
    if val[i]==0:
        to_be_fired.append(i)


print "The number of employees to be fired is: %d.\nThe list of the EIDs of the dismissed employees is as follows: \n\n%s" %(no_fired,to_be_fired)