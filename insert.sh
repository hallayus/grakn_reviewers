~/grakn/bin/graql.sh -k $1 -f ~/workspace/amazonreviews/graql/ontology.gql

python ~/workspace/amazonreviews/preprocessing/reviewers.py > ~/workspace/amazonreviews/preprocessing/users.txt
python ~/workspace/amazonreviews/preprocessing/products\&categories.py > ~/workspace/amazonreviews/preprocessing/categories.txt

~/grakn/bin/migration.sh csv -i ~/workspace/amazonreviews/preprocessing/users.txt -t ~/workspace/amazonreviews/graql/insert_users.gql -k $1
~/grakn/bin/migration.sh csv -i ~/workspace/amazonreviews/preprocessing/categories.txt -t ~/workspace/amazonreviews/graql/insert_categories.gql -k $1
~/grakn/bin/migration.sh json -i ~/workspace/amazonreviews/data/meta_Apps_for_Android_reformat.json -t ~/workspace/amazonreviews/graql/insert_products.gql -k $1

