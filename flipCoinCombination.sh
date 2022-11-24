counter=0
index=0
total_heads=0
total_tails=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0

#Dictionary for Singlet Combination
declare -A singlet
singlet[head]=" "
singlet[tails]=" "
singlet[h_per]=0
singlet[t_per]=0

#Dictionary for Doublet Combination
declare -A double
double[first_combination]=" "
double[second_combination]=" "
double[third_combination]=" "
double[fourth_combination]=" "
double[first_per]=0
double[second_per]=0
double[third_per]=0
double[fourth_per]=0


read -p "Enter how many times you want flip1 the coin  " trail
while [ $counter -lt $trail ]
do
	flip1=$(($RANDOM%2))
	flip2=$(($RANDOM%2))
	if [ $flip1 -eq 1 ]
	then
		singlet[head]="H"
		((total_heads++))
		if [ $flip2 -eq 1 ]
		then
			((total_first_comb++))
			double[first_combination]="HH"
		else
			((total_second_comb++))
			double[second_combination]="HT"
		fi
	else
		singlet[tails]="T"
		((total_tails++))
		 if [ $flip2 -eq 1 ]
		then
			  ((total_third_comb++))
			   double[third_combination]="TH"
		else
			((total_fourth_comb++))
			double[fourth_combination]="TT"
		fi
	fi
        ((counter++))
done

echo "Combination of Singlet,Doublet,Triplet"
echo "Singlet Combination for the first flip" ${singlet[head]} ${singlet[tails]}
singlet[headCount]=$(echo $total_heads $trail | awk '{print $1/$2}')
echo "Percentage of head ="${singlet[headCount]}

singlet[tailsCount]=$(echo $total_tails $trail | awk '{print $1/$2}')
echo "Percentage of tails =" ${singlet[tailsCount]}

echo "Doublet Combination" ${double[first_combination]} ${double[second_combination]} ${double[third_combination]} ${double[fourth_combination]}
double[HH]=$(echo $total_first_comb $trail | awk '{print $1/$2}')
echo "Percentage of HH Combination ="${double[HH]}

double[HT]=$(echo $total_second_comb $trail | awk '{print $1/$2}')
echo "Percentage of HT Combination ="${double[HT]}

double[TH]=$(echo $total_third_comb $trail | awk '{print $1/$2}')
echo "Percentage of TH Combination ="${double[TH]}

double[TT]=$(echo $total_fourth_comb $trail | awk '{print $1/$2}')
echo "Percentage of TT Combination ="${double[TT]}
