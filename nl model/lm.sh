list1=()
list2=()
list3=()
list4=()

   mapfile -t list1a < <(cat localstt.lm |grep -P '\t<s>'| head -1)
   list1=("${list1[@]}" "${list1a[@]}")
   mapfile -t list1a < <(cat localstt.lm |grep -P '\t</s>'| head -1)
   list1=("${list1[@]}" "${list1a[@]}")

for word in `cat words.txt`
do
   mapfile -t list1a < <(cat localstt.lm |grep -P '\t'+"$word"| head -1)
   list1=("${list1[@]}" "${list1a[@]}")
   mapfile -t list2a < <(cat localstt.lm |grep "<s> $word"| head -1)
   list2=("${list2[@]}" "${list2a[@]}")
   mapfile -t list3a < <(cat localstt.lm |grep -P '\t'+"$word <s>"| head -1)
   list3=("${list3[@]}" "${list3a[@]}")
   mapfile -t list4a < <(cat localstt.lm |grep "> $word <"| head -1 )
   list4=("${list4[@]}" "${list4a[@]}")
done

echo '\data\'
printf 'ngram 1=%s\n' "${#list1[@]}"
printf 'ngram 2=%s\n' "${#list2[@]}"
printf 'ngram 3=%s\n' "${#list4[@]}"
printf '\n%s\n' "\1-grams:"
printf '%s\n' "${list1[@]}"
printf '\n%s\n' "\2-grams:"
printf '%s\n' "${list2[@]}"
printf '%s\n' "${list3[@]}"
printf '\n%s\n' "\3-grams:"
printf '%s\n' "${list4[@]}"
echo ""
echo '\end\'
