#!/bin/bash

folders=()
while IFS= read -r dir; do
  [[ -d "$dir" && ! "$dir" =~ /\..* ]] && folders+=("$(basename "$dir")")
done < <(find . -maxdepth 1 -type d)
folders=("${folders[@]:1}")

# https://serverfault.com/questions/144939/multi-select-menu-in-bash-script
options=("${folders[@]}")

menu() {
  clear
  for i in ${!options[@]}; do 
    printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
  done
  if [[ "$msg" ]]; then echo "$msg"; fi
}

prompt="Check an option (again to uncheck, ENTER when done): "

while menu && read -rp "$prompt" num && [[ "$num" ]];
do
  [[ "$num" != *[![:digit:]]* ]] &&
  (( num > 0 && num <= ${#options[@]} )) ||
  { continue; }
  ((num--));
  [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
done

for i in ${!options[@]}; do 
  [[ "${choices[i]}" ]] && { find ~/.config/ -lname ~/.dotfiles/"${options[i]}"/; }
done
