# Lesson

## Configure aws CLI

### OS X

You need to have [homebrew](http://brew.sh/) installed

```
$ brew install awscli
$ aws configure
```

then put in your access ID & key _(don't know where to get, read [IAM doc](http://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html))_

Reference: [Bash with AWS CLI - unable to locate credentials](http://stackoverflow.com/questions/31425838/bash-with-aws-cli-unable-to-locate-credentials/31426381#31426381)

### Delete all pending queue items

```
$ aws sqs purge-queue --queue-url https://sqs.ap-southeast-1.amazonaws.com/123456789012/queue_name
```

Reference: [AWS purge-queue](https://docs.aws.amazon.com/cli/latest/reference/sqs/purge-queue.html)
