# Demo for Voting app on top of OpenShift

It comprises of 3 repos:

* https://github.com/containers-prague/demo-result-app/
* https://github.com/containers-prague/demo-voting-app/
* https://github.com/containers-prague/demo-worker/

Each represents a container which serves single purpose:

* Result App - displays results from Postgres
* Voting App - let's people vote and stores in Redis
* Worker - processes queue in Redis and pushes data to Postgres

Other (already mentioned) containers in the system are:

* Redis - queue of votes
* Postgres - "permanent" sotrage of results

This is based on https://github.com/alexvanboxel/k8s-docker-vote and addapted to work well with OpenShift

# How to Run

1. Login in to OpenShift and create a project
2. Run `./deploy.sh`
3. A lot of resources should be created in OpenShift
4. Watch whole app start
5. Vote;)