list1=()

for word in `cat words.txt`
do
   mapfile -t list1a < <(cat localstt.dic |grep "^$word\s"| head -1)
   list1=("${list1[@]}" "${list1a[@]}")
done

printf '%s\n' "${list1[@]}"
echo ""
