while IFS= read -r line; do
cp ../../vim/tutor $line
done < user_list.txt

for dir in */; do
cp ../../vim/tutor.cs.new $dir/
done
