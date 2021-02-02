# codeready-workspaces-theia
CodeReady Workspaces build of Theia, based on eclipse/che-theia project

## Create dockerfiles for theia in brew

./build.sh will:
- fetch che-theia
- generate `:next` tmp images from ubi8 config to be used for grabing assets
- generate into `dockerfiles` directory the assets / Dockerfile



Steps: 
- `./build.sh`
- check `dockerfiles` directory with ready-to-go Dockerfile with already included in folders


### NOTE

The Jenkinsfiles in this repo have moved. See:

* https://main-jenkins-csb-crwqe.apps.ocp4.prod.psi.redhat.com/job/CRW_CI/ (jobs)
* https://gitlab.cee.redhat.com/codeready-workspaces/crw-jenkins/-/tree/master/jobs/CRW_CI (sources)
* https://github.com/redhat-developer/codeready-workspaces-images#jenkins-jobs (copied sources)
