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

def reviwerName(entry):
	if "reviewerName" in entry:
		return entry["reviewerName"].replace('"','').replace('\\','')
	else:
		return "unknown"

strict_json = parse("~/workspace/amazonreviews/data/reviews_Apps_for_Android_5.json.gz")
userdict = {x["reviewerID"] : reviwerName(x) for x in strict_json}

print 'reviewerId,reviewerName'
for userId, userName in userdict.iteritems():
	print '"' + userId + '","' + userName + '"'

