![](./logo.png)

This project is a simple tool to update/merge ALL branches with other branch, e.g. Master or Main branches.

# Usage

## Download

`git clone https://github.com/italojs/gittera.git`

`cd gittera`

## Execute script
In your terminal, type

`sh ./gittera.sh <MERGE_BRANCH_NAME> <START_PATTERN>`

or

`sh ./gittera.sh`

In the second option the script will ask you the branch name that you want to merge with all others.
```
> sh ./gittera.sh
> Type your main branch: 
```

### Ags
- MERGE_BRANCH_NAME: Branch's name that you want to merge, e.g. master, main...
- START_PATTERN: This merge will happens only in branches that starts with this args, e.g. release-12-s34, if you wnat to update all ranches, let it empty


