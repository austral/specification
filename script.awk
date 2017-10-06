{ printf "| sed 's/&"; printf $1; printf ";/"; $1=""; printf substr($0,2); printf "/g' " }
