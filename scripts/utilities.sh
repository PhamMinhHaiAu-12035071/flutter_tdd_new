#!/bin/bash -e

function printTable()
{
    local -r delimiter="${1}"
    local -r tableData="$(removeEmptyLines "${2}")"
    local -r colorHeader="${3}"
    local -r displayTotalCount="${4}"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${tableData}")" = 'false' ]]
    then
        local -r numberOfLines="$(trimString "$(wc -l <<< "${tableData}")")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${tableData}")"

                local numberOfColumns=0
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                # Add Header Or Body

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#|  %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                local output=''
                output="$(echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1')"

                if [[ "${colorHeader}" = 'true' ]]
                then
                    echo -e "\033[1;32m$(head -n 3 <<< "${output}")\033[0m"
                    tail -n +4 <<< "${output}"
                else
                    echo "${output}"
                fi
            fi
        fi

        if [[ "${displayTotalCount}" = 'true' && "${numberOfLines}" -ge '0' ]]
        then
            echo -e "\n\033[1;36mTOTAL ROWS : $((numberOfLines - 1))\033[0m"
        fi
    fi
}

function removeEmptyLines()
{
    local -r content="${1}"

    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString()
{
    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "$(isPositiveInteger "${numberToRepeat}")" = 'true' ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function replaceString()
{
    local -r content="${1}"
    local -r oldValue="$(escapeSearchPattern "${2}")"
    local -r newValue="$(escapeSearchPattern "${3}")"

    sed "s@${oldValue}@${newValue}@g" <<< "${content}"
}

function stringToNumber()
{
    local -r string="${1}"

    checkNonEmptyString "${string}" 'undefined string'

    if [[ "$(existCommand 'md5')" = 'true' ]]
    then
        md5 <<< "${string}" | tr -cd '0-9'
    elif [[ "$(existCommand 'md5sum')" = 'true' ]]
    then
        md5sum <<< "${string}" | tr -cd '0-9'
    else
        fatal '\nFATAL : md5 or md5sum command not found'
    fi
}

function stringToSearchPattern()
{
    local -r string="$(trimString "${1}")"

    if [[ "$(isEmptyString "${string}")" = 'true' ]]
    then
        echo "${string}"
    else
        echo "^\s*$(sed -e 's/\s\+/\\s+/g' <<< "$(escapeSearchPattern "${string}")")\s*$"
    fi
}

function trimString()
{
    local -r string="${1}"

    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}

function isEmptyString()
{
    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}
function isPositiveInteger()
{
    local -r string="${1}"

    if [[ "${string}" =~ ^[1-9][0-9]*$ ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

printTable "," "$(cat ./scripts/man_help.txt)" "true" "true"
