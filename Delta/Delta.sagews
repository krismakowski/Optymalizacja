import numpy as np



Chicken_fillet_dict={'name':'Chicken_fillet'}
Chicken_fillet=[2,268,20.9,19.2,6.9,3.6]

Pork_cutlet_dict={'name':'Pork_cutlet'}
Pork_cutlet=[3.5,316,14.8,23.8,12,0.7]

Cod_fried_dict={'name':'Cod_fried'}
Cod_fried=[2,232,15,12,17,1]


Salmon_dict={'name':'Salmon'}
Salmon=[5,334,19.4,27.3,3.5,0.1]

Mielony_dict={'name':'Mielony'}
Mielony=[1.5,248,19.5,17.7,5.9,3.1]

Gulasz_dict={'name':'Gulasz'}
Gulasz=[1.5,161,8.4,12,5,0.3]

Potrawkakurczak_dict={'name':'Potrawkakurczak'}
Potrawkakurczak=[1,112,17,3,3,0]

Chicken_leg_dict={'name':'Chicken_leg'}
Chicken_leg=[1,211,24,12,0,0]

Pork_chop_sauce_dict={'name':'Pork_cutlet'}
Pork_cutlet=[1.2,197,25,10,0,0]

Pork_liver_dict={'name':'Pork_liver'}
Pork_liver=[0.8,259,17.6,19.5,4,0.1]

Meat=[Chicken_fillet_dict,Pork_cutlet_dict,Cod_fried_dict,Salmon_dict,Mielony_dict,Gulasz_dict,Potrawkakurczak_dict,Chicken_leg_dict,Pork_chop_sauce_dict,Pork_liver_dict]


for v in Meat:
    v['cost']=eval(v['name'])[0]
    v['calories']=eval(v['name'])[1]
    v['protein']=eval(v['name'])[2]
    v['fat']=eval(v['name'])[3]
    v['carbs']=eval(v['name'])[4]
    v['blonnik']=eval(v['name'])[5]

Coleslaw_dict={'name':'Coleslaw'}
Coleslaw=[1,98,0.8,10,5.9,1]

Surowka_z_porem_dict={'name':'Surowka_z_porem'}
Surowka_z_porem=[0.4,78,1.5,3.9,11.2,3]

Salad_with_veg_dict={'name':'Salad_with_veg'}
Salad_with_veg=[0.3,42,1,2.8,4.6,1.4]

Carrot_apple_salad_dict={'name':'Carrot_apple_salad'}
Carrot_apple_salad=[0.25,40,0.6,0.2,9,3]

Mloda_marchew_dict={'name':'Mloda_marchew'}
Mloda_marchew=[0.3,35,0.6,0.1,8,2.9]

Spinach_dict={'name':'Spinach'}
Spinach=[1,16,2.6,0.4,3,2.6]

Buraczki_dict={'name':'Buraczki'}
Buraczki=[0.3,119,1.3,6.9,13,1.7]

Kapusta_kisz_dict={'name':'Kapusta_kisz'}
Kapusta_kisz=[0.25,102,1.3,8,6.3,2.3]

Greek_dict={'name':'Greek'}
Greek=[2,105,3,9.5,3.2,1.1]

Red_cabbage_dict={'name':'Red_cabbage'}
Red_cabbage=[0.3,105,1.7,4.5,13,2]



Veg=[Coleslaw_dict,Salad_with_veg_dict,Carrot_apple_salad_dict,Kapusta_kisz_dict,Red_cabbage_dict]

for v in Veg:
    v['cost']=eval(v['name'])[0]
    v['calories']=eval(v['name'])[1]
    v['protein']=eval(v['name'])[2]
    v['fat']=eval(v['name'])[3]
    v['carbs']=eval(v['name'])[4]
    v['blonnik']=eval(v['name'])[5]

Brown_rice_dict={'name':'Brown_rice'}
Brown_rice=[0.23,129,2.8,0.8,30.7,3.5]

Mashedpot_dict={'name':'Mashedpot'}
Mashedpot=[0.3,92,2,2.3,16.9,1.4]

Buckwheat_dict={'name':'Buckwheat'}
Buckwheat=[0.2,102,3.8,0.9,21,1.8]

Peczak_dict={'name':'Peczak'}
Peczak=[0.13,128,3.2,0.8,28.8,1]

Whiterice_dict={'name':'Whiterice'}
Whiterice=[0.18,130,3,0,28,0]

Potatoes_dict={'name':'Potatoes'}
Potatoes=[0.25,77,1.9,0.1,18.3,1.5]

Fries_dict={'name':'Fries'}
Fries=[0.4,300,3.4,15,37,3.6]

Egg_noodles_dict={'name':'Egg_noodles'}
Egg_noodles=[0.4,140,4.6,1.2,27.1,0.9]

Makaron_gryczany_dict={'name':'Makaron_gryczany'}
Makaron_gryczany=[0.7,140,5.8,1.2,26.4,1.2]

Makaron_ryzowy_dict={'name':'Makaron_ryzowy'}
Makaron_ryzowy=[0.56,97,1.8,0.8,22.1,0]

Carbohydrates=[Brown_rice_dict,Mashedpot_dict,Buckwheat_dict,Peczak_dict,Whiterice_dict,Potatoes_dict]

for v in Carbohydrates:
    v['cost']=eval(v['name'])[0]
    v['calories']=eval(v['name'])[1]
    v['protein']=eval(v['name'])[2]
    v['fat']=eval(v['name'])[3]
    v['carbs']=eval(v['name'])[4]
    v['blonnik']=eval(v['name'])[5]

%typeset_mode True

Min_Price=float('inf')
Min_Price_combo=''

zywnosc=(2000,50,65,300,25)
posilek= (800,20,26,120,10)

result_table=[]
b=(800*1.2,800*0.8,200,20,26*1.2,26*0.8,120*1.2,120*0.8,100,10*0.8,4,1,2.5,1,4,1)

for v0 in Meat:
    for v1 in Veg:
        for v2 in Carbohydrates:
            tempname= v0['name']+'+'+v1['name']+'+'+v2['name']
            c=np.zeros(3)
            A=np.zeros((16,3))
            for i in range (0,3):
                c[i]=eval('v'+str(i))['cost']
                A[0,i]=eval('v'+str(i))['calories']
                A[1,i]=A[0,i]
                A[2,i]=eval('v'+str(i))['protein']
                A[3,i]=A[2,i]
                A[4,i]=eval('v'+str(i))['fat']
                A[5,i]=A[4,i]
                A[6,i]=eval('v'+str(i))['carbs']
                A[7,i]=A[6,i]
                A[8,i]=eval('v'+str(i))['blonnik']
                A[9,i]=A[8,i]
            A[10]=[1,0,0]
            A[11]=[1,0,0]
            A[12]=[0,1,0]
            A[13]=[0,1,0]
            A[14]=[0,0,1]
            A[15]=[0,0,1]
            P = InteractiveLPProblem(A, b, c,problem_type="min",variable_type=">=",constraint_type=["<=",">=","<=",">=","<=",">=","<=",">=","<=",">=","<=",">=","<=",">=","<=",">="])
            t=P.optimal_value()
            y=P.optimal_solution()
            if y!=None and t!=None:
                result_table.append([tempname,y,t])
                if t<Min_Price:
                    Min_Price=t
                    Min_Price_combo=tempname


print "The optimal meal is: %s with a total cost of %s" %(Min_Price_combo,Min_Price)

result_table = sorted(result_table, key=lambda a_entry: a_entry[2])


print "dlugosc tabelki: %d\n" %len(result_table)
for i in range (0,len(result_table)):
    print result_table[i]