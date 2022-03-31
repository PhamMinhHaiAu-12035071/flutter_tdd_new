#!/bin/bash -e
# ./gradlew connected[Flavor]DebugAndroidTest
usage() { echo "Usage: $0 [-e <dev|stg|prod>] [-f <debug|profile|release>] [-p <path file>]" 1>&2; exit 0; }

[ $# -eq 0 ] && usage
while getopts ":e:f:p:h" arg; do
  case $arg in
    e)
      env=${OPTARG}
      envUpperFirstLetter="$(tr '[:lower:]' '[:upper:]' <<< "${env:0:1}")${env:1}"
      ;;
    f)
      flavor=${OPTARG}
      flavorUpperFirstLetter="$(tr '[:lower:]' '[:upper:]' <<< "${flavor:0:1}")${flavor:1}"
      ;;
    p)
      pathFile=${OPTARG}
      ;;
    h | *)
      usage
      exit 0
      ;;
  esac
done

appConnect="connected${envUpperFirstLetter}${flavorUpperFirstLetter}AndroidTest";

cd android/

./gradlew app:"${appConnect}" \
    -PtestBuildType="${flavor}" \
		-Ptarget="${PWD}"/../integration_test/"${pathFile}"

sleep 1
cd ../
