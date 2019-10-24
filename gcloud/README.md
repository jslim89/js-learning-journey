# Lesson

## Add service account to gcloud cli

```
$ gcloud auth activate-service-account --key-file=service-account-key.json
```

Reference: [gcloud cheat sheet.md](https://gist.github.com/pydevops/cffbd3c694d599c6ca18342d3625af97)

## Basic file command to Google Cloud Storage (GCS)

```
$ gsutil ls gs://bucket-name
$ gsutil cp gs://bucket-name/path/to/file.log ~/Download/
```

Reference: [Listing buckets](https://cloud.google.com/storage/docs/listing-buckets)
