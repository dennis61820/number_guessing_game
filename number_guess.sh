#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# create database "number_guess"
# add columns "name", "game_date" "number_of_tries"

NUMBER_OF_GUESSES=0

 # generate a number between 1 and 1000
NUMBER=$(($RANDOM % 1000 + 1))
#echo -e "\nthe number is $NUMBER"

GET_USER () {

  echo -e "\nEnter your username:"
read USER_NAME

# check if user exists
USER=$($PSQL "select name from players where name = '$USER_NAME'" )
#echo -e "you are $USER"

if [[ -z $USER ]]
then
  INSERT_RESULT=$($PSQL "insert into players(name) values('$USER_NAME')")
  if [[ ! $? -eq 0 ]]
  then
  echo -e "\nPlease choose a name shorter than 23 characters:"
  read USER_NAME
  fi

#echo $USER

   echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."

 else
  NUM_OF_GAMES=$($PSQL "select count(g.game_date) from games as g join players as p using(player_id) where p.name = '$USER'")
  NUM_OF_GUESSES=$($PSQL "select g.num_guesses from games as g join players as p using(player_id) where p.name = '$USER'")
  BEST_GAME=$($PSQL "select min(g.num_guesses) from games as g join players as p using(player_id) where p.name = '$USER'")
   echo -e "\nWelcome back, $USER! You have played $NUM_OF_GAMES games, and your best game took $NUM_OF_GUESSES guesses."
fi
   echo -e "\nGuess the secret number between 1 and 1000:"
   PLAYER_ID=$($PSQL "select player_id from players where name = '$USER_NAME'")
  # echo -e "\nyour id is $PLAYER_ID"
   BEGIN_GAME=$($PSQL "insert into games(player_id) values($PLAYER_ID) ")
 
}
GET_USER



GUESS_NUM () {
  
  read GUESS
   let NUMBER_OF_GUESSES+=1
    let NUM_OF__GUESSES=$($PSQL "update games set num_guesses = $NUMBER_OF_GUESSES where player_id = $PLAYER_ID")
 # echo $NUMBER_OF_GUESSES
   
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    GUESS_NUM 
  fi
  
  # 1 number correct
    if [[ $GUESS == $NUMBER ]]
    then
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!" 
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


# if not integer prompt again


# if lower say lower


# prompt again

# if higher say higher


# prompt again

# on success say how many tries it took



