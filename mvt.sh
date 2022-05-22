echo -n "Enter the total memory available (in Bytes) - "
read ms

ch='y'
temp=$ms
n=0

for ((i=0; ch=='y'; i++, n++))
do

    echo -n -e "\nEnter memory required for process $(($i+1)) (in Bytes) - "
    read mp[i]

    if [ ${mp[i]} -le $temp ]
    then
        echo -n "Memory is allocated for Process $(($i+1)) "
        temp=$(($temp - ${mp[i]}))
    else
        echo -n "Memory is Full"
        break
    fi

    echo -n -e "\nDo you want to contunue (y/n) -- "
    read ch

done

echo -e -n "\nTotal Memory Available - $ms "
echo -e -n "\nProcess\t\t\tMemory-Allocated\n"
for ((i=0; i<$n; i++))
do
    echo -e -n "$(($i+1))\t\t\t${mp[i]}\n"
done

echo -n -e "Total Memory Allocated is $(($ms - $temp))\n"
echo "Total External Fragmentation is $temp"

