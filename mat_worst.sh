echo -n "Enter the number of blocks: "
read nob
echo -n "Enter the number of files: "
read nof


echo "Enter the size of blocks - "
for ((i=0; i<$nob; i++))
do
    bs[i]=$(($i+1))
    echo -n "Block $((p[i])): "
    read b[$i]
done

echo "Enter the size of files - "
for ((i=0; i<$nof; i++))
do
    fs[i]=$(($i+1))
    echo -n "File $(($i+1)): "
    read f[$i]
done


# decreasing block
for ((i=0; i<$nob; i++))
do
    for ((j=$(($i+1)); j<$nob; j++))
    do
        if [ $((b[j])) -gt $((b[i])) ]
        then
            temp=$((b[i]))
            b[$i]=$((b[j]))
            b[$j]=$temp

            temp=$((bs[i]))
            bs[$i]=$((bs[j]))
            bs[$j]=$temp
        fi
    done
done

# increasing file
for ((i=0; i<$nof; i++))
do
    for ((j=$(($i+1)); j<$nof; j++))
    do
        if [ $((f[i])) -gt $((f[j])) ]
        then
            temp=$((f[i]))
            f[$i]=$((f[j]))
            f[$j]=$temp

            temp=$((fs[i]))
            fs[$i]=$((fs[j]))
            fs[$j]=$temp
        fi
    done
done

echo -e "File_no\t\tFile_size\tBlock_no\tBlock_Size\tFragment"

for ((i=0; i<$nof; i++))
do
    echo -e -n "$(($((fs[$i]))))\t\t$((f[i]))\t\t"
    if [ $((f[i])) -le $((b[i])) ]
    then
        fr=$(( $((b[i])) - $((f[i])) ))
        echo -e -n "$((bs[i]))\t\t$((b[i]))\t\t$fr"
    else
        echo -e -n "0\t\t0\t\t0"
    fi
    echo " "
done