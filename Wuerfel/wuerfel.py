#!/usr/bin/python
from random import randint
        #Alternativ auch import random
        #dann allerdings: random.randint(z1,z2)

def wuerfel():
        wurf = randint(1, 6)
        return wurf

print wuerfel()
