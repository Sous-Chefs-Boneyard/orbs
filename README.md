# CircleCI Orb For Sous-chefs

This repository contains the preview feature [orbs](https://github.com/CircleCI-Public/config-preview-sdk/tree/master/docs)


## View Source

```bash
circleci orb source sous-chefs kitchen
```

## Usage

Include the orb and give it a namespace, in this case `kitchen`

Then use the orb in a workflow.

### Version 1.0.2
Inlcudes support for amazonlinux-2 and drops fedora

```yaml
version: 2.1

orbs:
  kitchen: sous-chefs/kitchen@1.0.2

workflows:
  kitchen:
    jobs:
      - kitchen/danger:
          name: danger
          context: Danger
      - kitchen/delivery:
          name: delivery
      - kitchen/dokken:
          name: global
          suite: global
          requires: [ danger, delivery ]
      - kitchen/dokken-single:
          name: system-install
          suite: system-install
          platform: centos-7
          requires: [ danger, delivery ]
```

### Version 1.0.1

```yaml
version: 2.1

orbs:
  kitchen: sous-chefs/kitchen@1.0.1

workflows:
  kitchen:
    jobs:
      - kitchen/lint:
          name: lint
      - kitchen/dokken:
          name: global
          suite: global
          requires: [ lint ]
      - kitchen/dokken-single:
          name: system-install
          suite: system-install
          platform: centos-7
          requires: [ lint ]
```
