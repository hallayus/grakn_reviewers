import json
import io
import gzip

try:
    to_unicode = unicode
except NameError:
    to_unicode = str


def parse(path):
  g = gzip.open(path, 'r')
  for l in g:
    yield eval(l)

strict_json = parse("~/workspace/amazonreviews/data/meta_Apps_for_Android.json.gz")

#load categories
wdict = {}
category_tree = {}
print "categories"
for json_entry in strict_json:
	categories_list = json_entry["categories"]

	for categories in categories_list:
		for category in categories:
		    try:
		        wdict[category] += 0
		    except KeyError:
		        wdict[category] = 1
		        print '"' + category.replace('"','').replace('\\','').replace(' ','-') + '"'


