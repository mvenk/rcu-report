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
out.write ("\\begin{table}[tph]\n\
\\begin{center}\n\
\\begin{tabular}{|l|l|l|l|}\n")

out.write ("\hline Workload &")
if(vanilla): 
    out.write ("No Locks (s) &")
out.write ("Reader-Writer Lock (s) & RCU (s) \\\\\n")
for i in range(1,size,1):
    wrk = rcu[i].split('_')[0].replace("r"," reader(s)").replace("w"," writer(s)")
    out.write ("\hline ")
    out.write (wrk) # workload
    out.write (" & ")
    if(vanilla):
        val = float(non[i].split(' ')[1].rstrip(','))
        out.write (format(val,".3f"))
        out.write (" & ")
    val = float(rwl[i].split(' ')[1].rstrip(','))
    out.write (format(val,".3f"))
    out.write (" & ")
    val  = float(rcu[i].split(' ')[1].rstrip(','))
    out.write (format(val,".3f"))
    out.write ("\\\\\n")

out.write( "\\hline\n\
\\end{tabular}\n\
\\end{center}\n\
\\label{tbl:writeintensive}\n\
\\caption{Performance comparison over a pure reader workload}\n\
\\end{table}\n")

out.close()
