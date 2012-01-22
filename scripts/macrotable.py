import sys

vanilla = False;
if len(sys.argv)==5:
    vanilla=True;
rcufile=open(sys.argv[1],"r")
rwlfile=open(sys.argv[2],"r")
if(vanilla):
    nonfile=open(sys.argv[3],"r")
    outfile=sys.argv[4]
else:
    outfile=sys.argv[3]
rcu = rcufile.readlines()
rwl = rwlfile.readlines()
if(vanilla):
    non = nonfile.readlines()

size = len(rcu)
out = open(outfile,'w')
if(vanilla):
    out.write ("\\begin{tabular}{|l|p{1.5cm}|p{1.5cm}|p{1cm}|l|l|}\n")
else:
    out.write ("\\begin{tabular}{|l|l|l|l|l|}\n")
    
out.write ("\hline Workload &")
if(vanilla): 
    out.write ("No Locks (s) &")
out.write ("Reader-Writer Lock (s) & RCU (s) & ")
if(vanilla):
    out.write("$\\frac{\mbox{Reader-Writer Lock}}{\mbox{No Locks}}$ & $\\frac{\mbox{RCU}}{\mbox{No Locks}}$ \\\\\n")
else:
    out.write("$\\frac{\mbox{Reader-Writer Lock}}{\mbox{RCU}} $ \\\\\n")
    
for i in range(1,size,1):
    if(int(rcu[i].split('_')[1].split('r')[0])==1):
        str1=rcu[i].split('_')[1].replace("r"," reader")
    else:
        str1=rcu[i].split('_')[1].replace("r"," readers")
    if(int(rcu[i].split('_')[2].split(' ')[0].split('w')[0])==1):
        str2=rcu[i].split('_')[2].split(' ')[0].replace("w"," writer")
    else:
        str2=rcu[i].split('_')[2].split(' ')[0].replace("w"," writers")
    wrk = str1 + " " + str2 
    out.write ("\hline ")
    out.write (wrk) # workload
    out.write (" & ")
    if(vanilla):
        val = float(non[i].split(' ')[1].rstrip(','))
        out.write (format(val,".3f"))
        out.write (" & ")
    rwlval = float(rwl[i].split(' ')[1].rstrip(','))
    out.write (format(rwlval,".3f"))
    out.write (" & ")
    rcuval  = float(rcu[i].split(' ')[1].rstrip(','))
    out.write (format(rcuval,".3f"))
    if(vanilla):
        rcuo = (rcuval)/val
        rwlo = (rwlval)/val
        out.write("&" + format(rwlo,".3f") + "&" + format(rcuo,".3f"))
    else:
        better = (rwlval/rcuval)
        out.write("&" +format(better,".3f"))
    out.write ("\\\\\n")

out.write( "\\hline\n\
\\end{tabular}\n\
")

out.close()
