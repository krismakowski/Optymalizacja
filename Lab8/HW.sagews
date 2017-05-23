import numpy as np
import itertools as it

Input=np.array([[0,0,6],[0,1,5],[0,2,4],[0,3,3],[1,1,4],[1,2,3],[2,2,2]])
Input



#Rozpisane wszystkie przypadki + permutacje
np.set_printoptions(threshold='nan')
Index=np.zeros((42,3))
for n in range(0,7):
    index_list = np.array(list(it.permutations(Input[n])))
    for m in range(0,6):
        Index[6*n+m]=index_list[m]
Index



import fractions
np.set_printoptions(formatter={'all':lambda x: str(fractions.Fraction(x).limit_denominator())})
M=np.zeros((8,8))
for n in range(0,7):
    for m in range(0,7):
        y=0
        for l in range(6*n,6*(n+1)):
            for o in range(6*m,6*(m+1)):
                z=0
                for k in range(0,3):
                    if(Index[l,k]>Index[o,k]):
                        z+=1
                    elif(Index[l,k]<Index[o,k]):
                        z-=1
                y+=z/36
        M[n,m]=y


Mat=M.T
for n in range(0,7):
    Mat[n,7]=-1
    Mat[7,n]=1


def zmienna(a):
    zmienna="x"
    zmienna+=str(a)
    return zmienna

zmienna(1)
t=""
t=zmienna(1)+"+"+zmienna(2)
t



print "Maximize \nobj: x7\n\nSubject to\n"

for n in range(0,7):
    t=""
    for m in range(0,7):
        if t=="":
            if M[n,m]>0:
                t+=str(M[n,m])
                t+=zmienna(m)
            elif M[n,m]<0:
                t+=str(M[n,m])
                t+=zmienna(m)
        else:
            if M[n,m]>0:
                t+="+"
                t+=str(M[n,m])
                t+=zmienna(m)
            elif M[n,m]<0:
                t+=str(M[n,m])
                t+=zmienna(m)

    t+="-"+zmienna(7)+">"+"="+str(0)
    print t
t=""
for n in range(0,7):
    if t!="":
        t+="+"
    t+=zmienna(n)
t+="="+str(1)
print t
print "\nBounds\n\n"


for n in range(0,7):
    t=""
    t+=str(0)+"<"+"="+zmienna(n)
    print t


print "\nEnd \n\n"




%typeset_mode True
A = ([0, 1/3, 1/3, 1/3, 1, 1, 1, -1],
       [-1/3, 0, 0, 0, 1/3, 2/3, 1, -1],
       [-1/3, 0, 0, 0, 0, 0, 0, -1],
       [-1/3, 0, 0, 0, 1/3, -1/3, -1, -1],
       [-1, -1/3, 0, -1/3, 0, 1/3, 1, -1],
       [-1, -2/3, 0, 1/3, -1/3, 0, 0, -1],
       [-1, -1, 0, 1, -1, 0, 0, -1],
       [1, 1, 1, 1, 1, 1, 1, 0])
b = (0,0,0,0,0,0,0,1)
c = (0,0,0,0,0,0,0,1)
P = InteractiveLPProblem(A, b, c, ["x0","x1","x2","x3", "x4","x5","x6","x7"],constraint_type = [">=",">=",">=",">=",">=",">=",">=","=="],variable_type = [">=", ">=", ">=",">=", ">=",">=",">=", ""])

view(P)
a=P.optimal_solution()
print a