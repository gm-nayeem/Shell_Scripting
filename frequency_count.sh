read -p "Enter the number: " number

len=${#number}
i=0

while (( $i < $len ))
do
    digit=${number:$i:1}
    tempNum=$number
    count=0

    while (( $tempNum > 0 ))
    do
        rem=$tempNum%10
        if (( $digit == $rem ))
        then
            let count++
        fi

        tempNum=$(($tempNum/10))
    done

    echo "$digit = $count times"
    number=${number[@]//$digit/}
    len=${#number}

done
