#!/bin/bash

BLANK='\033[m'
RED='\033[31m'
GREEN='\033[32m'

clear_lines() {
  echo -en "\033[$1A"
  echo -en "\033[J"
}

# Check if directories for config and dotfiles are given.
if [ $# -eq 2 ]; then
  config_dir=$1
  dotfile_dir=$2
else
  config_dir=~/.config/
  dotfile_dir=~/.dotfiles/
fi

# Get all dotfiles (sorted folders).
folders=()
while IFS= read -r dir; do
  [[ -d "$dir" && ! "$dir" =~ /\..* ]] && folders+=("$(basename "$dir")")
done < <(find . -maxdepth 1 -type d)
folders=("${folders[@]:1}")
IFS=$'\n' options=($(sort <<<"${folders[*]}")); unset IFS
menu_length=$((${#options[@]}+3))

for i in ${!options[@]}; do
  found=$(find ${config_dir} -lname ${dotfile_dir}${options[i]}/)
  [[ "${found}" ]] && choices[i]="${GREEN}" || choices[i]=""
done

# I used a menu idea proposed in the link below for my implementation.
# https://serverfault.com/questions/144939/multi-select-menu-in-bash-script
menu() {
  echo "--------------------------------"
  for i in ${!options[@]}; do 
    printf "%3d) ${RED}${choices[i]:-}%s${BLANK}\n" $((i+1)) "${options[i]}"
  done
  echo "--------------------------------"
  if [[ "$msg" ]]; then echo "$msg"; fi
}

prompt="Select (green) or deselect (red) dotfiles (<ENTER> when done): "
while menu && read -rp "${prompt}" num && [[ "$num" ]];
do
  clear_lines "${menu_length}"
  [[ "$num" != *[![:digit:]]* ]] &&
  (( num > 0 && num <= ${#options[@]} )) ||
  { continue; }
  ((num--));
  [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="${GREEN}"
done

# Add or remove symlinks as necessary.
clear_lines 1
for i in "${!options[@]}"; do 
  target="${config_dir}${options[i]}"
  if [[ -z "${choices[i]}" ]]; then
    if [[ -L "$target" ]]; then
      unlink "$target"
      printf "%3d) Removed symlink:        $target\n" $((i+1))
    fi
  else
    if [[ ! -L "$target" ]]; then
      ln -s "${dotfile_dir}${options[i]}/" "$target"
      printf "%3d) Created symlink:        $target\n" $((i+1))
    else
      printf "%3d) Symlink already exists: $target\n" $((i+1))
    fi
  fi
done
