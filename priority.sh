echo -n "Enter the number of process: "
read n

for ((i=0; i<$n; i++))
do
    p[$i]=$(($i+1))
    echo -n  "Enter the Burst Time for P$(($i+1)): "
    read bt[$i]
    echo -n  "Enter the Priority for P$(($i+1)): "
    read pr[$i]
done

#sort priority, burst time, process
for ((i=0; i<$n; i++))
do
    for ((j=$(($i+1)); j<$n; j++))
    do
        if [ ${pr[$i]} -gt ${pr[$j]} ]
        then
            temp=${pr[$i]}
            pr[i]=${pr[$j]}
            pr[$j]=$temp

            temp=${bt[$i]}
            bt[$i]=${bt[$j]}
            bt[$j]=$temp

            temp=${p[$i]}
            p[i]=${p[$j]}
            p[$j]=$temp
        fi
    done
done

# when priority are same 
for ((i=0; i<$n; i++))
do
    for ((j=$(($i+1)); j<$n; j++))
    do
        if [ ${pr[$i]} -eq ${pr[$j]} ]
        then
            if [ ${bt[$i]} -gt ${bt[$j]} ]
            then
                temp=${bt[$i]}
                bt[$i]=${bt[$j]}
                bt[$j]=$temp

                temp=${pr[$i]}
                pr[$i]=${pr[$j]}
                pr[$j]=$temp

                temp=${p[$i]}
                p[$i]=${p[$j]}
                p[$j]=$temp

            fi
        fi
    done
done


wt[0]=0
tat[0]=${bt[0]}

for ((j=1; j<$n; j++))
do
    wt[$j]=${tat[$j-1]}
    tat[$j]=$((${bt[$j]}+${wt[$j]}))
done

echo -e "Process\t\tBurst Time\tPriority\tWaiting Time\tTurnaround Time"

for ((x=0; x<$n; x++))
do
    echo -e "P${p[$x]}\t\t${bt[$x]}\t\t${pr[$x]}\t\t${wt[$x]}\t\t${tat[$x]}"
done