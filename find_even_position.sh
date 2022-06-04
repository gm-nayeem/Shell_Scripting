echo "Enter 7-digit number:" 
read n
rev=0

while [ $n != 0 ]
do
    mod=$(($n % 10))
    rev=$(($mod + $rev * 10))
    n=$(($n / 10))
done


n2=$rev
x=1

while [ $n2 != 0 ]
do
    mod2=$(($x % 2))
    if [ $mod2 -eq 0 ]
    then
        res=$(($n2%10))
        echo $res
        n2=$(($n2/10))
        ((x++))
    else
        n2=$(($n2/10))
        ((x++))
    fi
done
