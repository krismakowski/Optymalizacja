import numpy as np
import itertools as it
import math


def nCr(n,r):
    f = math.factorial
    return f(n) / f(r) / f(n-r)

def solvelinear():
    m=np.array(input('Podaj liczbe równan'))
    if m<=0:
        print "Liczba równan musi byc wieksza od zera\n"
        return()
    elif m.dtype!='int64':
        print "Liczba równan musi byc liczba calkowita dodatnia\n"
        return()
    b=np.zeros(m).reshape((m,1))
    C=input('Podaj macierz funkcji "max"')
    C=np.array(C)
    if C.dtype!='int64':
        print "Funkcja 'max' musi byc wektorem skladajacym sie z liczb calkowitych"
        return()
    if type(C.shape)!=tuple or C.ndim!=1:
        print "Funkcja 'max' musi byc wektorem poziomym"
        return()
    for k in range(0,m):
        if k==0:
            x=input('Podaj pierwszy rzad macierzy:')
            x=np.array(x)
            if x.dtype!='int64':
                print "Kazdy rzad macierzy musi byc wektorem skladajacym sie z liczb calkowitych"
            if type(x.shape)!=tuple or x.ndim!=1:
                print "Nieprawidlowy wymiar wprowadzonego wektora"
                return()
            if x.size!=C.size:
                print "Liczba zmiennych w kazdym wierszu musi byc równa liczbie zmiennych w funkcji 'max'"
                return()
            n=x.size
            A=np.zeros((m,n))
            A[k]=x
        if k>0:
            x=input('Podaj kolejny rzad macierzy:')
            x=np.array(x)
            if x.dtype!='int64':
                print "Kazdy rzad macierzy musi byc wektorem skladajacym sie z liczb calkowitych"
            if type(x.shape)!=tuple or x.ndim!=1:
                print "Nieprawidlowy wymiar wprowadzonego wektora"
                return()
            if x.size!=C.size:
                print "Liczba zmiennych w kazdym wierszu musi byc równa liczbie zmiennych w funkcji 'max'"
                return()
            n=x.size
            A[k]=x
        y=np.array(input('Podaj wyraz wolny:'))
        if y.dtype!='int64' or y.size>1 or y.ndim>1:
            print "Wyraz wolny musi byc liczba calkowita\n"
            return()
        cond=raw_input('Podaj warunek, wpisz min/max')
        if cond=='min' or cond=="'min'":
            y=-y
            A[k]=-A[k]
        elif cond!='min' and cond!="'min'" and cond!='max' and cond!="'max'":
            print "Prosze wpisac 'min' lub 'max'"
            return()
        b[k]=y
    print "Wprowadzona macierz zmiennych:\n%s\n" %A
    print "Wprowadzony wektor wyrazów wolnych\n%s\n" %b

    var_no=n
    eq_no=m
    std_var_no=2*var_no+eq_no
    c=np.zeros((eq_no,std_var_no))
    std_C=np.zeros(std_var_no)
    for k in range(0,var_no):
        c[:,2*k]=A[:,k]
        c[:,2*k+1]=-A[:,k]
        std_C[2*k]=C[k]
        std_C[2*k+1]=-C[k]
    for k in range(0,eq_no):
        c[k,2*var_no+k]=1
    X=np.zeros(std_var_no)
    minor_no=nCr(std_var_no,eq_no)
    k=np.arange(std_var_no)
    index_list = np.array(list(it.combinations(k, eq_no)))

    result=0
    resultant_vector=np.zeros(var_no)
    std_resultant_vector=X
    for k in range(0,minor_no):
        mat=c[:,index_list[[k],:]].reshape(eq_no,-1)
        if(np.linalg.det(mat)!=0):
            x=np.linalg.solve(mat,b)
        # print "Vector x:\n%s\n" %x
        #print "Current set B:\n%s\n" %index_list[k]
            X=np.zeros(std_var_no)
            for l in range(0,eq_no):
                X[index_list[k,l]]=x[l]
            # print X
            temp=0
            if (X>=0).all()==True:
                for u in range(0,std_var_no):
                    temp+=std_C[u]*X[u]
                # print "temp=%d" %temp
                if result<temp:
                    result=temp
                    std_resultant_vector=X
                # print "result=%d" %result
        # print mat
    for k in range(0,var_no):
        resultant_vector[k]=std_resultant_vector[2*k]
    return(result,resultant_vector)
t,x=solvelinear()
print "result=%d" %t
print "resultant vector=%s" %x