echo -e -n "\nEnter the number of Blocks- "
read nob
for ((i=0; i<$nob; i++))
do
    echo -n "Block $(($i+1)) size: "
    read b[i]
done

echo -e -n "\nEnter the number of processes- "
read nop
for ((i=0; i<$nop; i++))
do
    echo -n "Enter memory required fo process $(($i+1)) - : "
    read p[i]
done

echo -e "\nProcesses\tProcesses size\tBlock\tBlock size\tAllocated\tInt.Frag."

x=0
for ((i=0; i<$nop && $x<$nob; i++))
do
   
    echo -e -n "$(($i+1))\t\t$((p[i]))\t\t$(($x+1))\t$((b[$x]))\t\t"
    if [ $((p[i])) -le $((b[x])) ]
    then
        fr=$(( $((b[x]))-$((p[i])) ))
        echo -e -n "Yes\t\t$fr"
        x=$(($x+1))
    else
        echo -e -n "No\t\t-"
    fi
    echo " "
done