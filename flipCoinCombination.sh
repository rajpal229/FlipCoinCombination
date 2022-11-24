counter=0
index=0
total_heads=0
total_tails=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0
total_triplet_first_comb=0
total_triplet_second_comb=0
total_triplet_third_comb=0
total_triplet_fourth_comb=0
total_triplet_fifth_comb=0
total_triplet_sixth_comb=0
total_triplet_seventh_comb=0
total_triplet_eigth_comb=0

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

#Dictionary for triplet Combination
declare -A triplet
triplet[first_combination]=" "
triplet[second_combination]=" "
triplet[third_combination]=" "
triplet[fourth_combination]=" "
triplet[fifth_combination]=" "
triplet[sixth_combination]=" "
triplet[seventh_combination]=" "
triplet[eigth_combination]=" "
triplet[first_per]=0
triplet[second_per]=0
triplet[third_per]=0
triplet[fourth_per]=0
triplet[fifth_per]=0
triplet[sixth_per]=0
triplet[seventh_per]=0
triplet[eigth_per]=0

read -p "Enter how many times you want to flip the coin: " trail
while [ $counter -lt $trail ]
do
	flip1=$(($RANDOM%2))
	flip2=$(($RANDOM%2))
	flip3=$(($RANDOM%2))
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
	if [ $flip1 -eq 1 -a $flip2 -eq 1 ]
	then
		if [ $flip3 -eq 1 ]
		then
			((total_triplet_first_comb++))
			triplet[first_combination]="HHH"
		else
			((total_triplet_second_comb++))
			triplet[second_combination]="HHT"
		fi
	elif [ $flip1 -eq 1 -a $flip2 -eq 0 ]
	then
		if [ $flip3 -eq 1 ]
		then
			((total_triplet_third_comb++))
			triplet[third_combination]="HTH"
		else
			((total_triplet_fourth_comb++))
			triplet[fourth_combination]="HTT"
		fi
	elif [ $flip1 -eq 0 -a $flip2 -eq 1 ]
	then
		if [ $flip3 -eq 1 ]
		then
			((total_triplet_fifth_comb++))
			triplet[fifth_combination]="THH"
		else
			((total_triplet_sixth_comb++))
			triplet[sixth_combination]="THT"
		fi
	else
		if [ $flip1 -eq 0 -a $flip2 -eq 0 ]
		then
			if [ $flip3 -eq 1 ]
			then
				((total_triplet_seventh_comb++))
				triplet[seventh_combination]="TTH"
			else
				((total_triplet_eigth_comb++))
				triplet[eigth_combination]="TTT"
			fi
		fi
	fi

        ((counter++))
done

echo "Combination of Singlet,Doublet,Triplet"
echo "Singlet Combination of first flip" ${singlet[head]} ${singlet[tails]}
singlet[H]=$(echo $total_heads $trail | awk '{print $1/$2}')
echo "Percentage of head ="${singlet[H]}

singlet[T]=$(echo $total_tails $trail | awk '{print $1/$2}')
echo "Percentage of tails =" ${singlet[T]}

echo "Doublet Combination of first two flip" ${double[first_combination]} ${double[second_combination]} ${double[third_combination]} ${double[fourth_combination]}
double[HH]=$(echo $total_first_comb $trail | awk '{print $1/$2}')
echo "Percentage of HH Combination of first two flip="${double[HH]}

double[HT]=$(echo $total_second_comb $trail | awk '{print $1/$2}')
echo "Percentage of HT Combination of first two flip="${double[HT]}

double[TH]=$(echo $total_third_comb $trail | awk '{print $1/$2}')
echo "Percentage of TH Combination of first two flip="${double[TH]}

double[TT]=$(echo $total_fourth_comb $trail | awk '{print $1/$2}')
echo "Percentage of TT Combination of first two flip="${double[TT]}

echo -n "Triplet Combination" ${triplet[first_combination]} ${triplet[second_combination]} ${triplet[third_combination]} ${triplet[fourth_combination]} 
echo " "${triplet[fifth_combination]} ${triplet[sixth_combination]} ${triplet[seventh_combination]} ${triplet[eigth_combination]}

triplet[HHH]=$(echo $total_triplet_first_comb $trail | awk '{print $1/$2}') 
echo "Percentage of" ${triplet[first_combination]} "Combination ="${triplet[HHH]}

triplet[HHT]=$(echo $total_triplet_second_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[second_combination]} "Combination ="${triplet[HHT]} 

triplet[HTH]=$(echo $total_triplet_third_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[third_combination]} "Combination ="${triplet[HTH]}

triplet[HTT]=$(echo $total_triplet_fourth_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[fourth_combination]} "Combination ="${triplet[HTT]}

triplet[THH]=$(echo $total_triplet_fifth_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[fifth_combination]} "Combination ="${triplet[THH]} 

triplet[THT]=$(echo $total_triplet_sixth_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[sixth_combination]} "Combination ="${triplet[THT]}

triplet[TTH]=$(echo $total_triplet_seventh_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[seventh_combination]} "Combination ="${triplet[TTH]}

triplet[TTT]=$(echo $total_triplet_eigth_comb $trail | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[eigth_combination]} "Combination ="${triplet[TTT]}
