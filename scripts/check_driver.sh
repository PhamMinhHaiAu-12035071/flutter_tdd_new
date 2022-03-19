#!/bin/bash -e

while getopts d: flag
do
    # shellcheck disable=SC2220
    case "${flag}" in
        d) driver=${OPTARG};;
    esac
done

case $driver in
  "chromedriver")
    checkChromeDriver=$(brew list | grep 'chromedriver' | wc -l)
    if [[ $checkChromeDriver -eq "0" ]]
    then
      echo "install chromedriver";
      brew install --cask chromedriver
    else
      echo "chromedriver is installed";
    fi
    ;;

  "geckodriver")
    checkGeckodriver=$(brew list | grep 'geckodriver' | wc -l)
    if [[ $checkGeckodriver -eq "0" ]]
    then
      echo "install geckodriver";
      brew install geckodriver
    else
      echo "geckodriver is installed";
    fi
    ;;
esac
