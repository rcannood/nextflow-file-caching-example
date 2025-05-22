# Nextflow File Caching Example

This repository provides a small example of large asset (repository) directories not being correctly cached by nextflow.


# Small asset directories cache as expected

## Cleaning the repository

```
nextflow drop DriesSchaumont/nextflow-file-caching-example; rm -rf .nextflow && rm -rf .nextflow.log* && rm -rf work
```

## Example of correct caching

By using `--asset_size small`, the directory `assets_small` is used as the input in the process.

```
nextflow run DriesSchaumont/nextflow-file-caching-example -r 894de23c7aa15e74e858071647d665d2ed508692 --asset_size small &&
nextflow drop DriesSchaumont/nextflow-file-caching-example &&
nextflow run DriesSchaumont/nextflow-file-caching-example -r 894de23c7aa15e74e858071647d665d2ed508692 --asset_size small -resume
```


# Example of incorrect caching

## Cleaning the repository (again)

```
nextflow drop DriesSchaumont/nextflow-file-caching-example; rm -rf .nextflow && rm -rf .nextflow.log* && rm -rf work
```

## Example of directory not being caches

By using `--asset_size large`, the directory `assets` is used as the input in the process.
It contains 5 extra files containing random data, to increase the size of the directory for demonstration purposes.

```
nextflow run DriesSchaumont/nextflow-file-caching-example -r 894de23c7aa15e74e858071647d665d2ed508692 --asset_size large &&
nextflow drop DriesSchaumont/nextflow-file-caching-example &&
nextflow run DriesSchaumont/nextflow-file-caching-example -r 894de23c7aa15e74e858071647d665d2ed508692 --asset_size large -resume
```

