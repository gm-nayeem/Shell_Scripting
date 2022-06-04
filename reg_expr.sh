echo -n "Enter any value: "
read value
if [[ $value =~ ^[0-9]+$ ]]; then
echo “The value is Numeric”
else
echo “The value is Non-Numeric”
fi