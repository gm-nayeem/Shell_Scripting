
echo -n "Enter the number of pages: "
read nop
echo "Enter the pages: "
for ((i = 0; i < $nop; i++))
do
    read pages[i]
done

echo -n "Enter the number of frames: " 
read nof
for ((i = 0; i < $nof; i++))
do
    frames[i]=-1
done

echo -e "The page replacement proccess is -->\n"
framesIndex=0
pageFaultCount=0

for ((i = 0; i < nop; i++))
do
    for ((j = 0; j < nof; j++))
    do
        if [ "${pages[i]}" == "${frames[j]}" ]
        then
            break
        fi
    done

    if [ $j == "$nof" ]
    then
        frames[$framesIndex]=${pages[i]}
        framesIndex=$(($framesIndex + 1))
        pageFaultCount=$(($pageFaultCount + 1))
    fi

    #print frames condition
    for ((k = 0; k < nof; k++))
    do
        echo -e -n "${frames[k]}\t"
    done

    if [ $j == "$nof" ]
    then
        echo -n "Page Fault No: $pageFaultCount"
    fi

    if [ $framesIndex == "$nof" ]
    then
        framesIndex=0
    fi
    echo " "
done

echo "The number of page fault using fifo is $pageFaultCount"
