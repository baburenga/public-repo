import sys
import os
def processcheckrestart(servicename):
   process=servicename
   icmd="ps -ef"
   cmd="ps -ef | grep "+process
   recmd="systemctl restart "+process
   os.system(icmd)
   stcmd="systemctl status "+process
   result=os.system(stcmd)
   os.system(recmd)
   os.system(cmd)
   if(result == 0):
     print (process+" is running")
   else:
     print (process+" is stopped")
input=sys.argv[1]
processcheckrestart(input)
