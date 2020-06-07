# Build by KAI VO
# Service SSH with script bash shell 

 docker build -t testing .
 docker run -ti -d -p 212:22 --name webs testing
 docker exec -it webs bash

 # testing packages tree install on file scripts
 # command tree
 tree 