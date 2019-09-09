#!/usr/bin/env bash

main(){
  local version=${1:?Please specify a version to publish}

  git tag "${version}"
  git push --tags

  circleci orb publish orb.yml "sous-chefs/kitchen@${version}"
}

main "$@"
