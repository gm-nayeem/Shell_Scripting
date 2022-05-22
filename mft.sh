echo -n "Enter the total memory available (in Bytes) -- "
read ms

echo -n "Enter the block size (in Bytes) -- "
read bs

nob=$(($ms/$bs))
ef=$(($ms-$(($nob*$bs))))

echo -n "Enter the number of processes -- "
read n

for ((i=0; i<$n; i++))
do
    echo -n "Enter memory required for process $(($i+1)) (in Bytes) -- "
    read mp[i]
done

echo -e "\nNo. of Blocks available in memory -- $nob\n"
echo -e "Process\t\tMemory Required\t\tAllocated\tInternal Fragmentation"

p=0
tif=0

for ((i=0; i<$n && $p<$nob; i++))
do
    echo -e -n "$(($i+1))\t\t${mp[i]}"

    if [ ${mp[i]} -gt $bs ]
    then
        echo -e -n "\t\t\tNO\t\t"
    else
        echo -n -e "\t\t\tYES\t\t$(($bs-${mp[i]}))"  
        tif=$(($tif+$(($bs-${mp[i]}))))
        p=$(($p+1))
    fi
    echo ""
done

if [ $i -lt $n ]
then
    echo -e "\nMemory is Full, Remaining Processes cannot be accomodated\n"
fi

echo  "Total Internal Fragmentation is $tif"
echo -e "Total External Fragmentation is $ef\n"
