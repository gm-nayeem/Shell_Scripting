echo -n "Enter first number: "
read n1
echo -n "Enter second number: "
read n2

sum=0
factorial () {
    fac=1
    for ((i=$1; i>=1; i--))
    do
        fac=$(($fac*$i))
    done
    sum=$(($sum + $fac))
}

factorial $n1
echo "Factorial of $n1 is $fac"
fac1=$fac

factorial $n2
echo "Factorial of $n2 is $fac"
fac2=$fac

echo "$fac1 + $fac2 = $sum"
