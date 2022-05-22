echo -n "Enter the number of processes: "
read n

for (( i=0; i<$n; i++ ))
do
  echo -n "Enter the Burst Time for Process P$i: "
  read bt[i]
done

wt[0]=0
tat[0]=$((bt[0]))

for ((i=1; i<$n; i++))
do
  wt[i]=$((tat[i-1]))
  tat[i]=$((bt[i]+ wt[i]))
done

echo -e "Process\tBurstTime\tWaittingTime\tTurnaroundTime"

for ((i=0; i<$n; i++))
do
  echo -e "P$i\t\t${bt[i]}\t\t\t${wt[i]}\t\t\t\t${tat[i]} "
done