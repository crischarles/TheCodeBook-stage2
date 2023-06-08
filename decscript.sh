#!/bin/bash
#
############################################################
#Author: Crischarles D. Arruda			   	   #					   
#							   #	
#This script can be applied only for:			   #
#-Caesar Cipher / shift cipher				   #
#							   #
############################################################

#Checking if sent file is valid

if [ -f "$1" ];
then
	echo "File exists"
	validation=$(file $1 | awk -F ': ' '{print $2}' | awk -F ' ' '{print $2}')
	
	if [[ $validation == "text"* ]];
	then
		echo "and it's a valid file"
	else
		echo "but it's an invalid file, please sent a text file"
		exit 1
	fi	
else
	echo "File doesn't exist"
	exit 1
fi

#Alphabet array for deciphering 
abcdec=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

#Function to count letters from the file
function countletters(){
	position=0

	for l in {A..Z};
	do	
		filefr[$position]=$(grep -o "$l" "$1" | wc -l)
		abc[$position]="$l"
		((position++))
	done	
}

#Function to capture waves
function waves(){
	largest=0
	
	for i in {0..25};
	do
		if [[ largest -lt ${filefr[$i]} ]];
		then
			largest=${filefr[$i]}
			letter=${abc[$i]}
			position=$i
		fi
	done
	
	filefr[$position]=0
}

#Count between waves
function btwcount(){
	for i in {0..25};
	do 
		if [[ ${abc[$i]} == $wave1 ]];
		then
			pwave1=$i
		elif [[ ${abc[$i]} == $wave2 ]];
		then
			pwave2=$i
		elif [[ ${abc[$i]} == $wave3 ]];
		then
			pwave3=$i
		fi
	done

	#Searching for A based on A and E position
	#E is 4 letters after A
	btw=4
	
	if (( btw == $((pwave2 - pwave1)) ));
	then
		aposition=$pwave1
	elif (( btw == $((pwave3 - pwave2)) ));
	then
		aposition=$pwave2
	elif (( btw == $((pwave1 - pwave3)) ));
	then
		aposition=$pwave3
	else
		echo "unable to decipher"
		exit 1
	fi
}

function decfunction(){
        decfilepath=/tmp/decfile.txt
        cat "$1" | tr '[:upper:]' '[:lower:]' > $decfilepath

	for i in {0..25}
	do
		iplusa=$((i + aposition))
		
		if ((iplusa < 26));
		then
			tr "${abcdec[$iplusa]}" "${abc[$i]}" < $decfilepath > /tmp/decfiletmp.txt && mv /tmp/decfiletmp.txt $decfilepath
		else
			iplusa=$((iplusa - 26))
			tr "${abcdec[$iplusa]}" "${abc[$i]}" < $decfilepath > /tmp/decfiletmp.txt && mv /tmp/decfiletmp.txt $decfilepath
		fi	
	done

	echo "here is your deciphered message"
	cat $decfilepath
}

countletters $1

waves
wave1=$letter
waves
wave2=$letter
waves
wave3=$letter

btwcount 

decfunction $1

