flip=$(($RANDOM%2))
if [ $flip -eq 1 ]
then
	echo "Heads"
else
	echo "Tails"
fi

counter=0
index=0
total_heads=0
total_tails=0

#Dictionary for Singlet Combination
declare -A singlet
singlet[head]=" "
singlet[tails]=" "
singlet[headCount]=0
singlet[tailsCount]=0

read -p "Enter how many times you want flip the coin: " trail;

while [ $counter -lt $trail ]
do
	flip=$(($RANDOM%2))
	if [ $flip -eq 1 ]
	then
		singlet[head]="H"
		((total_heads++))
	else
		singlet[tails]="T"
		((total_tails++))
	fi
        ((counter++))
done
echo "Combination of Singlet,Doublet,Triplet"
echo "--------------------------------------"
echo "Singlet Combination" ${singlet[head]} ${singlet[tails]}
singlet[headCount]=$(echo $total_heads $trail | awk '{print $1/$2}')
echo "Percentage of head = "${singlet[headCount]}

singlet[tailsCount]=$(echo $total_tails $trail | awk '{print $1/$2}')
echo "Percentage of tails =" ${singlet[tailsCount]}
