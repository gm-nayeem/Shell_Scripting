echo -n "Enter the size of Pyramid: "
read size

i=$size

while [ $i -ge 1 ]
do
    j=1
    while [ $j -le $i ]
    do
        echo -n "$j"
        ((j++)) 
    done
    echo " "
    i=$(($i-1))
    
done
