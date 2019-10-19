# CircleCI Orb For Sous-chefs

This repository contains the [Sous-Chefs orb](https://circleci.com/orbs/registry/orb/sous-chefs/kitchen)

## View Source

```bash
circleci orb source sous-chefs/kitchen@2
```

## Usage

Include the orb and give it a namespace, in this case `kitchen`

Then use the orb in a workflow.

Orbs can be used with semantic version pins - see [CircleCI documentation](https://circleci.com/docs/2.0/creating-orbs/#semantic-versioning-in-orbs)

### Usage

The sous-chef standard for running platform tests is `kitchen/dokken-single` for every platform
and each test should require `lint_and_unit` to allow circleCI to perform parallel builds.

To generate your circle yaml config utilize:

1. Alias `dokken` to `KITCHEN_LOCAL_YAML=kitchen.dokken.yml kitchen`
1. Run `dokken list`, you should see a list of builds with dokken as the provider
1. Download: [this script](https://github.com/sous-chefs/repo-management/blob/master/scripts/circleci_maker.rb) and make sure this is executable
1. Run: `dokken list -j | ./circleci_maker.rb > .circleci/config.yml`
---
```yaml

lint_and_unit: &lint_and_unit
  - delivery
  - danger
  - lint-yaml
  - lint-markdown

version: 2.1
orbs:
  kitchen: sous-chefs/kitchen@2

workflows:
  kitchen:
    jobs:
      # Lint and Unit Test
      - kitchen/yamllint:
          name: lint-yaml
      - kitchen/mdlint:
          name: lint-markdown
      - kitchen/danger:
          name: danger
          context: Danger
      - kitchen/delivery:
          name: delivery

      # Run multiple platforms at once
      - kitchen/dokken-single:
          name: default
          suite: default
          requires:
            *lint_and_unit

      # Run a single platform
      - kitchen/dokken-single:
          suite: default-centos-7
          name: default-centos-7
          requires:
            *lint_and_unit
```
