#!/usr/bin/env bash

key() {

    [[ $1 == $'\e' ]] && {
        local special_keys

        special_keys+=${1}
        #! debug
        printf "R 1 : %q\n" "${1}"
        
        # \e A
        # \e [ A
        # \e [ 6 ~
        # \e [ 2 0 ~
        # \e [ 1 ; 5~
        # \e [ 1 ; 5C
        # -- - - - --
        #  1 2 3 4 5

        #* read 2
        read "${read_flags[@]}" -srn 1
        special_keys+=${REPLY}
        #! debug
        printf "R 2 : %q\n" "${REPLY}"

        [[ $REPLY == $'[' || $REPLY == 'O' ]] && {
            #* read 3
            read "${read_flags[@]}" -srn 1
            special_keys+=${REPLY}
            #! debug
            printf "R 3 : %q\n" "${REPLY}"

            [[ ${REPLY} == [0-9] ]] && {
                #* read 4
                read "${read_flags[@]}" -srn 1
                special_keys+=${REPLY}
                #! debug
                printf "R 4 : %q\n" "${REPLY}"
                
                [[ ${REPLY} == [[:digit:]] ]] && {
                    read "${read_flags[@]}" -srn 1 _
                    special_keys+="~"
                }

                [[ ${REPLY} == ";" ]] && {
                    read "${read_flags[@]}" -srn 2
                    special_keys+=${REPLY}
                    #! debug
                    printf "R 5 : %q\n" "${REPLY}"
                }
            }
        }
        
    }

    case "${special_keys:-$1}" in
        # Backspace.
        $'\b'|$'\177')
            printf '%s\n' "key: \$'\\b' or \$'\\177'"
        ;;

        # Return / Enter.
        "")
            printf '%s\n' "key: \" \""
        ;;

        # Everything else.
        *)
            printf '%s %q\n' "key:" "${special_keys:-$1}"
        ;;
    esac

    printf "%s\n" "-----------------------------"

}

read_flags=(-t 0.01)

read -srn 1 && key "$REPLY"