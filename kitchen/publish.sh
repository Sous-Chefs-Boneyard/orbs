#!/usr/bin/env bash

main(){
  local version=${1:?Please specify a version to publish}

  circleci orb validate orb.yml

  git tag "${version}"
  git push --tags

  circleci orb publish orb.yml "sous-chefs/kitchen@${version}"
}

main "$@"
