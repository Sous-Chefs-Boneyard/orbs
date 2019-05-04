# CircleCI Orb For Sous-chefs

This repository contains the [Sous-Chefs orb](https://circleci.com/orbs/registry/orb/sous-chefs/kitchen)

## View Source

```bash
circleci orb source sous-chefs/kitchen@1.1.2
```

## Usage

Include the orb and give it a namespace, in this case `kitchen`

Then use the orb in a workflow.

Orbs can be used with semantic version pins - see [CircleCI documentation](https://circleci.com/docs/2.0/creating-orbs/#semantic-versioning-in-orbs)

### Version 1.1.2

```yaml
---
# Use yaml anchors so we can get rid of some duplicated information
lint_and_unit: &lint_and_unit
  - delivery
  - danger
  - lint-yaml
  - lint-markdown

version: 2.1
orbs:
  kitchen: sous-chefs/kitchen@1.1.2

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
      - kitchen/dokken:
          name: source-17
          suite: source-17
          requires:
            *lint_and_unit

      # Run a single platform
      - kitchen/dokken-single:
          suite: default-centos-7
          name: default-centos-7
          requires:
            *lint_and_unit
```

## Contributors

This project exists thanks to all the people who contribute.
<img src="https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false" /></a>


### Backers

Thank you to all our backers! 🙏 [[Become a backer](https://opencollective.com/sous-chefs#backer)]
<a href="https://opencollective.com/sous-chefs#backers" target="_blank"><img src="https://opencollective.com/sous-chefs/backers.svg?width=890"></a>

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/sous-chefs#sponsor)]
<a href="https://opencollective.com/sous-chefs/sponsor/0/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/1/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/2/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/3/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/4/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/5/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/6/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/7/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/8/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/9/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/9/avatar.svg"></a>
