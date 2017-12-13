import sys, json, random, os

stopwords = os.environ['CHAOS_MONKEY_EXCLUDES'].split()

pods = []

data = json.load(sys.stdin)
for p in data['items']:
  pods.append(p["metadata"]["name"])

tmp = list(pods)
for pod in tmp:
  #print "procesing pod: " + pod
  for word in stopwords:
     if word in pod:
       pods.remove(pod)

#for pod in pods:
#  print pod

print(random.choice(pods))

