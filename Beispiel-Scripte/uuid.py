'''
Created on Dec 13, 2010

@author: marco
'''
import time

class UUID(object):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
        
    def generateUUID(self):
        lt = time.time()
        ms = str((lt - int(lt)))
        ms = ms[2:12]
        
        uuid = "%s.%s" % (int(lt),ms)

        return uuid
        
if __name__ == "__main__":
    uuidGenerator = UUID()
    newUUID = uuidGenerator.generateUUID()
    print newUUID        