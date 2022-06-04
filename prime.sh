array=(2 7 9 11 19 26 29 35)
len=${#array[@]}
sum=0

echo "Prime Numbers: "
for ((i=0; i<len; i++))
do
    n=${array[i]}
    count=0
    for ((j=2; j<$n/2; j++))
    do
        mod=$(($n % $j))
        if [ $mod -eq 0 ]
        then
            count=1
            break
        fi
    done
    if [ $count -eq 0 ]
    then 
        echo $n
        sum=$(($sum+$n))
    fi

done
echo  "The sum of prime number is = $sum"
