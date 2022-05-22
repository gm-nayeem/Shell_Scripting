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



echo -e "File_no\t\tFile_size\tBlock_no\tBlock_Size\tFragment"

x=0
for ((i=0; i<$nob; i++))
do
    # echo -e -n "$(($((fs[$x]))))\t\t$((f[$x]))\t\t"
    if [ $((f[$x])) -le $((b[$i])) ]
    then
        echo -e -n "$(($((fs[$x]))))\t\t$((f[$x]))\t\t"
        fr=$(( $((b[$i])) - $((f[$x])) ))
        echo -e -n "$((bs[$i]))\t\t$((b[$i]))\t\t$fr"
        x=$(($x+1))       
    fi
    echo " "
done