echo '{"entries":[' | cat - $1 > ~/workspace/amazonreviews/data/temp && echo ']}' >> ~/workspace/amazonreviews/data/temp && perl -pe 's/\n/$1,/' ~/workspace/amazonreviews/data/temp > $1.new
