#!/usr/bin/env groovy

// PARAMETERS for this pipeline:
// SCRATCH = true (don't push to Quay) or false (do push to Quay)
// GIT_BRANCH = crw-2.2-rhel-8

def buildNode = "rhel7-releng" // node label
def JOB_BRANCH = "master" // used to differentiate job URLs when pulling artifacts into dist-git

timeout(360) {
  node("${buildNode}"){
    stage "rhpkg container-builds"
	  wrap([$class: 'TimestamperBuildWrapper']) {

    def CRW_VERSION = sh(script: '''#!/bin/bash -xe
    wget -qO- https://raw.githubusercontent.com/redhat-developer/codeready-workspaces/''' + GIT_BRANCH + '''/dependencies/VERSION
    ''', returnStdout: true)
    println "Got CRW_VERSION = '" + CRW_VERSION.trim() + "'"

    echo "currentBuild.result = " + currentBuild.result
    if (!currentBuild.result.equals("ABORTED") && !currentBuild.result.equals("FAILED")) {
      
        def QUAY_REPO_PATHs=(env.ghprbPullId && env.ghprbPullId?.trim()?"":("${SCRATCH}"=="true"?"":"theia-dev-rhel8"))
        echo "[INFO] Trigger get-sources-rhpkg-container-build " + (env.ghprbPullId && env.ghprbPullId?.trim()?"for PR-${ghprbPullId} ":"") + \
        "with SCRATCH = ${SCRATCH}, QUAY_REPO_PATHs = ${QUAY_REPO_PATHs}, JOB_BRANCH = ${JOB_BRANCH}"

        // trigger OSBS build
        build(
          job: 'get-sources-rhpkg-container-build',
          wait: true,
          propagate: true,
          parameters: [
            [
              $class: 'StringParameterValue',
              name: 'GIT_PATHs',
              value: "containers/codeready-workspaces-theia-dev",
            ],
            [
              $class: 'StringParameterValue',
              name: 'GIT_BRANCH',
              value: "${GIT_BRANCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'QUAY_REPO_PATHs',
              value: "${QUAY_REPO_PATHs}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'SCRATCH',
              value: "${SCRATCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'JOB_BRANCH',
              value: "${JOB_BRANCH}",
            ]
          ]
        )

        QUAY_REPO_PATHs=(env.ghprbPullId && env.ghprbPullId?.trim()?"":("${SCRATCH}"=="true"?"":"theia-rhel8"))
        echo "[INFO] Trigger get-sources-rhpkg-container-build " + (env.ghprbPullId && env.ghprbPullId?.trim()?"for PR-${ghprbPullId} ":"") + \
        "with SCRATCH = ${SCRATCH}, QUAY_REPO_PATHs = ${QUAY_REPO_PATHs}, JOB_BRANCH = ${JOB_BRANCH}"

        // trigger OSBS build
        build(
          job: 'get-sources-rhpkg-container-build',
          wait: true,
          propagate: true,
          parameters: [
            [
              $class: 'StringParameterValue',
              name: 'GIT_PATHs',
              value: "containers/codeready-workspaces-theia",
            ],
            [
              $class: 'StringParameterValue',
              name: 'GIT_BRANCH',
              value: "${GIT_BRANCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'QUAY_REPO_PATHs',
              value: "${QUAY_REPO_PATHs}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'SCRATCH',
              value: "${SCRATCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'JOB_BRANCH',
              value: "${JOB_BRANCH}",
            ]
          ]
        )

        QUAY_REPO_PATHs=(env.ghprbPullId && env.ghprbPullId?.trim()?"":("${SCRATCH}"=="true"?"":"theia-endpoint-rhel8"))
        echo "[INFO] Trigger get-sources-rhpkg-container-build " + (env.ghprbPullId && env.ghprbPullId?.trim()?"for PR-${ghprbPullId} ":"") + \
        "with SCRATCH = ${SCRATCH}, QUAY_REPO_PATHs = ${QUAY_REPO_PATHs}, JOB_BRANCH = ${JOB_BRANCH}"

        // trigger OSBS build
        build(
          job: 'get-sources-rhpkg-container-build',
          wait: true,
          propagate: true,
          parameters: [
            [
              $class: 'StringParameterValue',
              name: 'GIT_PATHs',
              value: "containers/codeready-workspaces-theia-endpoint",
            ],
            [
              $class: 'StringParameterValue',
              name: 'GIT_BRANCH',
              value: "${GIT_BRANCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'QUAY_REPO_PATHs',
              value: "${QUAY_REPO_PATHs}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'SCRATCH',
              value: "${SCRATCH}",
            ],
            [
              $class: 'StringParameterValue',
              name: 'JOB_BRANCH',
              value: "${JOB_BRANCH}",
            ]
          ]
        )
    } else {
      echo "[ERROR] Build status is " + currentBuild.result + " from previous stage. Skip!"
    }
   }
  }
}
