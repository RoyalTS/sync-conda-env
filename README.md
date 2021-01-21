# sync-conda-env pre-commit hook

This pre-commit hook makes sure the `environment.yml` in the repo root is up to date with the currently active conda environment

To use it, add the following to your `.pre-commit-config.yaml`:

```yaml
- repo: ../sync-conda-env
  rev: v0.1.0
  hooks:
  - id: sync-conda-env
```

In addition you can add a number of `args` to the above:

```yaml
    args: []
```

where the list can contain

- [`--from-history`](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#exporting-an-environment-file-across-platforms) includes only the packages directly installed, without their dependencies or build infos
- [`--no-builds`](https://veranostech.github.io/docs-korean-conda-docs/docs/build/html/commands/env/conda-env-export.html) excludes build info from the package list
- `--mutate` will update the `environment.yml`
