rm -r ~/workspace/amazonreviews/data/split
mkdir ~/workspace/amazonreviews/data/split
split -b 512k ~/workspace/amazonreviews/data/$1 ~/workspace/amazonreviews/data/split/$1. 

for f in ~/workspace/amazonreviews/data/split/$1.*
do
	echo '[' | cat - $f > ~/workspace/amazonreviews/data/temp && mv ~/workspace/amazonreviews/data/temp $f
	echo ']' >> ~/workspace/amazonreviews/data/todo.txt
	perl -pe 's/\n/$1,/' $f > $f.temp && mv $f.temp $f
done