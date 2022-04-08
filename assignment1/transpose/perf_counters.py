
with open("perf_results.txt") as f:
    lines = f.readlines()

counters = ["instructions",
            "cycles",
            "L1-dcache-load-misses",
            "L1-dcache-loads",
            #"LLC-load-misses",
            #"LLC-loads",
            #"dTLB-load-misses",
            #"cache-references",
            #"branch-misses",
            #"branch-instructions"
            ]

counter_vals = {}

for line in lines:
    line = line.split()
    for counter in counters:
        if counter in line:
            cval = ''
            for s in line:
                if s != counter:
                    cval += s
                else:
                    counter_vals[counter]=float(cval.replace(",","."))
                    break
            break



print( "{:.3f}".format(counter_vals["instructions"]/counter_vals["cycles"]) )
print( "{:.3f}".format(counter_vals["L1-dcache-load-misses"]/counter_vals["L1-dcache-loads"]) )
print( "{:.3f}".format(1000*counter_vals["L1-dcache-load-misses"]/counter_vals["instructions"]) )
# print( counter_vals["LLC-load-misses"]/counter_vals["LLLC-loads"] )
# print( 1000*counter_vals["LLC-load-misses"]/counter_vals["instructions"] )
# print( counter_vals["dTLB-load-misses"]/counter_vals["cache-references"] )
# print( 1000*counter_vals["dTLB-load-misses"]/counter_vals["instructions"] )
# print( counter_vals["branch-misses"]/counter_vals["branch-instructions"] )
# print( 1000*counter_vals["branch-misses"]/counter_vals["instructions"] )

