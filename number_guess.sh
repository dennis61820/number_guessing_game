#!/bin/bash


# # generate a number between 1 and 1000
NUMBER=$(($RANDOM % 1000 + 1))
echo $NUMBER
  echo -e "\nEnter your username:"
read USER_NAME

  echo -e "\nGuess the secret number between 1 and 1000:"



GUESS_NUM () {
  
  
  read GUESS 
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    GUESS_NUM 
  fi

  # 1 number correct
    if [[ $GUESS == $NUMBER ]]
    then
      echo -e "\nYou guessed it in <number_of_guesses> tries. The secret number was $NUMBER. Nice job!" 
  # 2 number low
    elif [[ $GUESS > $NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      GUESS_NUM
  # 3 number high 
    elif [[ $GUESS < $NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      GUESS_NUM
 
      
  fi
  
}


# prompt for user name
GUESS_NUM

# if first time welcome and mention first time

# if not welcome and give play history

# prompt to guess number


# if not integet prompt again


# if lower say lower


# prompt again

# if higher say higher


# prompt again

# on success say how many tries it took



